//
//  ListFormatterView.swift
//  Dev2021
//
//  Created by Owen on 2021/4/15.
//

import SwiftUI

struct ListFormatterView: View {

    // In English: "Apples, Sugar, Flour, and Butter"
    let englishList = ListFormatter.localizedString(
        byJoining: ["Apples", "Sugar", "Flour", "Butter"]
    )


    // In Swedish: // "Äpplen, Socker, Mjöl och Smör"
    let SwedishList = ListFormatter.localizedString(
        byJoining: ["Äpplen", "Socker", "Mjöl", "Smör"]
    )

    var body: some View {

        VStack(alignment: .center)  {
            Text(englishList).padding(.bottom, 20)
            Text(SwedishList).padding(.bottom, 20)
        }
    }
}

struct ListFormatterView_Previews: PreviewProvider {
    static var previews: some View {
        ListFormatterView()
    }
}
