//
//  PostInfoManager.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 5/1/22.
//

import Foundation

class PostInfoViewModel: ObservableObject {
    @Published var alertisPresented = false
    @Published var isRevealed = false
    @Published var isfocusAble: [Bool] = [true, false]
    @Published var formViewModel = FormViewModel()
}
