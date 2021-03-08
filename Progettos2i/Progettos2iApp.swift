//
//  Progettos2iApp.swift
//  Progettos2i
//
//  Created by Michele De Cillis on 24/02/21.
//

import SwiftUI

@main
struct Progettos2iApp: App {
    @ObservedObject private var notes = NoteData()
    
    var body: some Scene {
        WindowGroup {
            ContentView(notes: $notes.notes, saveAction: {notes.save()})
        }
    }
}
