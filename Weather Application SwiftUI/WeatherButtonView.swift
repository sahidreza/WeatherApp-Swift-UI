//
//  WeatherButtonView.swift
//  Weather Application SwiftUI
//
//  Created by Sahid Reza on 03/01/23.
//

import Foundation
import SwiftUI

struct ButtonView: View {
    
    var buttonTitel:String
    
    var body: some View {
        
        Button(buttonTitel) {
            
            print("Hello World")
            
        }.frame(width: 280,height: 50)
            .background(Color.white)
            .font(.system(size: 20,weight: .bold,design: .default))
            .cornerRadius(10)
    }
}
