//
//  CartManager.swift
//  ELearning
//
//  Created by mac on 18/09/2024.
//

import SwiftUI

class CartManager: ObservableObject {
    @Published var cartCourses: [Course] = []
    
    var totalPrice: Double {
        cartCourses.reduce(0) { $0 + $1.price }
    }
    
    func addToCart(course: Course) {
        cartCourses.append(course)
    }
    
    func removeFromCart(course: Course) {
        if let index = cartCourses.firstIndex(where: { $0.id == course.id }) {
            cartCourses.remove(at: index)
        }
    }
}



//#Preview {
//    CartManager()
//}
