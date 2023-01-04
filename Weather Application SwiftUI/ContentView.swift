//
//  ContentView.swift
//  Weather Application SwiftUI
//
//  Created by Sahid Reza on 03/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    @ObservedObject var locatinManager = LocationManager()
    
     
   
   
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                
                CityTextView(locationName: "Beldanga, West Bengal , India")
                
                MeainWeatherStatusView(imageName: "cloud.sun.fill", tempareture: "76°C")
                
                Text(locatinManager.latittude)
                
                HStack {
                    
                    FutureDayView(dayName: "Mon", imageName: "cloud.sun.fill", tempareture: 28)
                    FutureDayView(dayName: "Mon", imageName: "cloud.sun.fill", tempareture: 28)
                    FutureDayView(dayName: "Mon", imageName: "cloud.sun.fill", tempareture: 28)
                    FutureDayView(dayName: "Mon", imageName: "cloud.sun.fill", tempareture: 28)
                    FutureDayView(dayName: "Mon", imageName: "cloud.sun.fill", tempareture: 28)
                    
                }
                
                Spacer()
                
                Button("Change Day time") {
                   
                    
                    isNight.toggle()
                    
                }.frame(width: 280,height: 50)
                    .background(Color.white)
                    .font(.system(size: 20,weight: .bold,design: .default))
                    .cornerRadius(10)
                
                Spacer()
                
            }.onAppear{
            print("step1")
                
                locatinManager.requestLocation()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct FutureDayView: View {
    
    let dayName:String
    let imageName:String
    let tempareture:Int
    
    
    var body: some View {
        VStack {
            Text(dayName)
                .font(.system(size: 20))
                .fontWeight(.medium)
                .foregroundColor(Color.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50,height: 50,alignment: .center)
            
            Text("\(tempareture)°C")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
        }.padding(.horizontal,6)
    }
}

struct BackgroundView: View {
    
    @Binding var isNight:Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: isNight ? [Color.black, Color.gray]:[Color.blue,Color("lighBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView:View{
    
    let locationName:String
    
      
    var body: some View {
    
        Text(locationName)
            .font(.system(size: 25))
            .fontWeight(.medium)
            .foregroundColor(Color.white)
            .padding()
        
    }
    
    
}

struct MeainWeatherStatusView: View {
    
    let imageName:String
    let tempareture:String
    
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180,alignment: .center)
            Text(tempareture)
                .font(.system(size: 70))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
        }.padding(.bottom)
    }
}



