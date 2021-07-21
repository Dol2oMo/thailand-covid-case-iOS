//
//  CovidModel.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 21/7/2564 BE.
//

import Foundation

struct CovidModel: Decodable {

    let updated: Int
    let country: String
    let cases, todayCases, welcomeDeaths, todayDeaths: Int
    let welcomeRecovered, todayRecovered, active, critical: Int
    let casesPerOneMillion, deathsPerOneMillion, tests, testsPerOneMillion: Int
    let population: Int
    let continent: String
    let oneCasePerPeople, oneDeathPerPeople, oneTestPerPeople: Int
    let activePerOneMillion, recoveredPerOneMillion, criticalPerOneMillion: Double
    let confirmed, recovered, hospitalized, deaths: Int
    let newConfirmed, newRecovered, newHospitalized, newDeaths: Int
    let updateDate, devBy: String

    enum CodingKeys: String, CodingKey {
        case updated, country, cases, todayCases
        case welcomeDeaths = "deaths"
        case todayDeaths
        case welcomeRecovered = "recovered"
        case todayRecovered, active, critical, casesPerOneMillion, deathsPerOneMillion, tests, testsPerOneMillion, population, continent, oneCasePerPeople, oneDeathPerPeople, oneTestPerPeople, activePerOneMillion, recoveredPerOneMillion, criticalPerOneMillion
        case confirmed = "Confirmed"
        case recovered = "Recovered"
        case hospitalized = "Hospitalized"
        case deaths = "Deaths"
        case newConfirmed = "NewConfirmed"
        case newRecovered = "NewRecovered"
        case newHospitalized = "NewHospitalized"
        case newDeaths = "NewDeaths"
        case updateDate = "UpdateDate"
        case devBy = "DevBy"
    }
}
