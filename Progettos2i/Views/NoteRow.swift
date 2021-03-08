//
//  NoteList.swift
//  Progettos2i
//
//  Created by Michele De Cillis on 04/03/21.
//

import SwiftUI

struct NoteRow: View {
    
    var note: Note
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 16,height: 64)
                .cornerRadius(4)
                .foregroundColor(Color(note.color))
            VStack (alignment: .leading) {
                Text(note.title)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(note.body)
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

//struct NoteRow_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteRow(note: notes[0])
//    }
//}
