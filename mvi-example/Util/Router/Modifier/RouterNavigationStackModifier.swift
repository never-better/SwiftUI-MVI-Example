//
//  RouterNavigationStackModifier.swift
//  mvi-example
//
//  Created by youtak on 2023/07/11.
//

import Combine
import SwiftUI

protocol RouterNavigationStackScreenProtocol { }

struct RouterNavigationStackModifier<Screen, ScreenType> where Screen: View, ScreenType: RouterNavigationStackScreenProtocol {
    
    let publisher: AnyPublisher<ScreenType, Never>
    var screen: (ScreenType) -> Screen
    let onDismiss: ((ScreenType) -> Void)?
    
    @State private var screenType: ScreenType?
}

extension RouterNavigationStackModifier: ViewModifier {

    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .navigationDestination(isPresented: Binding<Bool>(
                    get: { screenType != nil },
                    set: {
                        if !$0 {
                            if let type = screenType { onDismiss?(type) }
                            screenType = nil
                        }
                    }), destination: {
                        if let type = screenType {
                            screen(type)
                        } else {
                            EmptyView()
                        }
                    })
                .onReceive(publisher) { screenType = $0 }
        } else {
            content
        }
    }
}
