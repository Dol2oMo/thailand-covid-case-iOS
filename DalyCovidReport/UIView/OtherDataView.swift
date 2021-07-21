//
//  OtherDataView.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 21/7/2564 BE.
//

import SwiftUI

struct OtherDataView: View {
    
    var data: CovidEntry
    
    var body: some View {
        VStack(spacing: 2) {

            HStack {
                VStack(alignment: .leading, spacing: 2){

                    TitleView(DefaultTitle.summeryCase).padding(.bottom,8)
                    ValueCase(data.covidData.cases, fontSize: 32).foregroundColor(Color.black).minimumScaleFactor(0.7).padding(.leading, 33)
                }
                Spacer()
            }.padding(.bottom, 22)

            HStack {
                VStack(alignment: .leading, spacing: 2){

                    TitleView(DefaultTitle.admitCase).padding(.bottom,8)
                    ValueCase(data.covidData.newHospitalized, fontSize: 32).foregroundColor(Color.black).minimumScaleFactor(0.5).padding(.leading, 33)
                }

                Spacer()
            }.padding(.bottom, 22)

            HStack {
                VStack(alignment: .leading, spacing: 2){

                    TitleView(DefaultTitle.die).padding(.bottom,8)
                    ValueCase(data.covidData.deaths, fontSize: 32).foregroundColor(Color.black).minimumScaleFactor(0.5).padding(.leading, 33)
                }
                Spacer()
            }

            Spacer()

            FooterView(data: data)

        }.padding(17)
    }
}

struct OtherDataView_Previews: PreviewProvider {
    static var previews: some View {
        OtherDataView(data: CovidEntry.placeholder).previewLayout(.sizeThatFits)
    }
}
