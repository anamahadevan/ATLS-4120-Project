//
//  ContentView.swift
//  Shared
//
//  Created by anabelle mahadevan on 8/28/23.
//

import SwiftUI


struct ImageOverlay: View {
    var body: some View {
        ZStack {
            Text("just a little guy")
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image("bmo")
                .resizable()
                .scaledToFit()
                .overlay(ImageOverlay(), alignment: .bottomTrailing)
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
