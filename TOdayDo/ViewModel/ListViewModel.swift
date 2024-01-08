//
//  ListVIewModel.swift
//  TOdayDo
//
//  Created by 이지석 on 2024/01/03.
//

import Foundation
import SwiftUI
import Combine

final class ListViewModel: ObservableObject {
    @Published var listModel: [ListModel] = []
    
    @Published var title: String = ""
    @Published var startTime: Date = Date()
    @Published var endTime: Date = Date()
    
    private lazy var cancellables: Set<AnyCancellable> = []
    
    init() {
        listModel = ListDataManager().loadData()
        
        $listModel
            .sink { [weak self] _ in
                guard let self = self else { return }
                ListDataManager().saveData(data: self.listModel)
            }
            .store(in: &cancellables)
    }
}
