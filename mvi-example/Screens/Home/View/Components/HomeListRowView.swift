//
//  HomeListRowView.swift
//  mvi-example
//
//  Created by youtak on 2023/07/11.
//

import SwiftUI

struct HomeListRowView: View {
    
    struct StateViewModel: Hashable {
        let id: String
        let title: String
        let members: [String]
    }
    
    @State var state: StateViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Text(state.title)

                Spacer()
                    .frame(maxHeight: 20)
                
                HStack {
                    ForEach(state.members, id: \.self) {
                        Text($0)
                    }
                }
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.black, lineWidth: 2)
        }

    }
}

struct HomeListRowView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListRowView(state: .init(id: "1234", title: "동아리", members: ["철수", "영희", "마이클"]))
            .previewLayout(.sizeThatFits)
    }
}
