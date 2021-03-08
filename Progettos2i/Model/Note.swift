//
//  Note.swift
//  Progettos2i
//
//  Created by Michele De Cillis on 27/02/21.
//

import SwiftUI

struct Note: Identifiable, Codable {
    var id = UUID()
    var dateCreation: Date = Date()
    var title: String = ""
    var body: String = ""
    var color: String = "Blue"
    
    static func getDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "it")
        return dateFormatter.string(from: date)
    }
    
    mutating func setColor(color: String) -> Void {
        self.color = color
    }
    
    init() {
        
    }
    
    init(title: String, body: String, color: String, dateCreation: Date = Date()) {
        self.title = title
        self.body = body
        self.color = color
        self.dateCreation = dateCreation
    }
}

var staticNotes = [
    Note(title: "My first note!", body:"This is the body of the first note, first note", color:"Blue"),
    Note(title: "My second note!", body:"This is the body of the second note, second note", color: "Red"),
    Note(title: "My third note!", body:"This is the body of the third note, third note", color: "Green"),
    Note(title: "My fourth note!", body:"This is the body of the fourth note, fourth note", color: "Yellow"),
    Note(title: "My fifth note!", body:"This is the body of the fifth note, fifth note.", color: "Orange"),
]
