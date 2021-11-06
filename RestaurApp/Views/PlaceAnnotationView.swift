//
//  PlaceAnnotationView.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 06.11.21.
//

import SwiftUI
import MapKit

struct PlaceAnnotationView: View {

    let title: String
    @Binding var showTitle: Bool
  
    var body: some View {
        VStack(spacing: 0) {
            
            Text(title)
                .font(.callout)
                .padding(3)
                .background(Color(.white))
                .cornerRadius(5)
                .offset(x: 0, y: -35)
                .opacity(showTitle ? 1 : 0)
        
            Image(systemName: "mappin.circle.fill")
                .font(.title)
                .foregroundColor(.red)
                .offset(x: 0, y: -35)
      
            Image(systemName: "arrowtriangle.down.fill")
                .font(.caption)
                .foregroundColor(.red)
                .offset(x: 0, y: -40)
        }

    }
}
