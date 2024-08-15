//
//  ViewModifiers.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 5/9/24.
//

import SwiftUI

struct RoundedSquareModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 150, height: 150)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .inset(by: 0.5)
                    .stroke(Color.gray, lineWidth: 3)
            )
    }
}

struct OvalButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
    }
}

//#Preview {
//    ViewModifiers()
//}
