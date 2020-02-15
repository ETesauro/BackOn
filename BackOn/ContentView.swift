//
//  ContentView.swift
//  BeMyPal
//
//  Created by Vincenzo Riccio on 10/02/2020.
//  Copyright © 2020 Vincenzo Riccio. All rights reserved.
//

import SwiftUI

extension View {
    static func show(_ shared: Shared) {
        shared.viewToShow = String(describing: self)
    }
}

struct ContentView: View {
    @EnvironmentObject var shared: Shared
    
    var body: some View {
        VStack{
            if shared.viewToShow == "HomeView" {
                HomeView()
//                    .transition(.move(edge: .bottom))
//                    .animation(.spring())
            } else if shared.viewToShow == "LoginPageView"{
                LoginPageView()
            } else if shared.viewToShow == "CommitmentDetailedView"{
                CommitmentDetailedView()
//                    .transition(.move(edge: .bottom))
//                    .animation(.spring())
            } else {
                Text("Vista sbagliata :(")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(.primary)
            }
        }.alert(isPresented: $shared.locationManager.showAlert){locAlert}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

