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
        
        NavigationView {
            ZStack {
                switch state.contentState {
                case .loading:
                    LoadingView(text: state.loadingText)
                        .onAppear { intent.viewOnAppear() }
                case let .content(groupChat):
                    HomeList(intent: intent, listRowItem: groupChat)
                }
            }
            .navigationTitle(state.navigationTitle)
            .modifier(HomeRouter(subjects: state.routerSubject, intent: intent))
        }
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
                    
                    ForEach(listRowItem, id: \.self) { item in
                        HomeListRowView(state: item)
                            .padding()
                            .onTapGesture {
                                intent.onTapListItems(state:
                                    DetailView.StateViewModel(title: item.title, members: item.members)
                                )
                            }
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
