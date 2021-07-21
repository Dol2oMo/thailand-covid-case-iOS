//
//  DateExtension.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 21/7/2564 BE.
//

import Foundation

extension Date {

    func convertFullDateToDayAndMonth(predicate: String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        formatter.locale = Locale(identifier: "th")
        let dateTemp = formatter.date(from: predicate)

        let dateFormatter = DateFormatter()
    
        if let createDate = dateTemp {
            dateFormatter.dateFormat = "dd/MM"
            let gregorianCalendar = Calendar(identifier: Calendar.Identifier.gregorian)
            dateFormatter.locale = Locale(identifier: "th")
            dateFormatter.calendar = gregorianCalendar
            let date = dateFormatter.string(from: createDate)
            
            return date
        }
        
        return predicate
    }

}
