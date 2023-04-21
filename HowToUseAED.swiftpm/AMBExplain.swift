//
//  AMB.swift
//  HowToUseAED
//
//  Created by xnoag on 2023/04/18.
//

import SwiftUI
import AVFoundation
import AVKit

struct AMBExplain: View {
    let buttonClickSound = Bundle.main.path(forResource: "Siren", ofType: "mp3")
    @State var audioPlayer: AVAudioPlayer!
    var body: some View {
            GeometryReader { geo in
                NavigationView {
                    ZStack {
                        VStack {
                            VStack {
                                Spacer()
                                Text("You are A HERO!")
                                    .font(.title)
                                    .fontWeight(.bold)
                                ProgressView(value: 7, total: 7)
                                    .scaleEffect(y: 2)
                                    .progressViewStyle(.customProgressView)
                                    .padding()
                            }
                            .frame(width: geo.size.width * 1, height: geo.size.height * 0.05)
                            VStack {
                                Image("AMB")
                                    .resizable()
                                    .scaledToFit()
                                Text("911 has arrived.\rYou have saved someone's precious parents, child, friend, or lover. \rWe hope you never have to use an AED,\rbut if you do, we hope this simulator can be helpful.")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                            }.frame(width: geo.size.width * 1, height: geo.size.height * 0.9)
                        }//VStack
                        VStack(alignment: .trailing) {
                            Spacer()
                            HStack {
                                Spacer()
                                NavigationLink(destination: APersonCollapsed()) {
                                    Text("RePlay")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 30.0)
                                        .padding(.vertical, 15)
                                        .background(Color.red)
                                        .cornerRadius(10)
                                        .padding()
                                }
                            }
                        }//VStack
                    }//ZStack
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: buttonClickSound!))
                            audioPlayer?.play()
                        }
                    }
                    .onDisappear() {
                            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: buttonClickSound!))
                            audioPlayer?.stop()
                    }

                }//NavigationView
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationBarHidden(true)
            }//GeometryReader
    }
}

struct AMBExplain_Previews: PreviewProvider {
    static var previews: some View {
        AMBExplain()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
