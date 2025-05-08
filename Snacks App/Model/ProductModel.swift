//
//  ProductModel.swift
//  Snacks App
//
//  Created by Chengtszkong on 2025/5/7.
//

import SwiftUI

// Product Model
struct Product: Identifiable {
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var color: Color
    var price: Int
}

// Sample Products
var productList = [
    Product(name: "Good Source", category: "Chocolates", image: "image 1", color: .pink, price: 8),
    Product(name: "Unreal Muffins", category: "Chocolates", image: "image 2", color: .yellow, price: 5),
    Product(name: "Perfect Snacks", category: "Chocolates", image: "image 3", color: .red, price: 8),
    Product(name: "Smiths Chips", category: "Chips", image: "image 4", color: .orange, price: 7),
    Product(name: "Coconut Chips", category: "Chips", image: "image 5", color: .green, price: 6)
]
