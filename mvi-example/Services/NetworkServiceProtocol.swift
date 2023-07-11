//
//  NetworkServiceProtocol.swift
//  mvi-example
//
//  Created by youtak on 2023/07/11.
//

import Combine
import Foundation

protocol NetworkServiceProtocol {
    func fetchHomeGroupChatList() -> AnyPublisher<[GroupChat], Error>
    func asyncFetchHomeGroupChatList() async throws -> [GroupChat]
}
