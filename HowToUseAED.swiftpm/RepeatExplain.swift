//
//  RepeatExplain.swift
//  HowToUseAED
//
//  Created by xnoag on 2023/04/18.
//

import SwiftUI
import AVFoundation
import AVKit

struct RepeatExplain: View {
    let buttonClickSound = Bundle.main.path(forResource: "Repeat", ofType: "mp3")
    let buttonClickSound1 = Bundle.main.path(forResource: "ButtonClickSound", ofType: "mp3")
    @State var audioPlayer: AVAudioPlayer!
    var body: some View {
        NavigationView {
        GeometryReader { geo in
            ZStack {
                Image("WhiteView")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.05)
                    .frame(width: geo.size.width * 1, height: geo.size.height * 0.9)
                VStack {
                    Spacer()
                        .frame(width: geo.size.width * 1, height: geo.size.height * 0.3)
                    VStack(alignment: .leading) {
                        Text("Please continue to repeat\rthe Defibrillation and CPR steps until the ambulance personnel arrive,\raccording to the instructions of the guidance voice.")
                            .font(.largeTitle)
                            .fontWeight(.bold)
//                            .padding(.bottom, 10)
//                        Text("This is a simulator, so CPR was performed for only 30 times,\rbut in reality, it is recommended to do it for about 2 minutes.")
//                            .font(.title)
//                            .fontWeight(.bold)
                    }
                        .frame(width: geo.size.width * 1, height: geo.size.height * 0.3)
                    Spacer()
                        .frame(width: geo.size.width * 1, height: geo.size.height * 0.2)
                    HStack {
                        Spacer()
                            .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.2)
                        NavigationLink(destination: AMBExplain()) {
                            Text("Next Step")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.horizontal, 30.0)
                                .padding(.vertical, 15)
                                .background(Color.red)
                                .cornerRadius(10)
                        }//NavigationLink
                    }//HStack
                }//VStack
            }//ZStack
            .padding()
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: buttonClickSound!))
                    audioPlayer?.play()
                }
            }
            .onDisappear() {
                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: buttonClickSound1!))
                audioPlayer?.play()
            }
        }//GeometryReader
    }//NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
    }
}

struct RepeatExplain_Previews: PreviewProvider {
    static var previews: some View {
        RepeatExplain()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}

