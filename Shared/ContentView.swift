//
//  ContentView.swift
//  Shared
//
//  Ana Mahadevan, Assignment #4 for Mobile App Development
//
// Read data from an API.

// Display an array of data in a List.

// Display an individual element on a view of its own.

import SwiftUI

// struct for each fruit

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
    
    func getFruit() async -> () {
        do {

//            let calString = String(format: "%.2f", quantityValue)
//            let calShort = Double(Int(100*Double(calString)!))/100
            
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
            List(fruits) { fruit in
                VStack(alignment: .leading) {
                   Text("\(fruit.name)")
                   Text("Calories : \(fruit.nutritions.calories)")
                    Text("Protein : \(fruit.nutritions.protein)")
                   
                }
            }
            .task {
                await getFruit()
            }
        }
        .navigationTitle("Fruits")
    }
}

struct FruitView2: PreviewProvider {
    static var previews: some View {
        FruitView()
    }
}
