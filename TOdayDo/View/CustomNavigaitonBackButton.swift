//
//  CustomNavigaitonBackButton.swift
//  TOdayDo
//
//  Created by 이지석 on 2023/12/31.
//

import SwiftUI

struct CustomNavigaitonBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.backward")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
        }
    }
}

struct CustomNavigaitonBackButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigaitonBackButton()
    }
}
