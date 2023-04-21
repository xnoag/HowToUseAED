//
//  TurnOnAED.swift
//  HowToUseAED
//
//  Created by xnoag on 2023/04/16.
//

import SwiftUI
import AVFoundation
import AVKit

struct TurnOnAED: View {
    let buttonClickSound = Bundle.main.path(forResource: "ButtonClickSound", ofType: "mp3")
    @State var audioPlayer: AVAudioPlayer!
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {
                    VStack {
                        Spacer()
                        Text("Turn on the AED by pressing the power Button1")
                            .font(.title)
                            .fontWeight(.bold)
                        ProgressView(value: 1, total: 7)
                            .scaleEffect(y: 2)
                            .progressViewStyle(.customProgressView)
                            .padding()
                    }
                        .frame(width: geo.size.width * 1, height: geo.size.height * 0.05)
                    Spacer()
                        .frame(width: geo.size.width * 1, height: geo.size.height * 0.05)
                    HStack {
                        Image("Patient")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.9)
                        ZStack {
                            Image("AEDInitial")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.9)
                            VStack {
                                Spacer()
                                    .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.3)
                                HStack {
                                    Spacer()
                                        .frame(width: geo.size.width * 0.26, height: geo.size.height * 0.1)
                                    NavigationLink(destination: TurnOnAEDExplain()) {
                                        Image("1Button")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.12)
                                    }
                                    Spacer()
                                        .frame(width: geo.size.width * 0.1, height: geo.size.height * 0.1)
                                }//HStack
                                .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.225)
                                Spacer()
                                    .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.475)
                            }//VStack
                            .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.9)
                        }//ZStack
                    }//HStack
                    .frame(width: geo.size.width * 1, height: geo.size.height * 0.9)
                }//VStack
                .frame(width: geo.size.width * 1, height: geo.size.height * 1)
                .padding()
                .onAppear() {
                    self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: buttonClickSound!))
                    audioPlayer?.play()
                }
            }//GeometryReader
        }//NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
    }
}

struct TurnOnAED_Previews: PreviewProvider {
    static var previews: some View {
        TurnOnAED()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
