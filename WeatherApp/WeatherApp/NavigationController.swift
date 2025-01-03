//
//  NavigationController.swift
//  WeatherApp
//
//  Created by Олег Дмитриев on 01.01.2025.
//

import UIKit
import CoreLocation
import SwiftLocation

class NavigationController: UINavigationController {
    
    var appState: AppState? {
        didSet {
            guard let appState = self.appState else { return }
            
            switch appState {
            case .retrievingLocation:
                self.showProcessScreen(withMessage: "Определяем ваше местоположение...")

                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    Task {
                        let userLocation = await self.retrieveLocation()
                        print(userLocation ?? "not found")
                        
                        DispatchQueue.main.async {
                            if let userLocation = userLocation {
                                self.appState = .retrievingWeather(location: userLocation)
                            } else {
                                self.appState = .failedToRetrieveLocation
                            }
                        }
                    }
                })
                
            case .failedToRetrieveLocation:
                self.showError(withMessage: "Не удалось определить ваше местоположение", actionButtonTitle: "Открыть настройки") {
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                }
                
            case .retrievingWeather(let location):
                self.showProcessScreen(withMessage: "Уточняем погоду для вашей локации...")
                
                Task {
                    let weather = await ApiClient().fetchWeather(for: location)
                    
                    DispatchQueue.main.async {
                        if let weather = weather {
                            self.appState = .weather(city: weather.location.name, temperature: Int(weather.current.temp_c), image: weather.current.condition.icon)
                        } else {
                            self.appState = .failedToRetrieveWeather
                        }
                    }
                }
                
            case .failedToRetrieveWeather:
                self.showError(withMessage: "Не удалось связаться с сервером", actionButtonTitle: "Попробовать ещё раз") {
                    self.appState = .retrievingLocation
                }
                
            case .weather(city: let city, temperature: let temperature, let image):
                self.showWeather(withTemperature: temperature, forLocation: city, image: image) {
                    self.appState = .retrievingLocation
                }
            }
        }
    }
    
    private let location = Location()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.appState = .retrievingLocation
        //self.appState = .failedToRetrieveWeather
    }
    
    func showWeather(withTemperature temperature: Int, forLocation location: String, image: String, onRequestedRefresh: @escaping () -> Void) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "WeatherViewController") as? WeatherViewController else { return }
        
        let _ = vc.view // смахивает на какоход _)) обходной путь как бы _))
        vc.location = location
        vc.weather = image
        vc.temperature = temperature
        vc.didRequestRefresh = onRequestedRefresh
        self.viewControllers = [vc]
    }
    
    func showProcessScreen(withMessage message: String) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "ProcessViewController") as? ProcessViewController else { return }
        
        let _ = vc.view
        vc.message = message
        self.viewControllers = [vc]
    }
    
    func showError(withMessage message: String, actionButtonTitle: String, onTappedActionButton: @escaping () -> Void) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "ErrorViewController") as? ErrorViewController else { return }
        
        let _ = vc.view
        vc.message = message
        vc.actionButtonTitle = actionButtonTitle
        vc.didRequestOpenSettings = onTappedActionButton
        self.viewControllers = [vc]
    }
    
    private func retrieveLocation() async -> CLLocationCoordinate2D? {
        do {
            try await self.location.requestPermission(.whenInUse)
            let result = try await self.location.requestLocation().location?.coordinate
            return result
        } catch {
            return nil
        }
        
    }
}
