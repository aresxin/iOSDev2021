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

        let publisher1 = URLSession.shared.dataTaskPublisher(for: url1).print("Request 1")
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())

        let publisher2 = URLSession.shared.dataTaskPublisher(for: url2).print("Request 2")
            .map { $0.data }
            .decode(type: [Todo].self, decoder: JSONDecoder())

        // 1. normal
        Publishers.Zip(publisher1, publisher2)
            .eraseToAnyPublisher()
            .catch { error in
                Just(([], []))
            }
            .sink(receiveValue: { posts, todos in
                self.responseData1 = "posts count is \(posts.count)"
                self.responseData2 = "todos count is \(todos.count)"
            }).store(in: &cancellableSet)

        // 2.
//        Publishers.Zip(publisher1, publisher2)
//            .eraseToAnyPublisher()
//            .catch { error in
//                Just(([], []))
//            }
//            .sink(receiveValue: { posts, todos in
//                self.responseData1 = "posts count is \(posts.count)"
//            }).store(in: &cancellableSet)
//
//        Publishers.Zip(publisher1, publisher2)
//            .eraseToAnyPublisher()
//            .catch { error in
//                Just(([], []))
//            }
//            .sink(receiveValue: { posts, todos in
//                self.responseData2 = "todos count is \(todos.count)"
//            }).store(in: &cancellableSet)

        // 值，订阅一次产生一次数据流
//        let onePublisher =  Publishers.Zip(publisher1, publisher2).map { (posts, todos) -> String in
//            return "posts count is \(posts.count)"
//        }.replaceError(with: "error").eraseToAnyPublisher()
//
//        onePublisher.assign(to:  \.responseData1, on: self).store(in: &cancellableSet)
//        onePublisher.assign(to:  \.responseData2, on: self).store(in: &cancellableSet)


        // 引用，共享一个数据流
//        let sharePublisher =  Publishers.Zip(publisher1, publisher2).map { (posts, todos) -> String in
//            return "posts count is \(posts.count)"
//        }.replaceError(with: "error").eraseToAnyPublisher().share().makeConnectable()
//
//        sharePublisher.assign(to:  \.responseData1, on: self).store(in: &cancellableSet)
//        sharePublisher.assign(to:  \.responseData2, on: self).store(in: &cancellableSet)
//        sharePublisher.connect().store(in: &cancellableSet)
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
