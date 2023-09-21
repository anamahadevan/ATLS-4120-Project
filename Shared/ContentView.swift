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


struct ContentView: View {
    var body: some View {
        TabView { // Navigation Menu !
            
            FruitView()
                .tabItem{
                    Label("Fruits", systemImage: "gear")
                }
            GalleryView()
                .tabItem{
                    Label("Gallery", systemImage: "globe")
                }
        }
    }
}
    

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
                       Text("Calories : \(fruit.nutritions.calories, specifier: "%.2f")")
                        Text("Protein: \(fruit.nutritions.protein, specifier: "%.2f")")
                    }
                    
                }
                .task {
                    await getFruit()
                }
            }
            // is this not working?
            .navigationTitle("Home")
     
    }
}

struct GalleryView: View{
   // empty array for images
    var images: [Image] = []
    // controls width of columns
    let columns = [ GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    ForEach(1..<2){ i in
                        Image("Grid_\(i)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    }
                }
            }
            HStack{
                ForEach(1..<4){ i in
                    Image("Grid_\(i)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                }
            }
        
        }
        .navigationTitle("Gallery")
    }
  }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
