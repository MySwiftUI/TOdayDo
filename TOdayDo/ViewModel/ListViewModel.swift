//
//  ListVIewModel.swift
//  TOdayDo
//
//  Created by 이지석 on 2024/01/03.
//

import Foundation
import SwiftUI

final class ListViewModel: ObservableObject {
    @Published var listModel: [ListModel] = ListDataManager().loadData()
}
