//
//  WelcomeView.swift
//  networkapp
//
//  Created by Nikhil Ivannan on 13/06/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager : LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 20)
            {
                Text("Welcome To Weather App")
                    .bold().font(.title)
                Text("Please share your current location to get the weather in your area").padding()
            }
                .multilineTextAlignment(.center)
                .padding()
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.slash)
            .foregroundColor(.white)
            
        }.frame(maxWidth: .infinity,  maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
