//
//  PreviewNote.swift
//  Progettos2i
//
//  Created by Michele De Cillis on 27/02/21.
//

import SwiftUI

struct NoteViewer: View {
    
    @Binding var note: Note
    @State var titleNote: String
    @State var bodyNote: String
    @State var colorNote: String
    
    @State private var isEditing: Bool = false
    
    let COLORS = [
        "Blue", "Red", "Orange", "Yellow", "Green"
    ]
    
    var body: some View {
        VStack {
            heading
            VStack (alignment: .leading) {
                if (isEditing) {
                    TextField("Titolo", text: $titleNote)
                    Divider()
                    TextField("Scrivi...",text: $bodyNote)
                        .frame(maxHeight: .infinity, alignment: .top)
                } else {
                    Text(note.body)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                }
            }
            .padding(.horizontal)
            .frame(maxHeight: .infinity)
            VStack {
                Text("Scegli un colore")
                    .font(.footnote)
                    .frame(maxWidth: .infinity)
                HStack {
                    ForEach(COLORS.indices) { index in
                        Button(action: {
                            colorNote = COLORS[index]
                            note.setColor(color: COLORS[index])
                        }) {
                            Circle()
                                .frame(width: 48, height: 48)
                                .foregroundColor(Color(COLORS[index]))
                        }
                        if index != COLORS.count - 1 {
                            Spacer()
                        }
                    }
                }
            }
            .padding(.horizontal)
            
        }
        .navigationTitle(titleNote)
        .navigationBarItems(trailing: buttonTab)
    }
    
    var buttonTab: some View {
        Button(action: {
            if(isEditing) {
                note.title = titleNote
                note.body = bodyNote
            }
            isEditing.toggle()
        }) {
            if (isEditing) {
                Text("Fatto")
            } else {
                Text("Modifica")
            }
        }
    }
    
    var heading: some View {
        HStack {
            Circle()
                .foregroundColor(Color(colorNote).opacity(0.9))
                .frame(width: 20, height: 20)
            Text("Creato il:")
                .font(.title3)
                .foregroundColor(Color.gray)
            Text(Note.getDate(date: note.dateCreation))
                .font(.title3)
                .fontWeight(.heavy)
                .foregroundColor(Color.gray)
            Spacer()
        }
        .padding()
    }
}

//struct NoteViewer_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteViewer(note: notes[0])
//    }
//}
