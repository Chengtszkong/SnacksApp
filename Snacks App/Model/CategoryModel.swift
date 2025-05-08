//
//  CategoryModel.swift
//  Snacks App
//
//  Created by Chengtszkong on 2025/5/7.
//

import SwiftUI

struct CategoryModel: Identifiable, Hashable {
    var id: UUID = .init()
    var icon: String
    var title: String
}

var categoryList: [CategoryModel] = [
    CategoryModel(icon: "", title: "All"),
    CategoryModel(icon: "apple.terminal.on.rectangle", title: "Chocolates"),
    CategoryModel(icon: "book.pages", title: "Chips"),
    CategoryModel(icon: "circle.bottomrighthalf.checkered", title: "Toffee"),
]

class CategoryManager: ObservableObject {
    @Published var selectedCategory: CategoryModel
    
    init() {
        self.selectedCategory = categoryList.first!
    }
    
}
