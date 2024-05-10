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
        //RoundedRectangle(cornerRadius: 25, style: .continuous)
            //.fill(Color.white)
            .frame(width: 150, height: 150)
            //.shadow(color: .gray, radius: 3)
            //.padding(.trailing)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .inset(by: 0.5)
                    .stroke(Color.gray, lineWidth: 3)
            )
    }
}

//#Preview {
//    ViewModifiers()
//}
