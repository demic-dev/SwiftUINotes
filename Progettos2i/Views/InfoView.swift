//
//  InfoView.swift
//  Progettos2i
//
//  Created by Michele De Cillis on 05/03/21.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        
        ScrollView {
            Text("Prima app in SwiftUI!")
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            Divider()
            Text("Ciao, questa è la mia prima applicazione per iPhone sviluppata con SwiftUI.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 4)
            Text("Provengo da React Native, un framework per lo sviluppo di applicazioni cross-platform, quindi che siano compatibili allo stesso tempo sia con iOS che Android.")
                .padding(.bottom, 4)
            Text("Si tratta di un'applicazione molto basilare, che permette di scrivere, salvare ed archiviare delle note, ma che aiuta in un primo approccio a questo linguaggio di programmazione.")
                .padding(.bottom, 4)
            Link("Il mio GitHub per altri progetti simili!", destination: URL(string: "https://www.github.com/demic-dev")!)
        }
        .padding()
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
