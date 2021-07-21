//
//  CovidTotalStatsTimelineProvider.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 21/7/2564 BE.
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


struct CovidTotalStatsTimelineProvider: TimelineProvider {

    typealias Entry = CovidEntry

    let service = CovidService.shared
    
    func placeholder(in context: Context) -> CovidEntry {
        CovidEntry.placeholder
    }

    func getSnapshot(in context: Context, completion: @escaping (CovidEntry) -> Void) {
        if context.isPreview {
            completion(CovidEntry.placeholder)
        } else {
            fetchTotalCaseStats { (result) in
                switch result {
                case .success(let entry):
                    completion(entry)
                case .failure(_):
                    completion(CovidEntry.placeholder)
                }
            }
        }
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<CovidEntry>) -> Void) {
        fetchTotalCaseStats { (result) in
            switch result {
            case .success(let entry):
                // Refresh every 6 hrs
                let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(60 * 5)))
                completion(timeline)
            case .failure(_):
                // Refresh after 10 mins
                let entry = CovidEntry.placeholder
                let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(60 * 2)))
                completion(timeline)
            }
        }
    }

    private func fetchTotalCaseStats(completion: @escaping (Result<CovidEntry, Error>) -> ()) {
        service.getCovidCase { (result) in
            switch result {
            case .success(let stats):
                let entry = CovidEntry(date: Date(), covidData: stats)
                completion(.success(entry))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

