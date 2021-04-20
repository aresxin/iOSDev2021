//
//  ZipViewModel.swift
//  Dev2021
//
//  Created by Owen on 2021/4/20.
//

import Foundation
import Combine

class ZipViewModel: ObservableObject {
    // output
    @Published var responseData1 = "null"
    @Published var responseData2 = "null"

    private var cancellableSet: Set<AnyCancellable> = []

    init() {
        getData()
    }

    func getData() {
        let url1 = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let url2 = URL(string: "https://jsonplaceholder.typicode.com/todos")!

        let publisher1 = URLSession.shared.dataTaskPublisher(for: url1)
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())

        let publisher2 = URLSession.shared.dataTaskPublisher(for: url2)
            .map { $0.data }
            .decode(type: [Todo].self, decoder: JSONDecoder())

        Publishers.Zip(publisher1, publisher2)
            .eraseToAnyPublisher()
            .catch { error in
                Just(([], []))
            }
            .sink(receiveValue: { posts, todos in
                self.responseData1 = "posts count is \(posts.count)"
                self.responseData2 = "todos count is \(todos.count)"
            }).store(in: &cancellableSet)
    }
}


enum HTTPError: LocalizedError {
    case statusCode
    case post
}

struct Post: Codable {

    let id: Int
    let title: String
    let body: String
    let userId: Int
}

struct Todo: Codable {

    let id: Int
    let title: String
    let completed: Bool
    let userId: Int
}
