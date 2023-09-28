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
            
            FruitView()
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


// Struct for each fruit
struct Fruit: Codable, Identifiable {
    var id: Int
    var name: String
    var nutritions: Nutrition
}
struct Nutrition: Codable {
    var calories: Double
    var protein: Double
}

struct FruitView: View {
    @State var fruits =  [Fruit]()
    func getFruit() async {
        do {
            let url = URL(string: "https://www.fruityvice.com/api/fruit/all")!
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            fruits = try JSONDecoder().decode([Fruit].self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits) { fruit in
                    NavigationLink {
                        FruitSpecs(fruit: fruit)
                    } label: {
                        Text("\(fruit.name)")
                    }
                }
            }
            .navigationTitle("fruits")
            .task {
                await getFruit()
            }
        }
    }
}
                          
// Separate view for when a fruit is selected
struct FruitSpecs: View {
    let fruit: Fruit
    var body: some View {
        VStack {
            Text("Calories : \(fruit.nutritions.calories, specifier: "%.2f")")
            Text("Protein: \(fruit.nutritions.protein, specifier: "%.2f")")
            Link("your fruit cat",
                 destination: URL(string: "https://www.pinterest.com/search/pins/?q=\(fruit.name)%20cat")!)
//https://www.pinterest.com/search/pins/?q=pomegranate%20cat&rs=typed
        }
        .navigationTitle(fruit.name)
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
