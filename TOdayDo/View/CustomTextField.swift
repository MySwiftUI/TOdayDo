//
//  CustomTextField.swift
//  TOdayDo
//
//  Created by 이지석 on 2024/01/01.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    
    var width: CGFloat
    var height: CGFloat
    var fontSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: fontSize))
            .padding()
            .textInputAutocapitalization(.never)
            .frame(width: width, height: height)
            .background(
                RoundedRectangle(cornerRadius: 7)
                    .foregroundColor(.clear)
                    .frame(width: width, height: height)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 7)
                    .stroke(.teal, lineWidth: 2)
            }
    }
}

extension View {
    func customTextFieldModifier(
        width: CGFloat,
        height: CGFloat,
        fontSize: CGFloat
    ) -> some View {
        modifier(
            CustomTextField(
                width: width,
                height: height,
                fontSize: fontSize
            )
        )
    }
}
