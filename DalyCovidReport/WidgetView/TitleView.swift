//
//  TitleView.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 20/7/2564 BE.
//

import SwiftUI

struct TitleView: View {

    var data: DefaultTitle

    init(_ data: DefaultTitle) {
        self.data = data
    }
    
    var body: some View {
            HStack{
                HStack(alignment: .center,
                       spacing: 11) {
                    ImageLogoView(data)
                    Text(data.title)
                        .font(.custom("Mitr-Regular", size: 14))
                        .minimumScaleFactor(0.7)
                        .foregroundColor(Color.grayText)
                        .lineLimit(nil)
                }
            }
        }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(DefaultTitle.newCase).previewLayout(.sizeThatFits)
    }
}

struct FooterView: View {

    var data: CovidEntry

    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 8) {
                Text("ข้อมูลจาก \(data.covidData.devBy)").font(.custom("Mitr-Regular", size: 14)).foregroundColor(Color.grayText)
                Text("อัพเดตล่าสุดเมื่อ \(data.covidData.updateDate)").font(.custom("Mitr-Regular", size: 14)).foregroundColor(Color.grayText)
            }
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(data: CovidEntry.placeholder)
            .previewLayout(.sizeThatFits)
    }
}

