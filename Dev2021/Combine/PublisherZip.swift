//
//  PublisherZip.swift
//  Dev2021
//
//  Created by Owen on 2021/4/19.
//

import SwiftUI
import Combine
private var cancellable: AnyCancellable?

struct PublisherZip: View {

    @ObservedObject private var zipViewModel = ZipViewModel()

    var body: some View {
        VStack {
            Text(zipViewModel.responseData1).padding(.bottom, 5)
            Text(zipViewModel.responseData2)
        }
    }
}

struct PublisherZip_Previews: PreviewProvider {
    static var previews: some View {
        PublisherZip()
    }
}



