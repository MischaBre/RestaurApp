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
                Button("Abbrechen") {
                    restaurantListVM.name = ""
                    selection.selection = 1
                }
                .foregroundColor(.red)
                .padding()
                Spacer()
                Button("Save") {
                    restaurantListVM.save()
                    restaurantListVM.name = ""
                    restaurantListVM.category = ""
                    selection.selection = 1
                }.padding()
            }
            
            TextField("Name", text: $restaurantListVM.name)
                .textFieldStyle(.roundedBorder)
            
            TextField("Kategorie", text: $restaurantListVM.category)
                .textFieldStyle(.roundedBorder)
            
        }.padding()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView().environmentObject(RestaurantListViewModel())
    }
}
