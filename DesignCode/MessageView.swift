//
//  ContentView.swift
//  DesignCode
//
//  Created by Ryan Yogan on 6/27/23.
//

import SwiftUI

struct MessageView: View {
    @State var time = 0.0
    @State var showMessage = true
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        content
            .opacity(showMessage ? 1 : 0)
            .scaleEffect(showMessage ? 1 : 0)
            .rotationEffect(.degrees(showMessage ? 0 : 30))
            .offset(y: showMessage ? 0 : 500)
            .blur(radius: showMessage ? 0 : 20)
            .padding(10)
            .dynamicTypeSize(.xSmall ... .xxxLarge)
        
    }
    
    var content: some View {
        VStack(alignment: .center, spacing: 20.0) {
            Image(systemName: "timelapse", variableValue: time)
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .font(.system(size: 50))
                .fontWeight(.thin)
                .onReceive(timer) { value in
                    if (time < 1.0) {
                        time += 0.1
                    } else {
                        time = 0.0
                    }
                }
            Text("Switching Apps".uppercased())
                .font(.largeTitle.width(.condensed))
                .fontWeight(.bold)
            Text("Tap and hold any part of the screen for 1 second to show the menu for switching between apps")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .fontWeight(.medium)
            Button {
                withAnimation(.easeInOut) {
                    showMessage = false
                }
            } label: {
                Text("Got it")
                    .padding(.all)
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.2).gradient)
                    .cornerRadius(10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                            .foregroundStyle(.linearGradient(colors: [.white.opacity(0.5), .clear, .white.opacity(0.5), .clear], startPoint: .topLeading, endPoint: .bottomTrailing))
                    )
            }.accentColor(.primary)
                .shadow(radius: 10)
            
            
        }
        .padding(30)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke()
            .foregroundStyle(.linearGradient(colors: [.white.opacity(0.5), .clear, .white.opacity(0.5), .clear], startPoint: .top, endPoint: .bottom))
        )
        .shadow(color: .black.opacity(0.3), radius: 20, y: 20)
        .frame(maxWidth: 500)
    }
    
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
            .background(Image("Wallpaper 2"))
    }
}
