//
//  CombineListView.swift
//  Dev2021
//
//  Created by Owen on 2021/4/20.
//

import SwiftUI

struct CombineListView: View {
    var body: some View {
        List {
            let contentMaxWidth = 700 as CGFloat
            NavigationLink(destination: PublisherZip().frame(maxWidth: contentMaxWidth)) {
                Label(LocalizedStringKey("Collecting and Republishing the Oldest Unconsumed Elements from Multiple Publishers"), systemImage: "textformat.123")
            }
            NavigationLink(destination: SubscribersView().frame(maxWidth: contentMaxWidth)) {
                Label(LocalizedStringKey("Working with Subscribers"), systemImage: "textformat.123")
            }
            NavigationLink(destination: Combine().frame(maxWidth: contentMaxWidth)) {
                Label(LocalizedStringKey("Demo"), systemImage: "person")
            }
        }.navigationTitle(Text("Combine Framework", comment: "Combine Framework"))
    }
}

struct CombineListView_Previews: PreviewProvider {
    static var previews: some View {
        CombineListView()
    }
}
