//
//  ContentView.swift
//  Shared
//
//  Ana Mahadevan, Assignment for Mobile App Development
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        VStack{
            TabView { // Bottom Navigation Menu !
                    
                    LocalView()
                        .tabItem{
                            Image(systemName: "house")
                                .foregroundStyle(.black,.black)
                                .font(.system(size: 36))
                        }
                
                    Assignment2View()
                        .tabItem{
                            Image(systemName: "plus.circle.fill")
//                                .foregroundStyle(.black,.black)
                                .font(.system(size: 36))
                        }
                    GlobalView()
                        .tabItem {
                            Image(systemName: "globe")
                            .foregroundStyle(.black,.black)
                            .font(.system(size: 36))
                        }
                }
        }
    }
}

struct LocalView: View{
    
    //index for changing colors
    @State var index = 0
    
    var body: some View{
        VStack(alignment: .leading){
            HStack{
            
            // filter button
            HStack{ Image(systemName:"cone") } .padding(.horizontal, 5)

            // sliding top tab bar
            HStack(spacing:0){
                Text("Stay Local")
                    .foregroundColor(self.index == 0 ? .white: Color("White").opacity(0.7))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.vertical,10)
                    .padding(.horizontal, 35)
                    .background(Color("Selector")).opacity(self.index == 0 ? 1 : 0)
                    .clipShape(Capsule())
                    .onTapGesture {
                        self.index = 0
                    }
            
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                Text("Go Global")
                    .foregroundColor(self.index == 1 ? .white: Color("White").opacity(0.7))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .background(Color("Selector")).opacity(self.index == 1 ? 1 : 0)
                    .clipShape(Capsule())
                    .onTapGesture {
                        self.index = 1
                    }
            }
            .background(Color("Selector").opacity(0.46))
            .clipShape(Capsule())
            

            // profile pic
            HStack{
                Rectangle()
                .foregroundColor(.clear)
                .frame(width: 40, height: 40)
                .background(
                Image("Grid_1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipped()
                )
                .cornerRadius(40)
            }.padding(.horizontal, 10)

                
            }
            Spacer()
            
            CardView()
        }
    }
}

    
struct CardView: View{
    var body: some View {
        
        
        VStack {
            
            /////////// tags /////////
            HStack{
                HStack(alignment: .center, spacing: 10) {  Text("bmo") }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color(red: 0.98, green: 0.64, blue: 0.62))

                .cornerRadius(10)
                .shadow(color: Color(red: 0.18, green: 0.15, blue: 0.14).opacity(0.15), radius: 10, x: 0, y: 0)

                
                HStack(alignment: .center, spacing: 10) { Text("was") }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color(red: 0.87, green: 0.78, blue: 0.75))
                .cornerRadius(10)
                .shadow(color: Color(red: 0.18, green: 0.15, blue: 0.14).opacity(0.15), radius: 10, x: 0, y: 0)
                
                HStack(alignment: .center, spacing: 10) { Text("my cat") }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color(red: 0.87, green: 0.78, blue: 0.75))
                .cornerRadius(10)
                .shadow(color: Color(red: 0.18, green: 0.15, blue: 0.14).opacity(0.15), radius: 10, x: 0, y: 0)
            }

         ////// post //////
            ZStack{
                
                Rectangle()
                    .frame(width: 353, height: 650)
                    .foregroundColor(Color("Sand").opacity(0.8))
                
                
                //image card
                Image("Grid_2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 353, height: 564)
                .clipped()
                
                // i know the tags are supposed to go here but they are not showing up right now
           
                
                Rectangle()
                    .frame(width: 353, height: 150)
                    .foregroundColor(Color("Sand").opacity(0.8))
                    .padding(.horizontal, 0)
                    .padding(.bottom, 0)
                    .frame(width: 333, alignment: .bottomLeading)
                    .background(Color("Sand").opacity(0.8))

                    .cornerRadius(10)
                
          
                HStack (alignment: .top){
                    //icon
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 24, height: 24)
                        .background(
                            Image("Grid_1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 24, height: 24, alignment: .topLeading)
                                .clipped()
                        )
                        .cornerRadius(24)
                    
                    //text
                    Text(" bmo ")
                        .padding(.leading, 10)
                    .foregroundColor(.black)
                    Image(systemName: "heart")
                        .frame(width: 24, height: 24)
                    Image(systemName: "pin")
                        .frame(width: 24, height: 24)
                    Image(systemName: "message")
                        .frame(width: 24, height: 24)
                    
                    
                } 
                        
                HStack{
                    textExpand(" I really want this to work because I spent a really long time trying to figure it out but honestly it might be time to throw in the towel", lineLimit: 2)
                    
                }
                    
              
                    
                                
            } .background(Color("Sand"))
           

            .cornerRadius(10)
            
        }
    }
}

//expandable text code with help from medium
struct textExpand: View {
    // set values for the longer text and the cut off text
    @State private var long: Bool = false
    @State private var short: Bool = false
    // the actual content
    private var text: String
    // amount of lines before cutoff
    let lineLimit: Int

    init(_ text: String, lineLimit: Int) {
        self.text = text
        self.lineLimit = lineLimit
    }

    private var newText: String {
        if !short {
            return ""
        } else {
            return self.long ? " see less" : " see more"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .lineLimit(long ? nil : lineLimit)
                .background(
                    Text(text).lineLimit(lineLimit)
                        .background(GeometryReader { visibleTextGeometry in
                            ZStack { //large size zstack to contain any size of text
                                Text(self.text)
                                    .background(GeometryReader { fullTextGeometry in
                                        Color.clear.onAppear {
                                            self.short = fullTextGeometry.size.height > visibleTextGeometry.size.height
                                        }
                                    })
                            }
                            .frame(height: 150)
                        })
                        .hidden() // hides the text
            )
            if short {
                Button(action: {
                    withAnimation {
                        long.toggle()
                    }
                }, label: {
                    Text(newText)
                })
            }
        }
    }
}


    
struct Assignment2View: View{

    var body: some View {
       Text(" I am not cut out to be a coder tbh")
        }
}
    

struct GlobalView: View{
    
    //index for changing colors
    @State var index = 0
    
    var body: some View{
        VStack(alignment: .leading){
            HStack{
            
            // filter button
            HStack{ Image(systemName:"cone") } .padding(.horizontal, 5)

            // sliding top tab bar
            HStack(spacing:0){
                Text("Stay Local")
                    .foregroundColor(self.index == 1 ? .white: Color("White").opacity(0.7))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .background(Color("Selector")).opacity(self.index == 1 ? 1 : 1)
                    .onTapGesture {
                        self.index = 1
                    }
            
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                Text("Go Global")
                    .foregroundColor(self.index == 0 ? .white: Color("White").opacity(0.7))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.vertical,10)
                    .padding(.horizontal, 35)
                    .background(Color("Selector")).opacity(self.index == 0 ? 1 : 0)
                    .clipShape(Capsule())
                    .onTapGesture {
                        self.index = 0
                    }
            }
            .background(Color("Selector").opacity(0.46))
            .clipShape(Capsule())
            

            // profile pic
            HStack{
                Rectangle()
                .foregroundColor(.clear)
                .frame(width: 40, height: 40)
                .background(
                Image("Grid_1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipped()
                )
                .cornerRadius(40)
            }.padding(.horizontal, 10)

                
            }
            Spacer()
            
            CardView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
