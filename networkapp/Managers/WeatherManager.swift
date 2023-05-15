//
//  WeatherManager.swift
//  networkapp
//
//  Created by Nikhil Ivannan on 13/06/22.
//

import Foundation
import CoreLocation

class WeatherManager{
    func getCurrentWeather(latitude : CLLocationDegrees, longitude : CLLocationDegrees) async throws -> ResponseBody{
        guard let url = URL(string : "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=e0777dc02f7e5f64991b16f63684f798&units=metric") else {fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}
