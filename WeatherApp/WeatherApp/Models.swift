//
//  Models.swift
//  WeatherApp
//
//  Created by Олег Дмитриев on 03.01.2025.
//

import Foundation

struct WeatherResponse: Codable {
    var location: LocationModel
    var current: CurrentModel
}

struct LocationModel: Codable {
    var name: String
}

struct CurrentModel: Codable {
    var temp_c: Double
    var condition: ConditionModel
}

struct ConditionModel: Codable {
    var icon: String
}
