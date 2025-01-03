Домашки:

dz-1. Количество яблок

dz-2. Коллекции

dz-3. Условные операторы

dz-4. Функции

dz-5. Углубленная работа с массивами

dz-6. Обработка ошибок

dz-7. Объектно-ориентированное программирование

dz-8 (FirstApp). UIKit

dz-9 Weather App


### WeatherViewController: change image from url

```swift

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

```

### Models: Added new struct ConditionModel

```swift
struct CurrentModel: Codable {
    var temp_c: Double
    var condition: ConditionModel
}

struct ConditionModel: Codable {
    var icon: String
}
```

### NavigationController: Added param image for func showWeather

```swift
func showWeather(withTemperature temperature: Int, forLocation location: String, image: String, onRequestedRefresh: @escaping () -> Void) {
    guard let vc = self.storyboard?.instantiateViewController(identifier: "WeatherViewController") as? WeatherViewController else { return }
    
    let _ = vc.view // смахивает на какоход _)) обходной путь как бы _))
    vc.location = location
    vc.weather = image
    vc.temperature = temperature
    vc.didRequestRefresh = onRequestedRefresh
    self.viewControllers = [vc]
}
```
