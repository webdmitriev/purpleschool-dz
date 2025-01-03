//
//  ApiClient.swift
//  WeatherApp
//
//  Created by Олег Дмитриев on 03.01.2025.
//

import Foundation
import CoreLocation
import Alamofire

class ApiClient {
    
    private static let API_KEY = "3f0a557a90ab4006b0784543250101"
    
    func fetchWeather(for location: CLLocationCoordinate2D) async -> WeatherResponse? {
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(Self.API_KEY)&q=\(location.latitude),\(location.longitude)"
        
        do {
            let data = try await AF.request(urlString).serializingData().value
            let decoder = JSONDecoder()
            return try decoder.decode(WeatherResponse.self, from: data)
        } catch {
            return nil
        }
    }
    
}
