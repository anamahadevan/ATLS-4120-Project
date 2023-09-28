//
//  ContentView.swift
//  Shared
//
//  Ana Mahadevan, Assignment #3 for Mobile App Development
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        TabView { // Navigation Menu !
            
            FrontPageView()
                .tabItem {
                    Label("Home", systemImage: "square.and.pencil")
                }
            
            GalleryView()
                .tabItem{
                    Label("Gallery", systemImage: "globe")
                }
        
            Assignment2View()
                .tabItem {
                    Label("Wow", systemImage: "list.dash")
                }

            
            
                .background(Color.white)
        }
    }
}

struct FrontPageView: View {
    //create variable for when alert is on
    @State private var showAlert = false
    var body: some View {
        Text("Welcome ! ")
    }
}

    
struct GalleryView: View{

    var body: some View {
        NavigationView {
            ScrollView {
                // for loop to
                VStack {
                    
                    HStack {
                        //whatever number is here first is the center image
                        ForEach (1..<2){ i in
                            Image("Grid_\(i)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                    
                    HStack {
                        ForEach (1..<4){ i in
                            Image("Grid_\(i)")
                                .resizable()
                            .aspectRatio(contentMode: .fill)                       }
                    }
                }
            }
            .navigationTitle("Gallery")

        }
    }
}
    
struct Assignment2View: View{
    @State private var beExcited = false
    var text = "bmo"
    
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
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
