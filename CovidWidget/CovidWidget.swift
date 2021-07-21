//
//  CovidWidget.swift
//  CovidWidget
//
//  Created by Sorasak Tungpraisansombut on 21/7/2564 BE.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct CovidWidgetEntryView : View {

    var entry: CovidEntry

    @Environment(\.widgetFamily) var family
    
    var body: some View {
        switch family {
        case .systemSmall:
            ReportViewSmall(data: entry)
        case .systemLarge:
            ReportViewMedium(data: entry)
        default:
            ReportViewMedium(data: entry)
        }
    }
//    var body: some View {
//        ReportView(data: entry)
//    }
}

@main
struct CovidWidget: Widget {
    let kind: String = "CovidWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CovidTotalStatsTimelineProvider(), content: { entry in
            CovidWidgetEntryView(entry: entry)
        })
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct CovidWidget_Previews: PreviewProvider {
    static var previews: some View {

        Group{
            CovidWidgetEntryView(entry: CovidEntry.data)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
}
