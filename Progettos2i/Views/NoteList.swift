//
//  NoteList.swift
//  Progettos2i
//
//  Created by Michele De Cillis on 04/03/21.
//

import SwiftUI

struct NoteList: View {
    
    @Binding var notes: [Note]
    
    var body: some View {
        if (notes.count == 0) {
            VStack {
                Image(systemName: "scribble.variable")
                    .resizable()
                    .frame(width: 122, height: 122)
                Text("Non ci sono note.\nAggiungine una!")
                    .font(.title3)
                    .multilineTextAlignment(.center)
            }
        } else {
            List(notes.indices) { index in
                let reversedIndex = (notes.count - 1) - index
                NavigationLink (destination: NoteViewer(note: $notes[reversedIndex], titleNote: notes[reversedIndex].title, bodyNote: notes[reversedIndex].body, colorNote: notes[reversedIndex].color)){
                    NoteRow(note: notes[reversedIndex])
                }
                .padding([.trailing, .top, .bottom], 8)
                .padding(.leading, 4)
            }
        }
    }
}

//struct NoteList_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteList(filteredNotes: notes)
//    }
//}
