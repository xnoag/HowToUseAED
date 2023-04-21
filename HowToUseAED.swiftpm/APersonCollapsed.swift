//
//  APersonCollapsed.swift
//  HowToUseAED
//
//  Created by xnoag on 2023/04/16.
//

import SwiftUI

struct APersonCollapsed: View {
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                HStack {
                    //상황설명VStack
                    VStack(alignment: .leading) {
                        Text("A person collapsed in front of you, \rAnd you witnessed it")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Divider()
                        Text("1. Check for safety before approaching")
                            .font(.title2)
                            .fontWeight(.medium)
                        Text("2. Check for responsiveness")
                            .font(.title2)
                            .fontWeight(.medium)
                        Text("3. Ask a specific person to call 911")
                            .font(.title2)
                            .fontWeight(.medium)
                        Text("4. Have someone bring the AED if available or go get it yourself")
                            .font(.title2)
                            .fontWeight(.medium)
                        Text("5. Check for breathing")
                            .font(.title2)
                            .fontWeight(.medium)
                        Text("6. If the patient is not breathing, perform CPR")
                            .font(.title2)
                            .fontWeight(.medium)
                        Text("7. The AED has arrived now")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.red)
                    } //VStack
                    .frame(width: geo.size.width * 0.5, height: geo.size.height * 1)
                    //AEDCase와TextVStack
                    VStack {
                        NavigationLink(destination: OpenCase()) {
                            Image("AEDCase")
                                .resizable()
                                .scaledToFit()
                        }
                        .accessibility(addTraits: .isButton)
                        .accessibility(identifier: "AEDClickButton")
                        .accessibility(hint: Text("Tap to go to OpenCase View"))
                        .accessibility(addTraits: .playsSound)
                        Text("Click the AED button above \rand let's go save a life")
                            .fontWeight(.bold)
                    }//VStack
                    .frame(width: geo.size.width * 0.3, height: geo.size.height * 1)
                }//HStack
            }//NavigationView
            .navigationBarHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
            .padding()
        }//GeometryReader
    }
}

struct APersonCollapsed_Previews: PreviewProvider {
    static var previews: some View {
        APersonCollapsed()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
