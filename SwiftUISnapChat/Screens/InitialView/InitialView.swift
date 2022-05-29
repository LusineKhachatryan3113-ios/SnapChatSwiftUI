//
//  SignInView.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 5/12/22.
//

import SwURL
import SwiftUI

struct InitialView: View {
    @Environment(\.presentationMode) var presentation
    var body: some View {
        NavigationView {
            ZStack {
                Color(hue: 0.1639, saturation: 1, brightness: 1)
                    .ignoresSafeArea()
                VStack {
                    Image(uiImage: UIImage(named: "SnapChat")!)
                        .aspectRatio(contentMode: .fit)
                }
                .padding(.bottom, 200)
                VStack {
                    Spacer()
                    HStack {
                        NavigationLink(destination: LogInView()) {
                            Text(LocalizedStringKey.init("logIn"))
                                .modifier(ParameterModifier(width: 90,
                                                            backgroundColor: .white,
                                                            foregroundColor: .black,
                                                            height: 40,
                                                            alignment: .center,
                                                            size: 15))
                        }
                        NavigationLink(destination: RegisterView()) {
                            Text(LocalizedStringKey.init("register"))
                                .modifier(ParameterModifier(width: 120,
                                                            backgroundColor: .blue,
                                                            foregroundColor: .white,
                                                            height: 40,
                                                            alignment: .center,
                                                            size: 15))
                        }
                    }
                }
                .padding(.bottom , 50)
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            InitialView()
            
        }
        
    }
    
}
