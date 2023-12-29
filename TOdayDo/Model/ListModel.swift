//
//  ListModel.swift
//  TOdayDo
//
//  Created by 이지석 on 2023/12/29.
//

import SwiftUI

struct ListModel: Identifiable {
    var id = UUID()
    var title: String
    var time: String
    
    init(
        title: String,
        time: String
    ) {
        self.title = title
        self.time = time    }
}
