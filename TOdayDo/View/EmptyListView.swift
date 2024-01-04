//
//  EmptyListView.swift
//  TOdayDo
//
//  Created by 이지석 on 2024/01/04.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        HStack(spacing: 24) {
            Image(systemName: "note.text")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.indigo)
            
            VStack(alignment: .leading, spacing: 2) {
                Divider()
                    .opacity(0)
                
                Text("할 일을 추가해주세요.")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.indigo)
                    .padding([.top, .bottom], 14)
            }
        }
        .padding(24)
        .background(.clear)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 2)
                .foregroundColor(.indigo)
                .padding(1)
        }
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
