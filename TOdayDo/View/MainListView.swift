//
//  ContentView.swift
//  TOdayDo
//
//  Created by 이지석 on 2023/12/28.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var viewModel: ListViewModel
    
    @State private var showAddListView: Bool = false
    @State private var showEditListView: Bool = false
    
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
                    
                    Button(action: {
                        showAddListView.toggle()
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding(12)
                            .foregroundColor(.white)
                            .background(.indigo)
                            .cornerRadius(32)
                    }
                    .padding(.trailing, 16)
                }
            }
            .navigationDestination(isPresented: $showAddListView, destination: {
                AddListView(viewType: .add)
                    .environmentObject(viewModel)
            })
            
            .navigationDestination(isPresented: $showEditListView, destination: {
                AddListView(viewType: .edit)
                    .environmentObject(viewModel)
            })
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
                        ListView(item: item) { action, item in
                            withAnimation {
                                switch action {
                                case .delete:
                                    viewModel.listModel.removeAll(where: { data in
                                        return data.id == item.id
                                    })
                                    ListDataManager().saveData(data: viewModel.listModel)
                                    
                                case .edit:
                                    viewModel.item = item
                                    showEditListView.toggle()
                                }
                            }
                        }
                        .listRowSeparator(.hidden)
                    }
                }
            }
            .padding(12)
            .background(.clear)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(ListViewModel(listModel: []))
    }
}
