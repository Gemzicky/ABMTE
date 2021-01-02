//
//  ContentView.swift
//  ABMTE
//
//  Created by Maroš Gemzický on 02/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("ABMTE")
                    .font(.title)
                    .foregroundColor(.red)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack {
                    Text("záverečný projekt")
                        Spacer()
                    Text("2021")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                Text("Maroš Gemzický")
                    .font(.title2)
                Text("A19350")
            }
            .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
