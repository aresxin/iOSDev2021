//
//  FormattersView.swift
//  Dev2021
//
//  Created by Owen on 2021/4/15.
//

import SwiftUI

struct FormattersView: View {
    var body: some View {
        List {
            let contentMaxWidth = 700 as CGFloat
            NavigationLink(destination: NamesView().frame(maxWidth: contentMaxWidth)) {
                Label(LocalizedStringKey("Names"), systemImage: "person")
            }
            NavigationLink(destination: ListFormatterView().frame(maxWidth: contentMaxWidth)) {
                Label(LocalizedStringKey("ListFormatter"), systemImage: "textformat.123")
            }
        }.navigationTitle(Text("Formatters", comment: "Formatters"))

//        NavigationView {
//            List {
//                let contentMaxWidth = 700 as CGFloat
//                NavigationLink(destination: NamesView().frame(maxWidth: contentMaxWidth)) {
//                    Label(LocalizedStringKey("Names"), systemImage: "person")
//                }
//                NavigationLink(destination: ListFormatterView().frame(maxWidth: contentMaxWidth)) {
//                    Label(LocalizedStringKey("ListFormatter"), systemImage: "textformat.123")
//                }
//            }
//            .navigationTitle(Text("Formatters", comment: "Formatters"))
//        }
    }
}

struct FormattersView_Previews: PreviewProvider {
    static var previews: some View {
        FormattersView()
    }
}
