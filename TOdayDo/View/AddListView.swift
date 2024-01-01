//
//  AddListView.swift
//  TOdayDo
//
//  Created by 이지석 on 2023/12/30.
//

import SwiftUI

struct AddListView: View {
    
    @Binding private var isNavigatioBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)) {
        _isNavigatioBarHidden = isNavigationBarHidden
    }
    
    var body: some View {
        VStack {
            Divider()
                .opacity(0)
            
            Text("123")
                .font(.system(size: 18))
                .fontWeight(.medium)
            
            Spacer()
        }
        .background(
            LinearGradient(colors: [.white, .mint], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .navigationTitle("할 일 추가하기")
    }
}

struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        AddListView()
    }
}
