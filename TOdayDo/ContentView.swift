//
//  ContentView.swift
//  TOdayDo
//
//  Created by 이지석 on 2023/12/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        NavigationView {
//            NavigationLink(
//                destination: ListView()
//            ) {
//                Text("First View")
//                    .fontWeight(.medium)
//                    .font(.system(size: 24))
//                    .padding(10)
//                    .foregroundColor(Color.white)
//                    .background(Color.blue)
//                    .cornerRadius(30)
//            }
//            .padding(.top, 54)
//        }
        HStack {
            ListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
