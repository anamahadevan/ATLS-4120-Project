//
//  ContentView.swift
//  Shared
//
//  Created by anabelle mahadevan on 8/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var beExcited = false
    @State private var text = "bmo"
    @State private var image = Image("bmo");
    
    // function to make uppercase and append "!"
    func makeChange(_ text: String) -> String {
        
        //when the toggle is on, beExcited = true
        if(beExcited){
        let _excitedtext = text.uppercased() + "!!!"
        }
        //when toggle is off,  beExcited = false
        else if(!beExcited){
            return 0// return function
        }
        return excitedtext
    }
    
    var body: some View {
        VStack {
            image
            .resizable()
            .frame(width: 300, height: 400, alignment: .topLeading)
            .border(Color.teal, width: 8)
            
            Text("\(makeChange(_:)(text))").padding().font(.system(size: 20, weight: .bold))
                  
            Toggle("get excited!", isOn : $beExcited)
   
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

