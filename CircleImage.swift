//
//  CircleImage.swift
//  ABMTE
//
//  Created by Maroš Gemzický on 02/01/2021.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("conservation_hero_large_2x")
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
