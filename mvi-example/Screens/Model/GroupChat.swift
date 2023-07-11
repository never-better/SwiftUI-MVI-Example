//
//  GroupChat.swift
//  mvi-example
//
//  Created by youtak on 2023/07/11.
//

struct GroupChatList: Codable {
    let version: String
    let list: [GroupChat]
}

struct GroupChat: Equatable, Codable {
    let id: String
    let title: String
    let members: [String]
}
