//
//  ReportView.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 20/7/2564 BE.
//

import SwiftUI
import WidgetKit

struct ReportView: View {

    var data: DefaultTitle

    init(_ data: DefaultTitle?) {
        self.data = data ?? DefaultTitle.dailyDie
    }
    
    var body: some View {
        VStack(spacing: 2) {
            HStack {
                VStack(alignment: .leading, spacing: 2){

                    TitleView(DefaultTitle.newCase)
                    ValueCase(DefaultTitle.newCase,
                              fontSize: 48)
                        .foregroundColor(Color.redText)
                        .minimumScaleFactor(0.5)
                        .padding(.leading, 33)
                }
                Spacer()
            }

            Spacer()

            HStack {
                VStack(alignment: .leading, spacing: 2){

                    TitleView(DefaultTitle.dailyDie)
                    ValueCase(DefaultTitle.dailyDie,
                              fontSize: 32)
                        .foregroundColor(Color.violetText)
                        .minimumScaleFactor(0.5)
                        .padding(.leading, 33)
                }

                Spacer()

                VStack(alignment: .leading, spacing: 2){

                    TitleView(DefaultTitle.admitCase)
                    ValueCase(DefaultTitle.admitCase,
                              fontSize: 32)
                        .foregroundColor(Color.orangeText)
                        .minimumScaleFactor(0.5)
                        .padding(.leading, 33)
                }
            }
        }.padding(17)
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ReportView(DefaultTitle.newCase).previewContext(WidgetPreviewContext(family: .systemMedium))
//                .previewLayout(.fixed(width: 200, height: 200))
//                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
