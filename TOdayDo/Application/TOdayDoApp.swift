//
//  TOdayDoApp.swift
//  TOdayDo
//
//  Created by 이지석 on 2023/12/28.
//

import SwiftUI

@main
struct TOdayDoApp: App {
    var body: some Scene {
        WindowGroup {
            MainListView(viewModel: ListViewModel())
        }
    }
}
