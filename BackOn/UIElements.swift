//
//  UIElements.swift
//  BeMyPal
//
//  Created by Vincenzo Riccio on 12/02/2020.
//  Copyright © 2020 Vincenzo Riccio. All rights reserved.
//

import SwiftUI

var locAlert = Alert(
    title: Text("Location permission denied"),
    message: Text("To let the app work properly, enable location permissions"),
    primaryButton: .default(Text("Open settings")) {
        if let url = URL(string:UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    },
    secondaryButton: .cancel()
)

struct CloseButton: View {
    @EnvironmentObject var shared: Shared
    
    var body: some View {
        ZStack{
            Image(systemName: "circle.fill")
                .font(.title)
                .foregroundColor(Color(.systemGroupedBackground))
            Button(action: {
                withAnimation{
                    HomeView.show(self.shared)
                }}){
                    Image(systemName: "xmark.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(Color(#colorLiteral(red: 0.7803921569, green: 0.7803921569, blue: 0.8, alpha: 1)))
            }
        }
    }
}

struct NeederButton: View {
    @EnvironmentObject var shared: Shared
    
    var body: some View {
            Button(action: {
                withAnimation{
                    NeederView.show(self.shared)
                    self.shared.helperMode = false
                }}){
                    Image(systemName: "person")
                        .font(.largeTitle)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            }
        
    }
}

struct DoItButton: View {
    @EnvironmentObject var shared: Shared
    
    var body: some View {
        HStack{
            Spacer()
            Button(action: {
                print("I'll do it")
                NeederView.show(self.shared)
            }) {
                HStack{
                    Text("I'll do it ")
                        .fontWeight(.regular)
                        .font(.title)
                    Image(systemName: "hand.raised")
                        .font(.title)
                }
                .padding(20)
                .background(Color(.systemBlue))
                .cornerRadius(40)
                .foregroundColor(.white)
                .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color(.systemBlue), lineWidth: 0).foregroundColor(Color(.systemBlue))
                )
            }.buttonStyle(PlainButtonStyle())
            Spacer()
        }
    }
}

struct CantDoItButton: View {
    @EnvironmentObject var shared: Shared
    
    var body: some View {
        HStack{
            Spacer()
            Button(action: {
                print("Can't do it")
                AddNeedView.show(self.shared)
            }) {
                HStack{
                    Text("Can't do it ")
                        .fontWeight(.regular)
                        .font(.title)
                    Image(systemName: "hand.raised.slash")
                        .font(.title)
                }
                .padding(20)
                .background(Color(.systemRed))
                .cornerRadius(40)
                .foregroundColor(.white)
                .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color(.systemRed), lineWidth: 0).foregroundColor(Color(.systemRed))
                )
            }.buttonStyle(PlainButtonStyle())
            Spacer()
        }
    }
}

struct DoItButton_Previews: PreviewProvider {
    static var previews: some View {
        DoItButton()
    }
}

struct AddNeedButton: View {
    @EnvironmentObject var shared: Shared
    
    var body: some View {
        HStack{
            Spacer()
            Button(action: {
                print("Need help!")
                AddNeedView.show(self.shared)
            }) {
                HStack{
                    Text("Add Need ")
                        .fontWeight(.regular)
                        .font(.title)
                    Image(systemName: "person.2")
                        .font(.title)

                }
                .padding(20)
                .background(Color.blue)
                .cornerRadius(40)
                .foregroundColor(.white)
                .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.blue, lineWidth: 1).foregroundColor(Color.blue)
                )
            }
            Spacer()
        }
    }
}

struct AddNeedButton_Previews: PreviewProvider {
    static var previews: some View {
        AddNeedButton()
    }
}

struct ConfirmAddNeedButton: View {
    @EnvironmentObject var shared: Shared
    
    var body: some View {
        HStack{
            Spacer()
            Button(action: {
                print("Add need!")
//                IMPORTANTE SALVA NEED E INVIALO AL SERVER
                NeederView.show(self.shared)
            }) {
                HStack{
                    Text("Confirm ")
                        .fontWeight(.regular)
                    Image(systemName: "hand.thumbsup")
                }
                .font(.title)
                .padding(20)
                .background(Color.blue)
                .cornerRadius(40)
                .foregroundColor(.white)
                .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.blue, lineWidth: 1).foregroundColor(Color.blue)
                )
            }
            Spacer()
        }
    }
}

struct ConfirmAddNeedButton_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmAddNeedButton()
    }
}

