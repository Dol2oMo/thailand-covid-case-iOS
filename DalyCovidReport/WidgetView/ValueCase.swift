//
//  ValueCase.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 21/7/2564 BE.
//

import SwiftUI

struct ValueCase: View {

    var data: Int
    var fontSize: CGFloat = 32

    init(_ data: Int,
         fontSize: CGFloat = 32) {
        self.data = data
        self.fontSize = fontSize
    }
    
    var body: some View {
        Text("\(data.converToDecimal())").font(.custom("Rubik-Regular", size: fontSize))
    }
}

struct ValueCase_Previews: PreviewProvider {
    static var previews: some View {
        ValueCase(0)
    }
}
