//
//  DataTable.swift
//  4 Task
//
//  Created by Руслан Гайфуллин on 10.05.2023.
//

import UIKit

enum CellReuseID: String {
    case base = "BaseTableViewCell_ReuseID"
    case custom = "CustomTableViewCell_ReuseID"
}

struct Data {
    let number: Int
    var check: Bool
}
extension Data {
    public static func make() -> [Data] {
            [
                Data(number: 1, check: false),
                Data(number: 2, check: false),
                Data(number: 3, check: false),
                Data(number: 4, check: false),
                Data(number: 5, check: false),
                Data(number: 6, check: false),
                Data(number: 7, check: false),
                Data(number: 8, check: false),
                Data(number: 9, check: false),
                Data(number: 10, check: false),
                Data(number: 11, check: false),
                Data(number: 12, check: false),
                Data(number: 13, check: false),
                Data(number: 14, check: false),
                Data(number: 15, check: false),
                Data(number: 16, check: false),
                Data(number: 17, check: false),
                Data(number: 18, check: false),
                Data(number: 19, check: false),
                Data(number: 20, check: false),
                Data(number: 21, check: false),
                Data(number: 22, check: false),
                Data(number: 23, check: false),
                Data(number: 24, check: false),
                Data(number: 25, check: false),
                Data(number: 26, check: false),
                Data(number: 27, check: false),
                Data(number: 28, check: false),
                Data(number: 29, check: false),
                Data(number: 30, check: false)
            ]
    }
}
