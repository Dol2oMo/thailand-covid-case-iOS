//
//  ContentView.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 20/7/2564 BE.
//

import SwiftUI
import WidgetKit

struct ContentView: View {

    @State var data: CovidEntry = CovidEntry.placeholder
    let service = CovidService.shared

    var body: some View {

        GeometryReader { baseView in
        Color.baseViewColor.ignoresSafeArea().overlay(
            VStack {

                ZStack {
                    Color.white.overlay(
                        DailyReportView(data: data)
                    ).cornerRadius(24)
                }
                .padding([.leading,.trailing],25)
                .padding(.bottom,8)
                .frame(width: .infinity, height: baseView.size.height*0.25)

                Spacer()

                HStack {
                    VStack {
                        Color.white.overlay(
                            OtherDataView(data: data)
                        ).cornerRadius(24)
                        
                    }
                }
                .padding([.leading,
                          .trailing,
                          .bottom],25)

            }.padding( .top, 45))

        }.frame(width: .infinity, height: .infinity)
        .onAppear() {
            service.getCovidCase { result in
                switch result {
                case .success(let stats):
                    self.data = CovidEntry(date: Date(), covidData: stats)
                case .failure(let error): break
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
