//
//  PreviewNote.swift
//  Progettos2i
//
//  Created by Michele De Cillis on 27/02/21.
//

import SwiftUI

struct NoteEditor: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var notesToAppend: [Note]
    
    @State var date = Date()
    @State var color = "Blue"
    @State var title = ""
    @State var bodyNote = ""
    
    @State private var isShowingAlert = false
    
    let COLORS = [
        "Blue", "Red", "Orange", "Yellow", "Green"
    ]
    
    var body: some View {
        VStack {
            heading
            VStack {
                TextField("Titolo", text: $title)
                Divider()
//                TextField("Scrivi...",text: $bodyNote)
                TextEditor(text: $bodyNote)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
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
                            self.color = COLORS[index]
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
            .padding([.horizontal, .bottom])
        }
        .navigationTitle(title == "" ? "Nota" : title)
        .navigationBarItems(trailing: Button(action: {
            if(title.isEmpty) {
                isShowingAlert.toggle()
            } else {
                notesToAppend.append(Note(title: title, body: bodyNote, color: color))
                self.presentationMode.wrappedValue.dismiss()
            }
        }, label: {
            Text("Salva")
        })
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("Attenzione"), message: Text("Inserisci un titolo."))
        })
    }
    
    var heading: some View {
        HStack {
            Circle()
                .foregroundColor(Color(color).opacity(0.9))
                .frame(width: 20, height: 20)
            Text("Creato il:")
                .font(.title3)
                .foregroundColor(Color.gray)
            Text(Note.getDate(date: date))
                .font(.title3)
                .fontWeight(.heavy)
                .foregroundColor(Color.gray)
            Spacer()
        }
        .padding()
    }
}

//struct NoteEditor_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteEditor(note: notes[0], title: "", bodyNote: "")
//    }
//}
