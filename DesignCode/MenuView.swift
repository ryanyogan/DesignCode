//
//  MenuView.swift
//  DesignCode
//
//  Created by Ryan Yogan on 6/27/23.
//

import SwiftUI

struct MenuView: View {
    @AppStorage("selectedMenu") var selectedMenu: Menu = .compass
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List(navigationItems) { item in
            Button {
                selectedMenu = item.menu
                presentationMode.wrappedValue.dismiss()
            } label: {
                Label(item.title, systemImage: item.icon)
                    .foregroundColor(.primary)
                    .padding(8)
            }
        }
        .listStyle(.plain)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
