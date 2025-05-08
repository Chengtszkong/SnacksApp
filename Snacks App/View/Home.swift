//
//  Home.swift
//  Snacks App
//
//  Created by Chengtszkong on 2025/5/6.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var categoryManager: CategoryManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Header
                    HStack {
                        Text("Order From The Best Of **Snacks**")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.gray.opacity(0.15), lineWidth: 4))
                    }
                    .padding(30)
                    
                    // Category List
                    CategoryListView
                    
                    // Collection View
                    HStack {
                        Text("\(categoryManager.selectedCategory.title) **Collections**")
                            .font(.system(size: 24))
                        
                        Spacer()
                        
                        NavigationLink {
                            CollectionView()
                                .environmentObject(cartManager)
                        } label: {
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
                        .foregroundColor(.black)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    // Product List
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(categoryManager.selectedCategory.title == "All" ? productList : productList.filter { $0.category == categoryManager.selectedCategory.title }, id: \.id) { item in
                                NavigationLink {
                                    DetailView(product: item)
                                } label: {
                                    ProductCard(product: item)
                                        .environmentObject(cartManager)
                                }
                                .foregroundColor(.black)
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Category List View
    var CategoryListView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categoryList, id: \.id) { item in
                        Button {
                            categoryManager.selectedCategory = item
                        } label: {
                            HStack {
                                if item.title != "All" {
                                    Image(systemName: item.icon)
                                        .foregroundColor(categoryManager.selectedCategory.id == item.id ? .yellow : .black)
                                }
                                
                                if item.title == "All" || categoryManager.selectedCategory.id == item.id {
                                    Text(item.title)
                                }
                            }
                            .padding(.vertical, 20)
                            .padding(.horizontal, item.title != "All" && categoryManager.selectedCategory.id == item.id ? 20 : 26)
                            .background(categoryManager.selectedCategory.id == item.id ? .black : .gray.opacity(0.1))
                            .foregroundColor(categoryManager.selectedCategory.id == item.id ? .white : .black)
                            .clipShape(Capsule())
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    Home()
        .environmentObject(CartManager())
        .environmentObject(CategoryManager())
}

// Product Card View
struct ProductCard: View {
    
    var product: Product
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -200)
                .rotationEffect(Angle(degrees: 30))
            
            ZStack {
                VStack(alignment: .leading, content: {
                    Text("\(product.name)")
                        .font(.system(size: 36, weight: .semibold))
                        .frame(width: 140)
                    
                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .foregroundColor(.gray)
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    
                    HStack {
                        Text("$\(product.price).0")
                            .font(.system(size: 24, weight: .semibold))
                        
                        Spacer()
                        
                        Button {
                            cartManager.addToCart(product: product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 90, height: 68)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, -10)

                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(.ultraThinMaterial)
                    .overlay(Capsule().stroke(Color.white.opacity(0.3), lineWidth: 4))
                    .clipShape(Capsule())
                })
            }
            .padding(30)
            .frame(width: 336, height: 422)
        }
        .frame(width: 336, height: 422)
        .background(product.color.opacity(0.13))
        .clipShape(.rect(cornerRadius: 57))
        .padding(.leading, 20)
    }
}
