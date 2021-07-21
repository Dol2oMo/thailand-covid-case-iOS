//
//  ReportViewSmall.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 21/7/2564 BE.
//

import SwiftUI
import WidgetKit

struct ReportViewSmall: View {

    var data: CovidEntry

    var body: some View {
        VStack(alignment: .leading, spacing:2) {
            HStack {
                VStack {
                    TitleView(DefaultTitle.newCase)
                    ValueCase(data.covidData.todayCases, fontSize: 48).foregroundColor(Color.redText).minimumScaleFactor(0.7)
                }
            }
        }.padding(17)
    }
}

struct ReportViewSmall_Previews: PreviewProvider {
    static var previews: some View {
        ReportViewSmall(data: CovidEntry.placeholder).previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
