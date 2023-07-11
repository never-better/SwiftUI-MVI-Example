//
//  HomeModelProtocol.swift
//  mvi-example
//
//  Created by youtak on 2023/07/11.
//

import Foundation

// MARK: - Model State

protocol HomeModelStateProtocol {
    
    var contentState: HomeTypes.Model.ContentState { get }
    var loadingText: String { get }
    var navigationTitle: String { get }
    
    
    //  var routerSubject: ListRouter.Subjects { get }
}

// MARK: - Model Action

protocol HomeModelActionsProtocol: AnyObject {
    func showLoading()
    func update(contents: [GroupChat])
}

// MARK: - Route

protocol HomeModelRouterProtocol: AnyObject {
    func routeToDetail(content: GroupChat)
}
