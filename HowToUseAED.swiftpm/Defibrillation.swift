//
//  Defibrillation.swift
//  HowToUseAED
//
//  Created by xnoag on 2023/04/18.
//

import SwiftUI
import AVFoundation
import AVKit

struct Defibrillation: View {
    let buttonClickSound = Bundle.main.path(forResource: "Defibrillation", ofType: "mp3")
    @State var audioPlayer: AVAudioPlayer!
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {
                    VStack {
                        Spacer()
                        Text("Press the shock button with the number 3 on it to deliver a shock now.")
                            .font(.title2)
                            .fontWeight(.bold)
                        ProgressView(value: 5, total: 7)
                            .scaleEffect(y: 2)
                            .progressViewStyle(.customProgressView)
                            .padding()
                    }
                        .frame(width: geo.size.width * 1, height: geo.size.height * 0.05)
                    Spacer()
                        .frame(width: geo.size.width * 1, height: geo.size.height * 0.05)
                    HStack {
                        Image("AfterPadPatient")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.9)
                        
                        ZStack {
                            Image("AfterPlugInAED")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.9)
                            HStack {
                                Spacer()
                                    .frame(width: geo.size.width * 0.22, height: geo.size.height * 0.9)
                                VStack {
                                    Spacer()
                                        .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.68)
                                    NavigationLink(destination: DefibrillationExplain()) {
                                        Image("3Button")
                                            .resizable()
                                            .scaledToFit()
                                    }//NavigationLink
                                    Spacer()
                                        .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.045)
                                }//VStack
                            }//HStack
                        }//ZStack
                    }//HStack
                    .frame(width: geo.size.width * 1, height: geo.size.height * 0.9)
                }//VStack
                .frame(width: geo.size.width * 1, height: geo.size.height * 1)
                .padding()
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: buttonClickSound!))
                        audioPlayer?.play()
                    }
                }

                    
            }//GeometryReader
        }//NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
    }
}

struct Defibrillation_Previews: PreviewProvider {
    static var previews: some View {
        Defibrillation()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
