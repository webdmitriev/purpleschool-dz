//
//  AppState.swift
//  WeatherApp
//
//  Created by Олег Дмитриев on 03.01.2025.
//

import Foundation
import CoreLocation

enum AppState {
    case retrievingLocation
    case failedToRetrieveLocation
    case retrievingWeather(location: CLLocationCoordinate2D)
    case failedToRetrieveWeather
    case weather(city: String, temperature: Int, image: String)
}
