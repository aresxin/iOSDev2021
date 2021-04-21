//
//  SubscribersModel.swift
//  Dev2021
//
//  Created by Owen on 2021/4/21.
//

import Foundation

import SwiftUI
import Combine

class SubscribersModel: ObservableObject {
    // output
    @Published var image1: UIImage = UIImage(systemName: "doc")!
    @Published var image2: UIImage = UIImage(systemName: "note")!


    @Published var image3: UIImage = UIImage(systemName: "doc")!
    @Published var image4: UIImage = UIImage(systemName: "note")!

    @Published var image5: UIImage = UIImage(systemName: "doc")!
    @Published var image6: UIImage = UIImage(systemName: "note")!


    private var cancellableSet: Set<AnyCancellable> = []

    init() {
        
    }

    func getImage() {
        let url1 = URL(string: "https://github.githubassets.com/images/icons/emoji/unicode/1f9ee.png")!

        let publisher =
            URLSession.shared.dataTaskPublisher(for: url1).print()
            .map { data, urlResponse in UIImage(data: data)! }
            .receive(on: DispatchQueue.main)
            .replaceError(with: UIImage(systemName: "doc")!).eraseToAnyPublisher()

        publisher.assign(to: \.image1, on: self).store(in: &cancellableSet)
        publisher.assign(to: \.image2, on: self).store(in: &cancellableSet)
    }

    func getImageByShare() {
        let url1 = URL(string: "https://github.githubassets.com/images/icons/emoji/unicode/1f1e6-1f1ee.png")!

        let publisher =
            URLSession.shared.dataTaskPublisher(for: url1).print()
            .map { data, urlResponse in UIImage(data: data)! }
            .receive(on: DispatchQueue.main)
            .replaceError(with: UIImage(systemName: "doc")!).eraseToAnyPublisher().share().makeConnectable()

        publisher.assign(to: \.image3, on: self).store(in: &cancellableSet)
        publisher.assign(to: \.image4, on: self).store(in: &cancellableSet)

        // Must call connect
        publisher.connect().store(in: &cancellableSet)
    }

    func getImageByMulticast() {
        let url = URL(string: "https://github.githubassets.com/images/icons/emoji/unicode/1f6b4-2642.png")!
        let publisher =
            URLSession.shared.dataTaskPublisher(for: url).print()
            .map { data, urlResponse in UIImage(data: data)! }
            .receive(on: DispatchQueue.main)
            .replaceError(with: UIImage(systemName: "doc")!)
            .eraseToAnyPublisher()
            .multicast { PassthroughSubject<UIImage, Never>() }

        publisher.assign(to: \.image5, on: self).store(in: &cancellableSet)
        publisher.assign(to: \.image6, on: self).store(in: &cancellableSet)

        // Must call connect
        publisher.connect().store(in: &cancellableSet)
    }
    
}
