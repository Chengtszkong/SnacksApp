//
//  DetailView.swift
//  Snacks App
//
//  Created by Chengtszkong on 2025/5/8.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let product: Product
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Coconut **Chips**")
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
                    
                    ZStack {
                        Image(product.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: .infinity)
                            .padding(.horizontal, 60)
                        
                        VStack {
                            Spacer()
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Pure")
                                        .foregroundColor(.gray)
                                    
                                    Text("Coconut")
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                Text("100%")
                                    .font(.system(size: 28, weight: .bold))
                            }
                            .padding(.leading)
                            .padding()
                            .frame(height: 110)
                            .background(.ultraThinMaterial)
                            .overlay(RoundedRectangle(cornerRadius: 28).stroke(Color.white.opacity(1), lineWidth: 4))
                            .clipShape(.rect(cornerRadius: 28))
                            .padding(.horizontal, 80)
                            .padding(.bottom, -60)
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    DetailView(product: Product(id: UUID(), name: "Good Source", category: "Chocolates", image: "image 1", color: .pink, price: 8))
}
