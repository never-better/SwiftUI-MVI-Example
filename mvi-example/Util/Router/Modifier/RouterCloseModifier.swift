//
//  RouterCloseModifier.swift
//  mvi-example
//
//  Created by youtak on 2023/07/11.
//

import SwiftUI
import Combine

struct RouterCloseModifier: ViewModifier {
    
    let publisher: AnyPublisher<Void, Never>
    
    @Environment(\.presentationMode) private var presentationMode
    
    func body(content: Content) -> some View {
        content
            .onReceive(publisher) { _ in
                presentationMode.wrappedValue.dismiss()
            }
    }
}
