//
//  NoteRow.swift
//  Progettos2i
//
//  Created by Michele De Cillis on 04/03/21.
//

import SwiftUI

struct SidebarRow: View {
    
    var buttonText: String
    var imageName: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text(buttonText)
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

struct SidebarRow_Previews: PreviewProvider {
    static var previews: some View {
        SidebarRow(buttonText: "", imageName: "plus")
    }
}
