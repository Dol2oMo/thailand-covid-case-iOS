//
//  ImageLogoView.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 20/7/2564 BE.
//

import SwiftUI

struct ImageLogoView: View {

    let data: DefaultTitle

    init(_ data: DefaultTitle?) {
        self.data = data ?? DefaultTitle.newCase
    }

    var body: some View {

        Image(data.icon)
             .resizable()
             .aspectRatio(contentMode: .fit)
            .frame(width: 24, height: 24, alignment: .center)
             .clipped()

    }
}

struct ImageLogoView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLogoView(DefaultTitle.newCase).previewLayout(.fixed(width: 24, height: 24))
    }
}
