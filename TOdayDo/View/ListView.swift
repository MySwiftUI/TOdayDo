//
//  ListView.swift
//  TOdayDo
//
//  Created by 이지석 on 2023/12/28.
//

import SwiftUI

struct ListView: View {
    @State private var viewDidTap: Bool = false
    
    private var model: ListModel
    
    init(
        model: ListModel
    ) {
        self.model = model
    }
    
    var body: some View {
        HStack(spacing: 24) {
            Image(systemName: "note.text")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(viewDidTap ? .secondary : .white)
            
            VStack(alignment: .leading, spacing: 2) {
                Divider()
                    .opacity(0)
                
                textStrikeThrough(text: model.title, insertStrike: viewDidTap)
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(viewDidTap ? .secondary : .white)
                
                textStrikeThrough(text: model.time, insertStrike: viewDidTap)
                    .font(.system(size: 18))
                    .foregroundColor(viewDidTap ? .secondary : .white)
            }
        }
        .padding(24)
        .background(
            LinearGradient(
                colors: viewDidTap ? [.white, .secondary] : [.blue, .mint],
                startPoint: .bottomTrailing,
                endPoint: .topLeading)
        )
        .cornerRadius(20)
        .onTapGesture {
            withAnimation {
                viewDidTap.toggle()
            }
        }
    }
    
    private func textStrikeThrough(
        text: String,
        insertStrike: Bool
    ) -> some View {
        Text(text)
            .strikethrough(insertStrike, color: .secondary)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(
            model: ListModel(title: "SwiftUI 공부하기", time: "13:00 ~ 16:00")
        )
    }
}
