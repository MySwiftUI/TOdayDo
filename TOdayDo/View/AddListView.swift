//
//  AddListView.swift
//  TOdayDo
//
//  Created by 이지석 on 2023/12/30.
//

import SwiftUI

struct AddListView: View {
    @State var listModel: ListModel = ListModel(title: "", startTime: Date(), endTime: Date())
    
    @State private var title: String = ""
    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date()
    
    @State private var titleViewHidden: Bool = false
    @State private var startTimeViewHidden: Bool = true
    @State private var endTimeViewHidden: Bool = true
    
    @State private var deviceWidth = UIScreen.main.bounds.width
    
    @Environment (\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: ListViewModel

    var body: some View {
        VStack {
            Divider()
                .opacity(0)
            
            makeTitleView(
                text: "내가 오늘 할 일은?",
                placeHolder: "오늘 할 일을 입력해주세요",
                isHidden: titleViewHidden,
                title: $title
            )
                .onTapGesture {
                    withAnimation {
                        titleViewHidden.toggle()
                    }
                }
            
            makeTimeView(
                text: "내가 일을 시작할 시간은?",
                isHidden: startTimeViewHidden,
                time: $startTime
            )
                .onTapGesture {
                    withAnimation {
                        startTimeViewHidden.toggle()
                    }
                }
                .padding(.bottom, 12)
            
            makeTimeView(
                text: "내가 일을 끝낼 시간은?",
                isHidden: endTimeViewHidden,
                time: $endTime
            )
                .onTapGesture {
                    withAnimation {
                        endTimeViewHidden.toggle()
                    }
                }
                .padding(.bottom, 12)
            
            Spacer()
            
            Button(action: {
                listModel.title = title
                listModel.startTime = startTime
                listModel.endTime = endTime
                viewModel.listModel.append(listModel)
                dismiss()
            }) {
                Text("추 가")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: deviceWidth - 64, height: 64)
                    .background(.indigo)
                    .cornerRadius(32)
            }
        }
        .navigationTitle("할 일 추가하기")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomNavigaitonBackButton())
        .background(
            LinearGradient(
                colors: [.white, .mint], startPoint: .topLeading, endPoint: .bottomTrailing
            )
        )
    }
    
    /// 할 일을 입력하는 UI
    @ViewBuilder
    private func makeTitleView(
        text: String,
        placeHolder: String,
        isHidden: Bool,
        title: Binding<String>
    ) -> some View {
        VStack {
            HStack {
                Text(text)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .padding(.leading, 32)
                
                Spacer()
                
                Image(systemName: isHidden ? "chevron.down" : "chevron.up")
                    .padding(.trailing, 32)
            }
            .padding(.top, 16)

            if !titleViewHidden {
                TextField(placeHolder, text: title)
                    .customTextFieldModifier(width: deviceWidth - 64, height: 54, fontSize: 16)
                    .accentColor(.mint)
                    .onTapGesture { }
            }
            
            Divider()
                .frame(height: 1)
                .padding([.leading, .trailing], 28)
                .padding(.top, 8)
        }
        .padding(.bottom, 12)
    }
    
    
    /// 시간 선택하는 UI
    @ViewBuilder
    private func makeTimeView(
        text: String,
        isHidden: Bool,
        time: Binding<Date>
    ) -> some View {
        VStack(alignment: .center) {
            HStack {
                Text(text)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .padding(.leading, 32)
                
                Spacer()
                
                Image(systemName: isHidden ? "chevron.down" : "chevron.up")
                    .padding(.trailing, 32)
            }

            if !isHidden {
                DatePicker("", selection: time, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
                    .padding([.leading, .trailing], 32)
                    .onTapGesture { }
            }
            
            Divider()
                .frame(height: 1)
                .padding([.leading, .trailing], 28)
                .padding(.top, 8)
        }
    }
}

struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        AddListView()
    }
}
