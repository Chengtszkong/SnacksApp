//
//  CollectionView.swift
//  Snacks App
//
//  Created by Chengtszkong on 2025/5/7.
//

import SwiftUI

struct CollectionView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var categoryManager: CategoryManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("**\(categoryManager.selectedCategory.title)** Collections")
                            .font(.system(size: 30))
                            .padding(.trailing)
                            .frame(width: 180)
                        
                        Spacer()
                        
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.backward")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.gray.opacity(0.15), lineWidth: 4))
                        }
                        .foregroundColor(.black)

                    }
                    .padding(30)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        ForEach(productList, id: \.id) { item in
                            SmallProductCard(product: item)
                                .environmentObject(cartManager)
                        }
                    })
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    CollectionView()
        .environmentObject(CartManager())
        .environmentObject(CategoryManager())
}

// Small Product Card
struct SmallProductCard: View {
    
    var product: Product
    
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var categoryManager: CategoryManager
    
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
                        .font(.system(size: 18, weight: .semibold))
                        .frame(width: 70)
                    
                    Text(product.category)
                        .font(.system(size: 10))
                        .padding()
                        .background(.white.opacity(0.5))
                        .foregroundColor(.gray)
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack {
                        Text("$\(product.price).0")
                            .font(.system(size: 14, weight: .semibold))
                        
                        Spacer()
                        
                        Button {
                            cartManager.addToCart(product: product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 45, height: 40)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }

                    }
                    .padding(.trailing, -12)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                })
            }
            .padding(20)
            .frame(width: 170, height: 215)
        }
        .frame(width: 170, height: 215)
        .background(product.color.opacity(0.13))
        .clipShape(.rect(cornerRadius: 30))
        .padding(.leading, 10)
    }
}
