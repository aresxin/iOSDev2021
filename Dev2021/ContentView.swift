//
//  ContentView.swift
//  Dev2021
//
//  Created by Owen on 2021/4/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                let contentMaxWidth = 700 as CGFloat
                NavigationLink(destination: NamesView().frame(maxWidth: contentMaxWidth)) {
                    Label(LocalizedStringKey("Names"), systemImage: "person")
                }
                NavigationLink(destination: AsyncAwait().frame(maxWidth: contentMaxWidth)) {
                    Label(LocalizedStringKey("AsyncAwait"), systemImage: "AsyncAwait")
                }
            }
            .navigationTitle(Text("Data Formatting", comment: "Formatters"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
