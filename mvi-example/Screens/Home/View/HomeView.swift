//
//  ContentView.swift
//  mvi-example
//
//  Created by youtak on 2023/07/11.
//

import SwiftUI

struct HomeView: View {
    
    
    @StateObject var container: MVIContainer<HomeIntentProtocol, HomeModelStateProtocol>
    
    private var intent: HomeIntentProtocol { return container.intent }
    private var state: HomeModelStateProtocol { return container.model }
    
    var body: some View {
        
        ZStack {
            switch state.contentState {
            case .loading:
                LoadingView(text: state.loadingText)
            case let .content(groupChat):
                HomeList(intent: intent, listRowItem: groupChat)
            }
        }
        .navigationTitle(state.navigationTitle)
        .onAppear { intent.viewOnAppear() }
    }
}

private extension HomeView {
    
    private struct LoadingView: View {
        
        let text: String
        
        var body: some View {
            ZStack {
                Color.white
                Text(text)
            }
        }
    }
    
    private struct HomeList: View {
        
        let intent: HomeIntentProtocol
        let listRowItem: [HomeListRowView.StateViewModel]
        
        var body: some View {
            
            ScrollView {
                
                LazyVStack(spacing: 16) {
                    
                    ForEach(listRowItem, id: \.self) {
                        HomeListRowView(state: $0)
                            .padding()
                    }
                    
                }
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView.build(data: .init())
    }
}
