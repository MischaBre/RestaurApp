//
//  AddView.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 31.10.21.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var restaurantListVM: RestaurantListViewModel
    @EnvironmentObject var selection: Selection
    var body: some View {
        VStack {
            HStack {
                TextField("Enter Name", text: $restaurantListVM.name)
                Button("Save") {
                    restaurantListVM.save()
                    restaurantListVM.name = ""
                    selection.selection = 1
                }
            }
            
        }.padding()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
