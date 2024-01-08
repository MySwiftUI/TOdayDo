//
//  ContentView.swift
//  TOdayDo
//
//  Created by 이지석 on 2023/12/28.
//

import SwiftUI

struct MainListView: View {
    @StateObject var viewModel: ListViewModel
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    makeHeaderView(title: "Today Do")
                        .padding(.top, 26)
                    
                    makeListView(viewModel: viewModel)
                        .padding(EdgeInsets(top: -18, leading: 0, bottom: 8, trailing: 0))
                }
                .background(
                    LinearGradient(colors: [.white, .mint], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                
                HStack {
                    Spacer()
                    
                    makeFloatingActionButton(
                        imageName: "plus",
                        width: 32,
                        height: 32,
                        destination: AddListView().environmentObject(viewModel)
                    )
                        .padding(.trailing, 16)
                }
            }
        }
    }
    
    /// 헤더 UI 추가하는 기능
    @ViewBuilder
    private func makeHeaderView(
        title: String
    ) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 42))
                .fontWeight(.black)
                .foregroundColor(.indigo)
                .padding(.leading, 16)
            
            Spacer()
        }
    }
    
    /// 리스트 만드는 기능
    @ViewBuilder
    private func makeListView(
        viewModel: ListViewModel
    ) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                if viewModel.listModel.isEmpty {
                    EmptyListView()
                        .padding(.top, 24)
                }
                else {
                    ForEach(viewModel.listModel.sorted(by: { first, second in
                        return first.startTime < second.startTime
                    })) { item in
                        ListView(model: item)
                            .listRowSeparator(.hidden)
                    }
                }
            }
            .padding(12)
            .background(.clear)
        }
    }
    
    /// 플로팅 버튼을 추가하는 기능
    @ViewBuilder
    private func makeFloatingActionButton(
        imageName: String,
        width: CGFloat,
        height: CGFloat,
        destination: some View
    ) -> some View {
        NavigationLink(destination: destination) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: width, height: height)
                .padding(12)
                .foregroundColor(.white)
                .background(.indigo)
                .cornerRadius(32)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView(viewModel: ListViewModel())
    }
}
