//
//  DetailView.swift
//  mvi-example
//
//  Created by youtak on 2023/07/11.
//

import SwiftUI

struct DetailView: View {
    
    struct StateViewModel {
        let title: String
        let members: [String]
    }
    
    let state: StateViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Text(state.title)
                    .font(.largeTitle)
                
                Spacer()
            }
            .padding()
            
            
            HStack {
                
                ForEach(state.members, id: \.self) { member in
                    VStack {
                        Circle()
                            .frame(width: 50, height: 50)
                        
                        Text(member)
                    }
                    .padding()
                }
                
            }
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(state: DetailView.StateViewModel(title: "모임1", members: ["아이브", "뉴진스", "르세라핌"]))
    }
}
