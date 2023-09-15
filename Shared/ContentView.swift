//
//  ContentView.swift
//  Shared
//
//  Created by anabelle mahadevan on 8/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Assignment2View()
                .tabItem {
                    Label("#2", systemImage: "list.dash")
                }

            OtherPageView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}
    
struct IntroPageView: View{
    var body: some View {
        Text ("Just checking!");
    }
}
    
struct Assignment2View: View{
    @State private var beExcited = false;
    @State private var text = "bmo";
    
// function to make uppercase and append "!"
    func makeChange(_ input: String) -> String {
        //when the toggle is on, beExcited = true + make uppercase
        return beExcited ? input.uppercased() : input
    }

    var body: some View {
        VStack {
            Image("bmo")
                .resizable()
                .frame(width: 320, height: 420)
                .border(Color.teal, width: 8)

            Toggle("get excited!", isOn: $beExcited)

            Text("\(makeChange(text))")
                .padding(10)
                .font(.system(size: 20, weight: .bold))
            } .padding(10);
        }
}
    

struct OtherPageView: View {
    var body: some View {
        Text ("Just checking!");
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

