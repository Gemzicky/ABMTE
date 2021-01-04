//
//  ModelData.swift
//  ABMTE
//
//  Created by Maroš Gemzický on 02/01/2021.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
//    @Published var profile = Profile.default
    @Published var profile = Profile.default {
        didSet {
            UserDefaults.standard.set(profile.username, forKey: "username")
            UserDefaults.standard.set(profile.prefersNotifications, forKey: "prefersNotifications")
            UserDefaults.standard.set(profile.seasonalPhoto.id, forKey: "seasonalPhotoId")
            UserDefaults.standard.set(profile.goalDate, forKey: "goalDate")
        }
    }

    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }

    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }

    var loadCats: () = loadREST(urls: "https://cat-fact.herokuapp.com/facts/")
    var cats: [Cat] = load("myFile.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) ?? FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(filename)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func loadREST(urls: String) {
    let url = URL(string: urls)!
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print("Error loading data! \n\(error)")
            return
        }
        if let response = response as? HTTPURLResponse {
            let statusCode = response.statusCode
            if statusCode != 200 {
                print("\(url.absoluteString) returned bad status code: \(statusCode)!")
            } else {
                guard let data = data,
                      let medium = String(data: data, encoding: .utf8)
                else { return }
                let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                let fileURL = URL(fileURLWithPath: "myFile", relativeTo: directoryURL).appendingPathExtension("json")
                do {
                    try medium.write(to: fileURL, atomically: false, encoding: String.Encoding.utf8)
//                    print("File saved: \(fileURL.absoluteURL)")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }.resume()
}

public func randomCat() -> String {
    var i: Int
    let c = ModelData().cats.count
    i = Int.random(in: 1..<100) % c
    return ModelData().cats[i].text
}
