//
//  ModelData.swift
//  WeatherApp
//
//  Created by Harshvardhan Singh Chauhan on 6/1/24.
//

import Foundation

var previewWeather: ResponseBody = load("weatherData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


func getWeatherIcon(condition: String) -> String {
    switch condition.lowercased() {
    case "clear":
        return "sun.max"
    case "clouds":
        return "cloud"
    case "rain":
        return "cloud.rain"
    case "drizzle":
        return "cloud.drizzle"
    case "thunderstorm":
        return "cloud.bolt.rain"
    case "snow":
        return "cloud.snow"
    case "mist", "fog", "haze":
        return "cloud.fog"
    default:
        return "cloud"
    }
}
