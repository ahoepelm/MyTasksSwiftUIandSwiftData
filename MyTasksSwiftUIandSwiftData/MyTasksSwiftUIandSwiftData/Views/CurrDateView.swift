//
//  CurrDateView.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 5/9/24.
//

import SwiftUI

struct CurrDateView: View {
    private let dateViewModel = GetDateViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(dateViewModel.getDay())
            Text(dateViewModel.getMonth() + dateViewModel.getDate())
                .font(.largeTitle).minimumScaleFactor(0.5)
            Text(dateViewModel.getYear())
                .font(.title)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    CurrDateView()
}
