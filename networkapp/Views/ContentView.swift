//
//  ContentView.swift
//  networkapp
//
//  Created by Nikhil Ivannan on 11/06/22.
//

import SwiftUI

struct ContentView : View {
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    
    @State var weather : ResponseBody?
    
    var body : some View{
        VStack{
            if let location = locationManager.location{
                if let weather = weather {
                    WeatherView(weather: weather)
                }
                else{
                    LoadingView()
                        .task{
                            do {
                                try await weather = weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }
                            catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            }
            else {
                if locationManager.isLoading{
                    LoadingView()
                } else {
                    
                }
            }
        }.background(Color(hue: 0.654, saturation: 0.846, brightness: 0.727))
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
