//
//  CPR.swift
//  HowToUseAED
//
//  Created by xnoag on 2023/04/18.
//

import SwiftUI
import AVFoundation
import AVKit

struct CPR: View {
    let buttonClickSound = Bundle.main.path(forResource: "Blop", ofType: "mp3")
    let buttonClickSound1 = Bundle.main.path(forResource: "CPR", ofType: "mp3")
    @State var audioPlayer: AVAudioPlayer!
    @State private var count = 0
    var body: some View {
        
        if count >= 30 {
            CPRExplain()
        }
        else {
            NavigationView {
                GeometryReader { geo in
                    VStack {
                        VStack {
                            Spacer()
                            Text("Perform 30 compressions for CPR.")
                                .font(.title)
                                .fontWeight(.bold)
                            ProgressView(value: 6, total: 7)
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
                                .overlay(
                                    VStack {
                                        Spacer()
                                            .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.4)
                                        HStack {
                                            Spacer()
                                                .frame(width: geo.size.width * 0.25, height: geo.size.height * 0.5)
                                            Button(action: {
                                                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: buttonClickSound!))
                                                audioPlayer?.play()
                                                count += 1
                                            }) {
                                                Image(systemName: "heart.fill")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .foregroundColor(.red)
                                                    .frame(width: geo.size.width * 0.15, height: geo.size.height * 0.5)
                                            }
                                            Spacer()
                                                .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.5)
                                        }//HStack
                                        .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.5)
                                    }//VStack
                                )
                            Text("\(count)")
                                .font(.custom("CustomFont", size: 150))
                                .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.9)
                        }
                    }//VStack
                    .padding()
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: buttonClickSound1!))
                            audioPlayer?.play()
                        }
                    }
                }
            }//NavigationView
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}

struct CPR_Previews: PreviewProvider {
    static var previews: some View {
        CPR()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
