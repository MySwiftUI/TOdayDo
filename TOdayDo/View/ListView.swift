//
//  ListView.swift
//  TOdayDo
//
//  Created by 이지석 on 2023/12/28.
//

import SwiftUI

enum ListViewButtonAction {
    case edit
    case delete
}

struct ListView: View {
    @State private var showSideMenu: Bool = false
    
    @State var item: ListModel
    var onButtonPress: (ListViewButtonAction, ListModel) -> Void
    
    var body: some View {
        HStack {
            if showSideMenu {
                Button(action: {
                    onButtonPress(.edit, item)
                }) {
                    makeImage(
                        imageName: "slider.horizontal.3",
                        width: 16,
                        height: 16,
                        bgColor: .gray
                    )
                    .padding()
                }
                .background(.gray)
                .cornerRadius(8)
            }
            
            HStack(spacing: 24) {
                Image(systemName: "note.text")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(item.isFinished ? .secondary : .white)
                
                VStack(alignment: .leading, spacing: 2) {
                    Divider()
                        .opacity(0)
                    
                    textStrikeThrough(
                        text: item.title,
                        insertStrike: item.isFinished
                    )
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(item.isFinished ? .secondary : .white)
                    
                    textStrikeThrough(
                        text: changeDateToString(startTime: item.startTime, endTime: item.endTime),
                        insertStrike: item.isFinished
                    )
                        .font(.system(size: 18))
                        .foregroundColor(item.isFinished ? .secondary : .white)
                }
            }
            .padding(24)
            .background(
                LinearGradient(
                    colors: item.isFinished ? [.white, .secondary] : [.blue, .mint],
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
                            item.isFinished.toggle()
                            showSideMenu.toggle()
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
                        onButtonPress(.delete, item)
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
            onButtonPress: { _,_  in }
        )
    }
}
