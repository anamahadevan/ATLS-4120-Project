//
//  ContentViewModel.swift
//  JournalApp
//
//  Created by anabelle mahadevan on 10/5/23.
//

import Foundation


class ContentViewModel: ObservableObject{
    //create list of notes, var so can add and delete
    @Published var myNotes = [Notes]()
    
    //function to save notes
    func saveNotes(title:String,noteContent:String){
    //instantiates object, creates a new content with a title and content
        let newNote = Notes(title: title, noteContent: noteContent)
    // here we add our new note to the array of notes
        myNotes.append(newNote)
    }
}
