//
//  DataManager.swift
//  TOdayDo
//
//  Created by 이지석 on 2024/01/02.
//

import Foundation

final class ListDataManager {
    public func saveData(
        data: [ListModel]
    ) {
        do {
            let data = try JSONEncoder().encode(data)
            UserDefaults.standard.set(data, forKey: "listData")
            print("DEBUG: ListDataManager saveData() → 데이터 저장에 성공했습니다.")
        } catch {
            print("DEBUG: ListDataManager saveData() 에러, \(error.localizedDescription)")
        }
    }
    
    public func loadData() -> [ListModel] {
        if let data = UserDefaults.standard.data(forKey: "listData") {
            do {
                print("DEBUG: ListDataManager loadData() → 데이터 로드에 성공했습니다.")
                return try [JSONDecoder().decode(ListModel.self, from: data)]
            } catch {
                print("DEBUG: ListDataManager loadData() 에러, \(error.localizedDescription)")
            }
        }
        print("DEBUG: ListDataManager loadData() → 데이터 로드에 성공했습니다.\n Empty data")
        return [ListModel(title: "", startTime: Date(), endTime: Date())]
    }
}
