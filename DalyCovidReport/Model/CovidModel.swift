//
//  CovidModel.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 21/7/2564 BE.
//

import Foundation

struct CovidModel: Decodable {

    var todayCases: Int = 0
    var cases: Int = 0
    var recovered: Int = 0
    var newConfirmed: Int = 0
    var deaths: Int = 0
    var todayDeaths: Int = 0
    var newHospitalized: Int = 0
    var newDeaths: Int = 0
    var updateDate: String = ""
    var devBy: String = ""

    enum CodingKeys: String, CodingKey {
        case cases,
             todayCases,
             recovered,
             newConfirmed = "NewConfirmed",
             deaths,
             todayDeaths,
             newHospitalized = "NewHospitalized",
             newDeaths = "NewDeaths"
        case updateDate = "UpdateDate"
        case devBy = "DevBy"
    }
}
