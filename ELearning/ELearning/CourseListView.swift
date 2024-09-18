//
//  CourseListView.swift
//  ELearning
//
//  Created by mac on 18/09/2024.
//
import SwiftUI

// Course Model
struct Course: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let price: Double
    let isOnline: Bool
    let instructor: String
    let duration: String // e.g. "12 hours"
    let level: String // e.g. "Beginner"
    let rating: Double // e.g. 4.5 stars
    let enrolled: Int // e.g. number of students enrolled
    let thumbnail: String // URL or asset name for course thumbnail
}

// Course List View
struct CourseListView: View {
    @State private var courses: [Course] = [
        Course(title: "iOS Development", description: "Learn to build iOS apps from scratch.", price: 299.99, isOnline: true, instructor: "John Doe", duration: "24 hours", level: "Beginner", rating: 4.7, enrolled: 1200, thumbnail: "swift"),
        Course(title: "Data Science", description: "Master data science with Python.", price: 349.99, isOnline: false, instructor: "Jane Smith", duration: "36 hours", level: "Advanced", rating: 4.9, enrolled: 1500, thumbnail: "dataSeince"),
        Course(title: "Web Development", description: "Build responsive websites with HTML, CSS, and JavaScript.", price: 199.99, isOnline: true, instructor: "Mike Johnson", duration: "20 hours", level: "Intermediate", rating: 4.6, enrolled: 800, thumbnail: "web"),
        Course(title: "iOS Development", description: "Learn to build iOS apps from scratch.", price: 299.99, isOnline: true, instructor: "John Doe", duration: "24 hours", level: "Beginner", rating: 4.7, enrolled: 1200, thumbnail: "swift"),
        Course(title: "Data Science", description: "Master data science with Python.", price: 349.99, isOnline: false, instructor: "Jane Smith", duration: "36 hours", level: "Advanced", rating: 4.9, enrolled: 1500, thumbnail: "dataSeince"),
        Course(title: "Web Development", description: "Build responsive websites with HTML, CSS, and JavaScript.", price: 199.99, isOnline: true, instructor: "Mike Johnson", duration: "20 hours", level: "Intermediate", rating: 4.6, enrolled: 800, thumbnail: "web")
        // Add more courses here
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(courses) { course in
                        NavigationLink(destination: CourseDetailView(course: course)) {
                            HStack {
                                Image(course.thumbnail)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(course.title)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    
                                    Text(course.instructor)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    
                                    HStack {
                                        Text("\(course.rating, specifier: "%.1f") ★")
                                            .font(.subheadline)
                                            .foregroundColor(.yellow)
                                        Text("• \(course.level)")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Text("$\(course.price, specifier: "%.2f")")
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Courses")
        }
    }
}

// Preview
struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
