//
//  ContentView.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 4/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CurrDateView()
                .modifier(RoundedSquareModifier())
            Spacer()
            TaskCountView()
                .modifier(RoundedSquareModifier())            
        }
        .padding()
        Spacer()
    }
}

#Preview {
    ContentView()
}
