//
//  ContentView.swift
//  TOdayDo
//
//  Created by 이지석 on 2023/12/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("TOdayDO")
                        .font(.system(size: 36))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.leading, 24)
                    
                    Spacer()
                    
                    Button(action: {
                        print("DEBUG: 추가 버튼 클릭하셨습니다.")
                    }) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.black)
                    }
                    .padding(.trailing, 24)
                }
                .padding([.top, .bottom], 14)
                .background(
                    LinearGradient(colors: [.white, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                
                List {
                    ForEach(items) { item in
                        ListView(model: item)
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .padding([.top, .bottom], -4)
                
                Rectangle().frame(height: 0)
                    .background(
                        LinearGradient(colors: [.white, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
