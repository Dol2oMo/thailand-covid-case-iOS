//
//  DefaultData.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 20/7/2564 BE.
//

import Foundation

struct DefaultTitle{

    let title: String
    let icon: String
    var id: String {
        title
    }

    static var newCase = DefaultTitle(title: "ติดเชื้อเพิ่มวันนี้",
                                      icon: "ic_coronavirus")

    static let dailyDie = DefaultTitle(title: "เสียชีวิตวันนี้",
                                       icon: "ic_ghost")

    static let newCaseAdmit = DefaultTitle(title: "เข้ารักษาใหม่",
                                           icon: "ic_hospital")

    static let admitCase = DefaultTitle(title: "รักษาอยู่",
                                        icon: "ic_hospital")

    static let summeryCase = DefaultTitle(title: "ติดเชื้อทั้งหมด",
                                          icon: "ic_coronavirus")

    static let die = DefaultTitle(title: "เสียชีวิตรวม",
                                  icon: "ic_ghost")
}

