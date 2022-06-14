//
//  ContentView.swift
//  networkapp
//
//  Created by Nikhil Ivannan on 11/06/22.
//

import SwiftUI

struct ContentView : View {
    @StateObject var locationManager = LocationManager()
    
    var body : some View{
        VStack{
            if let location = locationManager.location{
                Text("Your Coordinates are:\n\(location.latitude),\n\(location.longitude)")
            }
            else {
                if locationManager.isLoading{
                    LoadingView()
                } else {
                    WelcomeView().environmentObject(locationManager)
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
