//
//  NetworkService.swift
//  mvi-example
//
//  Created by youtak on 2023/07/11.
//

import Combine
import Foundation

class NetworkService: NetworkServiceProtocol {

    func fetchHomeGroupChatList() -> AnyPublisher<[GroupChat], Error> {
        
        return Future<[GroupChat], Error> { promise in
            guard let path = Bundle.main.path(forResource: "DummyGroupChat", ofType: "json") else {
                promise(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let data = try? String(contentsOfFile: path)
                                    .data(using: .utf8)
            else {
                promise(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let decodedData = try? JSONDecoder().decode([GroupChat].self, from: data) else {
                promise(.failure(URLError(.badServerResponse)))
                return
            }
            
            promise(.success(decodedData))
        }
        .eraseToAnyPublisher()
    }
    
    func asyncFetchHomeGroupChatList() async throws -> [GroupChat] {
        
        try await Task.sleep(nanoseconds: 1_000_000_000) // 1초
        
        guard let path = Bundle.main.path(forResource: "DummyGroupChat", ofType: "json") else {
            throw URLError(.badServerResponse)
        }
        
        guard let data = try? String(contentsOfFile: path).data(using: .utf8) else {
            throw URLError(.badServerResponse)
        }
        
        guard let decodedData = try? JSONDecoder().decode(GroupChatList.self, from: data) else {
            throw URLError(.badServerResponse)
        }
        
        return decodedData.list
    }
}


// 네트워크 통신
//        let url = URL(string: "")!
//
//        return URLSession.shared.dataTaskPublisher(for: url)
//            .compactMap { $0.data }
//            .eraseToAnyPublisher()
