//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Harshvardhan Singh Chauhan on 6/1/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: getWeatherIcon(condition: weather.weather[0].main))
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.RoundDouble() + "°")
                            .font(.system(size: 80))
                                .fontWeight(.bold)
                                .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) {
                        image in image .resizable() .aspectRatio(contentMode: .fill)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
        VStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Weather now")
                    .bold()
                HStack {
                    Text(weather.weather[0].description)
                    
                    Spacer()
                    
                    Image(systemName: getWeatherIcon(condition: weather.weather[0].main))
                        .font(.system(size: 40))
                        .padding(.bottom)
                }
                .multilineTextAlignment(.center)
                
                HStack {
                    WeatherRow(logo: "thermometer", name: "Min Temp", value: (weather.main.tempMin.RoundDouble() + "°"))
                    
                    Spacer()
                    
                    WeatherRow(logo: "thermometer", name: "Max Temp", value: (weather.main.tempMax.RoundDouble() + "°"))
                }
                HStack {
                    WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.RoundDouble() + "m/s"))
                    
                    Spacer()
                    
                    WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.RoundDouble() + "%"))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .padding(.bottom, 20)
            .foregroundColor(Color(hue: 0.656,saturation: 0.787,brightness: 0.354))
            .background(.white)
            .cornerRadius(20, corners: [.topLeft,.topRight])
        }
        
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656,saturation: 0.787,brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
