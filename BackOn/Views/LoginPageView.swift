//
//  ContentView.swift
//  BackOn
//
//  Created by Emmanuel Tesauro on 14/02/2020.
//  Copyright © 2020 Emmanuel Tesauro. All rights reserved.
//

import SwiftUI
import GoogleSignIn
import AuthenticationServices

struct LoginPageView: View {
    @EnvironmentObject var shared: Shared
    
    var body: some View {
        VStack {
            HStack() {
                Spacer()
            }
            Text("BackOn")
                .fontWeight(.bold).foregroundColor(.white)
                .font(.title)
                .padding([.top, .bottom], 40)
            
            Image("iosapptemplate")
                .resizable()
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            
            Spacer()
            GoogleButton()
                .frame(width: 200, height: 30, alignment: .center)
                .padding(.bottom, 20)
            Button(action: {
                self.shared.viewToShow = "HomeView"
            }) {
                Text("Home")
                    .bold()
                    .foregroundColor(.black)
            }
//          MyAppleIDButton().frame(width: 200, height: 30, alignment: .center)
//              .padding(.bottom, 20)
            Spacer()
        }
        .background(LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all))
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}

struct GoogleButton: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<GoogleButton>) -> GIDSignInButton {
        let button = GIDSignInButton()
        button.colorScheme = .dark
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        
        return button
    }
    
    func updateUIView(_ uiView: GIDSignInButton, context: UIViewRepresentableContext<GoogleButton>) {
        
    }
}

//struct MyAppleIDButton: UIViewRepresentable {
//
//    func makeUIView(context: UIViewRepresentableContext<MyAppleIDButton>) -> ASAuthorizationAppleIDButton {
//        let appleButton = ASAuthorizationAppleIDButton()
//        appleButton.translatesAutoresizingMaskIntoConstraints = false
//
//        return appleButton
//    }
//
//    func updateUIView(_ uiView: MyAppleIDButton.UIViewType, context: UIViewRepresentableContext<MyAppleIDButton>) {
//
//    }
//}
