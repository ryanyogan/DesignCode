//
//  ContentView.swift
//  DesignCode
//
//  Created by Ryan Yogan on 6/27/23.
//

import SwiftUI

struct ContentView: View {
    @State var showMenu = false
    @AppStorage("selectedMenu") var selectedMenu: Menu = .compass
    @GestureState var press = false
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 1)
            .updating($press) { currentState, gestureState, transation in
                gestureState = currentState
            }
            .onEnded { value in
                showMenu = value
            }
    }
    
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            
            switch selectedMenu {
            case .compass:
                MessageView()
            case .card:
                Text("Card")
            case .charts:
                Text("Card")
            case .radial:
                Text("Card")
            case .halfsheet:
                MenuView()
            case .gooey:
                Text("Card")
            case .actionbutton:
                Text("Card")
            }
            
        }
        .gesture(longPress)
        .sheet(isPresented: $showMenu) {
            MenuView()
                .presentationDetents([.medium, .large])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
