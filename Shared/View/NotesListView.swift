
//  NotesListView.swift
//  JournalApp
//
//  Created by anabelle mahadevan on 10/5/23.
//

import SwiftUI

struct NotesListView: View {
    
    //calling in view model, not instantiating
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
    
        
        // creating a list of notes, by iterating over the 'Notes' array an
        List(viewModel.myNotes){ note in
            VStack{
                //Title
                Text(note.title)
                //preview
                Text(note.noteContent)
            }
        }
    }
}

//struct NotesListView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotesListView()
//    }
//}
