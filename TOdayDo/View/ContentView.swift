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
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    HStack {
                        Text("TOday Do")
                            .font(.system(size: 36))
                            .fontWeight(.black)
                            .padding(.leading, 16)
                        
                        Spacer()
                    }
                    .padding(.top, 26)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack {
                            ForEach(items) { item in
                                ListView(model: item)
                                    .listRowSeparator(.hidden)
                            }
                        }
                        .padding(12)
                        .background(.white)
                    }
                    .padding(EdgeInsets(top: -16, leading: 0, bottom: 8, trailing: 0))
                }
                .background(
                    LinearGradient(colors: [.white, .mint], startPoint: .topTrailing, endPoint: .bottomLeading)
                )
                
                HStack {
                    Spacer()
                    Button(action: {
                        print("DEBUG: Plus button did tap")
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding(12)
                            .foregroundColor(.white)
                            .background(.indigo)
                            .cornerRadius(32)
                    }
                    Rectangle()
                        .frame(width: 8, height: 0)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
