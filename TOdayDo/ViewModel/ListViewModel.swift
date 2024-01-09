//
//  ListVIewModel.swift
//  TOdayDo
//
//  Created by 이지석 on 2024/01/03.
//

import Foundation
import SwiftUI

final class ListViewModel: ObservableObject {
    @Published var listModel: [ListModel]
    @Published var item: ListModel
    
    init(listModel: [ListModel], item: ListModel? = nil) {
        self.listModel = listModel
        self.item = item ?? ListModel(title: "", startTime: Date(), endTime: Date(), isFinished: false)
    }
}
