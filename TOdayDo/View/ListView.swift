//
//  ListView.swift
//  TOdayDo
//
//  Created by 이지석 on 2023/12/28.
//

import SwiftUI

struct ListView: View {
    @State private var isFinished: Bool = false
    @State private var showSideMenu: Bool = false
    
    @State var model: ListModel
    var onDelete: (ListModel) -> Void
    
    var body: some View {
        HStack {
            HStack(spacing: 24) {
                Image(systemName: "note.text")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(isFinished ? .secondary : .white)
                
                VStack(alignment: .leading, spacing: 2) {
                    Divider()
                        .opacity(0)
                    
                    textStrikeThrough(
                        text: model.title,
                        insertStrike: isFinished
                    )
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(isFinished ? .secondary : .white)
                    
                    textStrikeThrough(
                        text: changeDateToString(startTime: model.startTime, endTime: model.endTime),
                        insertStrike: isFinished
                    )
                        .font(.system(size: 18))
                        .foregroundColor(isFinished ? .secondary : .white)
                }
            }
            .padding(24)
            .background(
                LinearGradient(
                    colors: isFinished ? [.white, .secondary] : [.blue, .mint],
                    startPoint: .bottomTrailing,
                    endPoint: .topLeading)
            )
            .cornerRadius(20)
            .onTapGesture {
                withAnimation {
                    showSideMenu.toggle()
                }
            }
            
            if showSideMenu {
                VStack {
                    Button(action: {
                        withAnimation {
                            isFinished.toggle()
                        }
                    }) {
                        makeImage(
                            imageName: "checkmark",
                            width: 16,
                            height: 16,
                            bgColor: .green
                        )
                        .padding()
                    }
                    .background(.green)
                    .cornerRadius(8)
                    
                    Button(action: {
                        onDelete(model)
                    }) {
                        makeImage(
                            imageName: "trash",
                            width: 16,
                            height: 16,
                            bgColor: .red
                        )
                        .padding()
                    }
                    .background(.red)
                    .cornerRadius(8)
                }
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
    
    /// 이미지 속성 처리 되어 있는 기능
    private func makeImage(
        imageName: String,
        width: CGFloat,
        height: CGFloat,
        bgColor: Color
    ) -> some View {
        Image(systemName: imageName)
            .resizable()
            .frame(width: width, height: height)
            .foregroundColor(.white)
            .background(bgColor)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(
            item: ListModel(title: "Test title", startTime: Date(),endTime: Date(), isFinished: false),
            onDelete: { _ in }
        )
    }
}
