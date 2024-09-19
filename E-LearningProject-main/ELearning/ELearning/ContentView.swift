//
//  ContentView.swift
//  ELearning
//
//  Created by mac on 18/09/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        TabView {
            CourseListView()
                .tabItem {
                    Label("Courses", systemImage: "book.fill")
                }
            
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }
        }
        .environmentObject(cartManager)
    }
}


#Preview {
    ContentView()
}
