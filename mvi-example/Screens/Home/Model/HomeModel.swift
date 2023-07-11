//
//  HomeModel.swift
//  mvi-example
//
//  Created by youtak on 2023/07/11.
//

import Foundation

// MARK: ObservableObject & State

final class HomeModel: ObservableObject, HomeModelStateProtocol {
    
    @Published var contentState: HomeTypes.Model.ContentState = .loading
    
    let loadingText: String = "로딩 중"
    let navigationTitle: String = "MVI 예제"
    let routerSubject = HomeRouter.Subjects()
}

// MARK: - Action

extension HomeModel: HomeModelActionsProtocol {

    func showLoading() {
        contentState = .loading
    }
    
    func update(contents: [GroupChat]) {
        let homeContents = contents.map {
            HomeListRowView.StateViewModel(id: $0.id, title: $0.title, members: $0.members)
        }
        contentState = .content(contents: homeContents)
    }
}

// MARK: - Route 이동

extension HomeModel: HomeModelRouterProtocol {
    
    func routeToDetail(content: DetailView.StateViewModel) {
        routerSubject.screen.send(.detail(state: content)) 
    }
}

// MARK: - Helper

extension HomeTypes.Model {
    enum ContentState {
        case loading
        case content(contents: [HomeListRowView.StateViewModel])
    }
}
