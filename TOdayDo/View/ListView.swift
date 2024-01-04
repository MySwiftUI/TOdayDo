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
                
                textStrikeThrough(
                    text: model.title,
                    insertStrike: viewDidTap
                )
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(viewDidTap ? .secondary : .white)
                
                textStrikeThrough(
                    text: changeDateToString(startTime: model.startTime, endTime: model.endTime),
                    insertStrike: viewDidTap
                )
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
    
    /// 취소선 추가되는 Text View
    private func textStrikeThrough(
        text: String,
        insertStrike: Bool
    ) -> some View {
        Text(text)
            .strikethrough(insertStrike, color: .secondary)
    }
    
    /// Date 타입 시작시간, 끝나는 시간 String 반환
    private func changeDateToString(
        startTime: Date,
        endTime: Date
    ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return "\(dateFormatter.string(from: startTime)) ~ \(dateFormatter.string(from: endTime))"
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(
            model: ListModel(title: "Test title", startTime: Date(), endTime: Date())
        )
    }
}
