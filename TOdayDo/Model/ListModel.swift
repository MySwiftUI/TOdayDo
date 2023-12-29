//
//  ListModel.swift
//  TOdayDo
//
//  Created by 이지석 on 2023/12/29.
//

import SwiftUI

struct ListModel {
    var title: String
    var time: String
    var bgColor: Color
    
    init(
        title: String,
        time: String,
        bgColor: Color
    ) {
        self.title = title
        self.time = time
        self.bgColor = bgColor
    }
}
