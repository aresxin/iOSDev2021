//
//  SubscribersView.swift
//  Dev2021
//
//  Created by Owen on 2021/4/21.
//

import SwiftUI

struct SubscribersView: View {
    @ObservedObject private var viewModel = SubscribersModel()

    var body: some View {
        Form {
             Section {
                Button(action: {
                    viewModel.getImage()
                }) {
                    Text("Subscribe twice")
                }
                HStack {
                    Image(uiImage: viewModel.image1).padding(.bottom, 10)
                    Image(uiImage: viewModel.image2).padding(.bottom, 10)
                }
             }

            Section {
                Button(action: {
                    viewModel.getImageByShare()
                }) {
                    Text("Operators - share")
                }
                HStack {
                    Image(uiImage: viewModel.image3).padding(.bottom, 10)
                    Image(uiImage: viewModel.image4).padding(.bottom, 10)
                }
            }

            Section {
                Button(action: {
                    viewModel.getImageByMulticast()
                }) {
                    Text("Operators - multicast")
                }
                HStack {
                    Image(uiImage: viewModel.image5).padding(.bottom, 10)
                    Image(uiImage: viewModel.image6).padding(.bottom, 10)
                }
            }
        }
    }
}

struct SubscribersView_Previews: PreviewProvider {
    static var previews: some View {
        SubscribersView()
    }
}
