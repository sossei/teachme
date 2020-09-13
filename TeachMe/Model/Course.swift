//
//  Course.swift
//  TeachMe
//
//  Created by Vinicius Sossei on 07/09/20.
//  Copyright © 2020 Sossei Tech. All rights reserved.
//

// Data of courses
import Foundation

struct Course : Hashable, Codable, Identifiable {
    var id : Int
    var name : String
    var shortDescription : String
    var imageUrl : String
    var value : Int
    var initDate : Date
    var finishDate : Date
    func printInitDate() -> String {
        let df = DateFormatter()
              df.dateFormat = "MMM dd,yyyy"
        return df.string(from: self.initDate)
    }
    func printFinishDate() -> String {
        let df = DateFormatter()
              df.dateFormat = "MMM dd,yyyy"
        return df.string(from: self.initDate)
    }
    func printValyeFormatted() -> String{
        var value = Double(self.value)/100.0
        return String.localizedStringWithFormat("R$ %.2f %@", value,"")
    }
}
