//
//  CurrDateView.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 5/9/24.
//

import SwiftUI

struct CurrDateView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Date(), format: .dateTime.weekday(.wide))
            Text(Date(), format: .dateTime.day().month(.abbreviated))
                .font(.largeTitle).minimumScaleFactor(0.5)
            Text(Date(), format: .dateTime.year())
                .font(.title)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    CurrDateView()
}
