//
//  HomeIntent.swift
//  mvi-example
//
//  Created by youtak on 2023/07/11.
//

import SwiftUI


class HomeIntent {
    
    // MARK: - Model
    
    private weak var model: HomeModelActionsProtocol?
    private weak var routeModel: HomeModelRouterProtocol?
    
    // MARK: - Services
    
    private let networkService: NetworkServiceProtocol
    
    // MARK: - Business Data
    
    private let externalData: HomeTypes.Intent.ExternalData
    private var contents: [GroupChat] = [] // Model에서 데이터를 가지는데 중복해서 가질 이유가 있을까?
    
    init(model: HomeModelActionsProtocol & HomeModelRouterProtocol,
         networkService: NetworkServiceProtocol,
         externalData: HomeTypes.Intent.ExternalData
    ) {
        self.model = model
        self.routeModel = model
        self.networkService = networkService
        self.externalData = externalData
    }
    
}

extension HomeIntent: HomeIntentProtocol {
    
    func viewOnAppear() {
        model?.showLoading()
        
        Task { [weak self] in
            guard let self = self else { return }
            
            do {
                let groupChat = try await self.networkService.asyncFetchHomeGroupChatList()
                self.contents = groupChat
                self.model?.update(contents: groupChat)
            } catch {
                print("error")
            }
            
        }
        
    }
    
    func onTapListItems(state: DetailView.StateViewModel) {
        routeModel?.routeToDetail(content: state)
    }
}

// MARK: - Helper classes
// 외부에서 주입받는 추가 데이터

extension HomeTypes.Intent {
    struct ExternalData { }
}
