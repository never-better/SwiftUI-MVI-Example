//
//  HomeRouter.swift
//  mvi-example
//
//  Created by youtak on 2023/07/11.
//

import SwiftUI

struct HomeRouter: RouterProtocol {    
    typealias RouterScreenType = ScreenType
    typealias RouterAlertType = AlertScreen
    
    let subjects: Subjects
    let intent: HomeIntentProtocol
}

extension HomeRouter {
    enum ScreenType: RouterScreenProtocol {
        case detail(state: DetailView.StateViewModel)
        
        var routeType: RouterScreenPresentationType {
            switch self {
            case .detail: return .navigationLink
            }
        }
    }
    
    @ViewBuilder
    func makeScreen(type: ScreenType) -> some View {
        switch type {
        case let .detail(state): DetailView(state: state)
        }
    }
    
    func onDismiss(screenType: ScreenType) { }
}

extension HomeRouter {
    
    enum AlertScreen: RouterAlertScreenProtocol {
        case defaultAlert(title: String, message: String?)
    }
    
    func makeAlert(type: AlertScreen) -> Alert {
        switch type {
        case let .defaultAlert(title, message):
            return Alert(title: Text(title), message: message.map { Text($0) }, dismissButton: .cancel(Text("Cancel")))
        }
    }
}
