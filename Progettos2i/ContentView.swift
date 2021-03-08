//
//  ContentView.swift
//  Progettos2i
//
//  Created by Michele De Cillis on 24/02/21.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var notes: [Note]
    
    @Environment(\.scenePhase) private var scenePhase

    let saveAction: () -> Void
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink (destination: NoteEditor(notesToAppend: $notes)) {
                    SidebarRow(buttonText: "Nuovo", imageName: "square.and.pencil")
                }
                NavigationLink (destination: NoteList(notes: $notes)
                .navigationTitle("Le tue note")) {
                    SidebarRow(buttonText: "Note", imageName: "list.bullet")
                }
                NavigationLink (destination: InfoView()
                .navigationTitle("Informazioni")) {
                    SidebarRow(buttonText: "Informazioni", imageName: "info.circle")
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Menù")
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
