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
                NavigationLink(destination: FormattersView().frame(maxWidth: contentMaxWidth)) {
                    Label(LocalizedStringKey("Formatters"), systemImage: "")
                }
                NavigationLink(destination: AsyncAwait().frame(maxWidth: contentMaxWidth)) {
                    Label(LocalizedStringKey("AsyncAwait"), systemImage: "")
                }
                NavigationLink(destination: CombineListView().frame(maxWidth: contentMaxWidth)) {
                    Label(LocalizedStringKey("Combine"), systemImage: "")
                }
            }
            .navigationTitle(Text("Dev 2021", comment: "Dev 2021"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
