//
//  ColorExtension.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 21/7/2564 BE.
//

import Foundation
import SwiftUI

extension Color {
    @nonobjc static var grayText: Color {

        return Color(red: 107/255,
                     green: 107/255,
                     blue: 107/255)
    }

    @nonobjc static var redText: Color {

        return Color(red: 255/255,
                     green: 31/255,
                     blue: 34/255)
    }

    @nonobjc static var violetText: Color {

        return Color(red: 84/255,
                     green: 61/255,
                     blue: 176/255)
    }

    @nonobjc static var orangeText: Color {

        return Color(red: 255/255,
                     green: 122/255,
                     blue: 58/255)
    }

    @nonobjc static var baseViewColor: Color {

        return Color(red: 218/255,
                     green: 57/255,
                     blue: 62/255)
    }
}
