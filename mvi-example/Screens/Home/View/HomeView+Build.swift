//
//  HomeView+Build.swift
//  mvi-example
//
//  Created by youtak on 2023/07/11.
//

import SwiftUI

extension HomeView {
    
    static func build(data: HomeTypes.Intent.ExternalData) -> some View {
        let model = HomeModel()
        let intent = HomeIntent(model: model, networkService: NetworkService(), externalData: data)
        let container = MVIContainer(
            intent: intent as HomeIntentProtocol,
            model: model as HomeModelStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        
        let view = HomeView(container: container)
        
        return view
    }
}
