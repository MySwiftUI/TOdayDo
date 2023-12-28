//
//  ListView.swift
//  TOdayDo
//
//  Created by 이지석 on 2023/12/28.
//

import SwiftUI

struct ListView: View {
    @State private var viewDidTap: Bool = false
    @State private var buttonDidTap: Bool = false
    
    var body: some View {
        HStack(spacing: 24) {
            Image(systemName: "checklist")
                .resizable()
                .frame(width: 32, height: 32)
            
            VStack(alignment: .leading, spacing: 2) {
                Divider()
                    .opacity(0)
                
                Text("쇼핑 다녀오기")
                    .font(.system(size: 22))
                    .fontWeight(.black)
                
                Text("12:00 ~ 13:00")
                    .font(.system(size: 18))
                    .foregroundColor(Color.secondary)
                
                if viewDidTap {
                    Text("세부사항")
                        .font(.system(size: 18))
                }
            }
            
            Button(action: {
                buttonDidTap.toggle()
                print("DEBUG: 확인 버튼을 클릭하셨습니다.")
            }) {
                Image(systemName: buttonDidTap ? "checkmark.circle.fill" : "checkmark.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color.black)
                    .padding(12)
            }
        }
        .padding(30)
        .background(Color.green)
        .cornerRadius(20)
        .onTapGesture {
            withAnimation {
                viewDidTap.toggle()
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
