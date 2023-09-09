//
//  ContentView.swift
//  Shared
//
//  Created by anabelle mahadevan on 8/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var beExcited = false;
    @State private var text = "bmo";
    
    // function to make uppercase and append "!"
    func makeChange(_ input: String) -> String {
        
        //when the toggle is on, beExcited = true + make uppercase
        var _excitedtext = beExcited ? (input.uppercased() + "!!!") : input;
      
        //when toggle is off,  beExcited = false
        if(!beExcited){
            
            }

        return _excitedtext;
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

