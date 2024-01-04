//
//  ContentView.swift
//  TOdayDo
//
//  Created by 이지석 on 2023/12/28.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    HStack {
                        Text("TOday Do")
                            .font(.system(size: 42))
                            .fontWeight(.black)
                            .foregroundColor(.indigo)
                            .padding(.leading, 16)
                        
                        Spacer()
                    }
                    .padding(.top, 26)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack {
                            ForEach(viewModel.listModel) { item in
                                ListView(model: item)
                                    .listRowSeparator(.hidden)
                            }
                        }
                        .padding(12)
                        .background(.clear)
                    }
                    .padding(EdgeInsets(top: -18, leading: 0, bottom: 8, trailing: 0))
                }
                .background(
                    LinearGradient(colors: [.white, .mint], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: AddListView()) {
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
            .environmentObject(ListViewModel())
    }
}
