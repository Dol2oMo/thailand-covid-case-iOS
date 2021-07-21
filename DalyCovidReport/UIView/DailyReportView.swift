//
//  DailyReportView.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 21/7/2564 BE.
//

import SwiftUI

//struct DailyReportView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct DailyReportView_Previews: PreviewProvider {
//    static var previews: some View {
//        DailyReportView()
//    }
//}

struct DailyReportView: View {

    var data: CovidEntry

    var body: some View {
        VStack(spacing: 2) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 2){

                    TitleView(DefaultTitle.newCase)
                    ValueCase(data.covidData.todayCases,
                              fontSize: 48)
                        .foregroundColor(Color.redText)
                        .minimumScaleFactor(0.5)
                        .padding(.leading, 33)
                }
                Spacer()
                VStack(alignment: .leading, spacing: 2){
                    Text(Date().convertFullDateToDayAndMonth(predicate: data.covidData.updateDate))
                    .font(.custom("Mitr-Regular", size: 14))
                    .minimumScaleFactor(0.7)
                    .foregroundColor(Color.grayText)
                    .lineLimit(nil)
                }
            }

            Spacer()

            HStack {
                VStack(alignment: .leading, spacing: 2){

                    TitleView(DefaultTitle.dailyDie)
                    ValueCase(data.covidData.todayDeaths,
                              fontSize: 32)
                        .foregroundColor(Color.violetText)
                        .minimumScaleFactor(0.5)
                        .padding(.leading, 33)
                }

                Spacer()

                VStack(alignment: .leading, spacing: 2){

                    TitleView(DefaultTitle.newCaseAdmit)
                    ValueCase(data.covidData.newHospitalized,
                              fontSize: 32)
                        .foregroundColor(Color.orangeText)
                        .minimumScaleFactor(0.5)
                        .padding(.leading, 33)
                }
            }
        }.padding(17)
    }
}

struct DailyReportView_Previews: PreviewProvider {
    static var previews: some View {
        DailyReportView(data: CovidEntry.placeholder)
            .previewLayout(.sizeThatFits)
    }
}
