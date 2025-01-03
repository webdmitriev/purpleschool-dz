//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Олег Дмитриев on 01.01.2025.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet private weak var locationLabel: UILabel!
    var location: String? {
        didSet {
            guard let location = self.location else { return }
            self.locationLabel.text = location
        }
    }

    @IBOutlet weak var weatherImage: UIImageView!
    var weather: String? {
        didSet {
            guard let weather = self.weather else { return }

            if let url = URL(string: "https:\(weather)") {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    
                    DispatchQueue.main.async {
                        self.weatherImage.image = UIImage(data: data)
                    }
                }
                
                task.resume()
            }
        }
    }
    
    var temperature: Int? {
        didSet {
            guard let temperature = self.temperature else { return }
            self.temperatureLabel.text = "\(temperature)°"
        }
    }
    
    @IBOutlet private weak var temperatureLabel: UILabel!
    
    @IBAction func didTapRefreshButton(_ sender: Any) {
        self.didRequestRefresh?()
    }
    
    var didRequestRefresh: (() -> Void)?
}



