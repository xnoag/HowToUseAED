//
//  AttachingPadExplain.swift
//  HowToUseAED
//
//  Created by xnoag on 2023/04/16.
//

import SwiftUI
import AVFoundation
import AVKit

struct AttachingPadExplain: View {
    @State var audioPlayer: AVAudioPlayer!
    let buttonClickSound1 = Bundle.main.path(forResource: "ButtonClickSound", ofType: "mp3")
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    Image("AttachingPadView")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.05)
                        .frame(width: geo.size.width * 1, height: geo.size.height * 0.9)
                        .background(Color.white)
                    VStack {
                        Spacer()
                            .frame(width: geo.size.width * 1, height: geo.size.height * 0.3)
                        VStack(alignment: .leading) {
                            Text("Great!")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(.bottom, 10)
                            Text("One pad should be placed on the upper right side of the person's chest, \rand the other should be placed on the lower left side of the chest.\rIf the patient's chest is wet, it is better to dry it before using the AED.")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                        }
                            .frame(width: geo.size.width * 1, height: geo.size.height * 0.3)
                        Spacer()
                            .frame(width: geo.size.width * 1, height: geo.size.height * 0.2)
                        HStack {
                            Spacer()
                                .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.2)
                            NavigationLink(destination: PlugIn()) {
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

struct AttachingPadExplain_Previews: PreviewProvider {
    static var previews: some View {
        AttachingPadExplain()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
