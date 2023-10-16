//
//  ContentView.swift
//  JournalApp
//
//  Created by anabelle mahadevan on 10/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var entryText = " Click here to type"
    @State private var noteName = " "
    // creating the view model
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView{
            // user controls
            VStack{
                //text field for title, where is this showing up?
                TextField("Enter note name:",text:$noteName)
                // lets note be edited
                TextEditor(text:$entryText)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
                
                //button for save
                Button {
                    viewModel.saveNotes(title: noteName, noteContent: entryText)
                    entryText = " "
                    noteName = " "
                } label: {
                    Text("Save Note")
                }
                //check if notes are being put in array
//                Text("\(viewModel.myNotes.count)")
                
                NavigationLink(" All Notes", destination: NotesListView(viewModel: viewModel))
              
                ZStack{
                    //nav links
                    NavigationLink(" Note Location", destination: MapView())
                }
            } .navigationTitle("New Note") //title, need to put text field
              .buttonStyle(.bordered)
              .padding(.vertical)
            
        
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
