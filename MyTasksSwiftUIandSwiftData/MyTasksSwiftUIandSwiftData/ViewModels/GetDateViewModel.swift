//
//  GetDateViewModel.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 5/9/24.
//

import Foundation

struct GetDateViewModel {
    private let today = Date()
    private let dateFormatter = DateFormatter()
    
    // lets get the date components
    
    func getDay() -> String {
        var currDay : String
        dateFormatter.dateFormat = "eeee"
        currDay = dateFormatter.string(from: today)
        
        return currDay
    }
    
    func getMonth() -> String {
        var currMonth : String
        dateFormatter.dateFormat = "MMM, "
        currMonth = dateFormatter.string(from: today)
        
        return currMonth
    }
    
    func getDate() -> String {
        var currDate : String
        dateFormatter.dateFormat = "d"
        currDate = dateFormatter.string(from: today)
        
        return currDate
    }
    
    func getYear() -> String {
        var currYear : String
        dateFormatter.dateFormat = "y"
        currYear = dateFormatter.string(from: today)
        
        return currYear
    }
    
    func convertDate(date: Date) -> String {
        var convertedDate: String
        dateFormatter.dateFormat = "MMM d, h:mm a"
        convertedDate = dateFormatter.string(from: date)
        return convertedDate
    }

}
