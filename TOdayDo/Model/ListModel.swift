//
//  ListModel.swift
//  TOdayDo
//
//  Created by 이지석 on 2023/12/29.
//

import SwiftUI

struct ListModel: Identifiable, Codable {
    var id = UUID()
    var title: String
    var startTime: Date
    var endTime: Date
    
    init(
        title: String,
        startTime: Date,
        endTime: Date
    ) {
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
    }
}
