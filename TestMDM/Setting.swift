//
//  Setting.swift
//  TestMDM
//
//  Created by Tomas McGuinness on 07/04/2021.
//

import Foundation

struct Setting: Codable, Hashable, Identifiable {
    var id: Int
    var key: String
    var value: String
    var type: String
}

