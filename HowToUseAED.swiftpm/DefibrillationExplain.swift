//
//  DefibrillationExplain.swift
//  HowToUseAED
//
//  Created by xnoag on 2023/04/18.
//

import SwiftUI
import AVFoundation
import AVKit

struct DefibrillationExplain: View {
    let buttonClickSound = Bundle.main.path(forResource: "Electricity", ofType: "mp3")
    let buttonClickSound1 = Bundle.main.path(forResource: "ButtonClickSound", ofType: "mp3")
    @State var audioPlayer: AVAudioPlayer!
    var body: some View {
        NavigationView {
        GeometryReader { geo in
            ZStack {
                Image("TurnOnAEDView")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.05)
                    .frame(width: geo.size.width * 1, height: geo.size.height * 0.9)
                VStack {
                    Spacer()
                        .frame(width: geo.size.width * 1, height: geo.size.height * 0.3)
                    VStack(alignment: .leading) {
                        Text("Great!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom, 10)
                        Text("If defibrillation is needed, the machine automatically charges\rand prompts you to press the shock button after charging is complete.")
                            .font(.title)
                            .fontWeight(.bold)                    }
                        .frame(width: geo.size.width * 1, height: geo.size.height * 0.3)
                    Spacer()
                        .frame(width: geo.size.width * 1, height: geo.size.height * 0.2)
                    HStack {
                        Spacer()
                            .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.2)
                        NavigationLink(destination: CPR()) {
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
                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: buttonClickSound!))
                audioPlayer?.play()
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

struct DefibrillationExplain_Previews: PreviewProvider {
    static var previews: some View {
        DefibrillationExplain()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
