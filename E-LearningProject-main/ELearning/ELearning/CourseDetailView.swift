//
//  CourseDetailView.swift
//  ELearning
//
//  Created by mac on 18/09/2024.
//

import SwiftUI

struct CourseDetailView: View {
    var course: Course
    @State private var isEnrolled = false // Track enrollment status
    @EnvironmentObject var cartManager: CartManager
    @State private var isAddedToCart = false
    @State private var isOfflineLearning = false // Track if user opts for offline learning
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(course.thumbnail)
                    .resizable()
                    .frame(height: 200)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                
                Text(course.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("By \(course.instructor)")
                    .font(.title3)
                    .foregroundColor(.secondary)
                
                HStack {
                    Text("\(course.rating, specifier: "%.1f") ★")
                        .font(.subheadline)
                        .foregroundColor(.yellow)
                    Text("• \(course.level)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("• \(course.duration)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Text(course.description)
                    .font(.body)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                Text("Price: $\(course.price, specifier: "%.2f")")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                // Add to Cart Button
                Button(action: {
                    if isAddedToCart {
                        cartManager.removeFromCart(course: course)
                    } else {
                        cartManager.addToCart(course: course)
                    }
                    isAddedToCart.toggle()
                }) {
                    Text(isAddedToCart ? "Remove from Cart" : "Add to Cart")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isAddedToCart ? Color.red : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                // Toggle between Online and Offline Learning
                if course.isOnline {
                    Toggle(isOn: $isOfflineLearning) {
                        Text(isOfflineLearning ? "Opting for Offline Learning" : "Enroll for Online Class")
                            .fontWeight(.bold)
                            .foregroundColor(isOfflineLearning ? .orange : .green)
                    }
                    .padding()
                    .background(isOfflineLearning ? Color.orange.opacity(0.2) : Color.green.opacity(0.2))
                    .cornerRadius(10)
                } else {
                    Text("Offline learning is available for this course.")
                        .foregroundColor(.gray)
                }

                // Enroll Button
                Button(action: {
                    isEnrolled = true
                }) {
                    Text(isEnrolled ? "Enrolled!" : isOfflineLearning ? "Enroll for Offline Learning" : "Enroll for Online Class")
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isEnrolled ? Color.green : (isOfflineLearning ? Color.orange : Color.blue))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(isEnrolled) // Disable if already enrolled
            }
            .padding()
        }
        .navigationTitle(course.title)
        .onAppear {
            isAddedToCart = cartManager.cartCourses.contains(where: { $0.id == course.id })
        }
    }
}
