//
//  ContentView.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 3/22/22.
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
                        NavigationLink(destination: LogInView(placeHolder: "Ok",
                                                              value: "Ok",
                                                              lineColor: .black,
                                                              width: 1)) {
                            Text(LocalizedStringKey.init("logIn"))
                                .modifier(ParameterModifier(width: 70,
                                                            backgroundColor: .white,
                                                            foregroundColor: .black))
                        }
                        
                        NavigationLink(destination: RegisterView()) {
                            Text(LocalizedStringKey.init("register"))
                                .modifier(ParameterModifier(width: 120,
                                                            backgroundColor: .blue,
                                                            foregroundColor: .white))
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

