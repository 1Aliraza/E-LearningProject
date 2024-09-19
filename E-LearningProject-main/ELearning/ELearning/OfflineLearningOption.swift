//
//  OfflineLearningOption.swift
//  ELearning
//
//  Created by mac on 18/09/2024.
//

import SwiftUI

struct OfflineLearningOption: View {
    @State private var isOffline = false
    
    var body: some View {
        Toggle("Opt for Offline Learning", isOn: $isOffline)
            .padding()
    }
}


#Preview {
    OfflineLearningOption()
}
