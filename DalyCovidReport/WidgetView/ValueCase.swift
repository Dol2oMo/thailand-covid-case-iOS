//
//  ValueCase.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 21/7/2564 BE.
//

import SwiftUI

struct ValueCase: View {

    var data: DefaultTitle
    var fontSize: CGFloat = 32

    init(_ data: DefaultTitle,
         fontSize: CGFloat = 32) {
        self.data = data
        self.fontSize = fontSize
    }
    
    var body: some View {
        Text("\(data.value.converToDecimal())").font(.custom("Rubik-Regular", size: fontSize))
    }
}

struct ValueCase_Previews: PreviewProvider {
    static var previews: some View {
        ValueCase(DefaultTitle.newCase)
    }
}
