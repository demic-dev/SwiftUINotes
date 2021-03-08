//
//  ObservableNote.swift
//  Progettos2i
//
//  Created by Michele De Cillis on 06/03/21.
//

import SwiftUI
import Foundation

class NoteData: ObservableObject {
    
    private static var dataFolder: URL {
        do {
            return try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        } catch {
            fatalError("Can't find the directory")
        }
    }

    private static var fileURL: URL {
        dataFolder.appendingPathComponent("NoteData.data")
    }
    
    
    @Published var notes: [Note] = []
    
    func load() {
        let path = Bundle.main.path(forResource: "NoteData", ofType: "data")
        let url = URL(fileURLWithPath: path!)
        
        DispatchQueue.global(qos: .background).async {
            [weak self] in
            guard let data = try? Data(contentsOf: url) else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.notes = staticNotes
                }
                #endif
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            guard let fetchedNotes = try? decoder.decode([Note].self, from: data) else {
                fatalError("Can't decode data.")
            }
            DispatchQueue.main.async {
                self?.notes = fetchedNotes
            }
        }
    }
    
    func save() {
        let path = Bundle.main.path(forResource: "NoteData", ofType: "data")
        let url = URL(fileURLWithPath: path!)
        
        DispatchQueue.global(qos: .background).async {
            [weak self] in
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            guard let editedNotes = self?.notes else { fatalError("Self out of scope") }
            guard let data = try? encoder.encode(editedNotes) else { fatalError("Error encoding data") }
            do {
                try data.write(to: url)
            } catch {
                fatalError("Can't write file")
            }
        }
    }
    
    init() {
        load()
    }
}
