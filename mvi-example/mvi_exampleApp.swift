//
//  mvi_exampleApp.swift
//  mvi-example
//
//  Created by youtak on 2023/07/11.
//

import SwiftUI

@main
struct mvi_exampleApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView.build(data: .init())
        }
    }
}
