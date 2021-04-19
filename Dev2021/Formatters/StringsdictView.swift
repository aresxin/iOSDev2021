//
//  StringsdictView.swift
//  Dev2021
//
//  Created by Owen on 2021/4/15.
//

import SwiftUI
//https://www.hackingwithswift.com/example-code/strings/how-to-display-different-strings-based-on-available-space-using-variantfittingpresentationwidth
//https://www.jianshu.com/p/a271347324de
//https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPInternational/StringsdictFileFormat/StringsdictFileFormat.html
struct StringsdictView: View {
    let localized = NSLocalizedString("Login", comment: "Prompt for user to log in.") as NSString



//    let one = String.localizedStringWithFormat(NSLocalizedString("MinFile", comment:""), 1)
//    let other = String.localizedStringWithFormat(NSLocalizedString("MinFile", comment:""), 5)

    let one = String.localizedPluralString("MinFile", count: 1)
    let other = String.localizedPluralString("MinFile", count: 5)

    var body: some View {
        VStack(alignment: .center)  {
            Label(
                title: { Text("How to display different strings based on available space using variantFittingPresentationWidth") },
                icon: { Image(systemName: "1.circle") }).padding(.bottom, 10)

            VStack {
                Text(localized.variantFittingPresentationWidth(300)).padding(.bottom, 5)
                Text(localized.variantFittingPresentationWidth(200)).padding(.bottom, 5)
                Text(localized.variantFittingPresentationWidth(100)).padding(.bottom, 20)
            }


            Label(
                title: { Text("Localization 之 复数(Plural)变化") },
                icon: { Image(systemName: "2.circle") }).padding(.bottom, 10)

            VStack {
                Text(one).padding(.bottom, 5)
                Text(other).padding(.bottom, 20)
            }
        }
    }
}

struct StringsdictView_Previews: PreviewProvider {
    static var previews: some View {
        StringsdictView()
    }
}

extension String {
    static func localizedPluralString(_ key: String, count: Int, comment: String = "") ->  String {
        let localizedString = NSLocalizedString(key, comment:comment)
        return String.localizedStringWithFormat(localizedString, count)
    }
}
