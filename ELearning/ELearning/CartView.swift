//
//  CartView.swift
//  ELearning
//
//  Created by mac on 18/09/2024.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack {
            List {
                ForEach(cartManager.cartCourses) { course in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(course.title).font(.headline)
                            Text("Price: $\(course.price, specifier: "%.2f")")
                        }
                        Spacer()
                        Button(action: {
                            cartManager.removeFromCart(course: course)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            
            Text("Total Price: $\(cartManager.totalPrice, specifier: "%.2f")")
                .font(.title)
                .padding()
            
            Spacer()
        }
        .navigationTitle("Your Cart")
    }
}



#Preview {
    CartView()
}
