//
//  DefaultData.swift
//  DalyCovidReport
//
//  Created by Sorasak Tungpraisansombut on 20/7/2564 BE.
//

import Foundation

struct DefaultTitle: Hashable, Codable {

    let title: String
    let icon: String
    var value: Int

    var id: String {
        title
    }

    static let newCase = DefaultTitle(title: "ติดเชื้อเพิ่มวันนี้",
                                      icon: "ic_coronavirus",
                                      value: 11305 )

    static let dailyDie = DefaultTitle(title: "เสียชีวิตวันนี้",
                                       icon: "ic_ghost",
                                       value: 80)

    static let newCaseAdmit = DefaultTitle(title: "เข้ารักษาใหม่",
                                           icon: "ic_hospital",
                                           value: 10000)

    static let admitCase = DefaultTitle(title: "รักษาอยู่",
                                        icon: "ic_hospital",
                                        value: 126765)

    static let summeryCase = DefaultTitle(title: "ติดเชื้อทั้งหมด",
                                          icon: "ic_coronavirus",
                                          value: 126765)

    static let die = DefaultTitle(title: "เสียชีวิตรวม",
                                  icon: "ic_ghost",
                                  value: 3000)
}
