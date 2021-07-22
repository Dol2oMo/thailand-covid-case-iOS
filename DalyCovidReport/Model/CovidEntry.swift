//
//  CovidEntry.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 22/7/2564 BE.
//

import Foundation
import WidgetKit

struct CovidEntry: TimelineEntry {
    public let date: Date
    public let covidData: CovidModel
    public var isPlaceholder = false
}

extension CovidEntry {

    static var data: CovidEntry {
        CovidEntry(date: Date(),
                   covidData: .init(todayCases: 0,
                                                  cases: 0,
                                                  recovered: 0,
                                                  newConfirmed: 0,
                                                  deaths: 0,
                                                  todayDeaths: 0,
                                                  newHospitalized: 0,
                                                  newDeaths: 0,
                                                  updateDate: "",
                                                  devBy: ""))
    }
    
    static var placeholder: CovidEntry {
        CovidEntry(date: Date(),
                       covidData: .init(todayCases: 0,
                                                      cases: 0,
                                                      recovered: 0,
                                                      newConfirmed: 0,
                                                      deaths: 0,
                                                      todayDeaths: 0,
                                                      newHospitalized: 0,
                                                      newDeaths: 0,
                                                      updateDate: "",
                                                      devBy: ""),
                       isPlaceholder: true)
        
    }
}
