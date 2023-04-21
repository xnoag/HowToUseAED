//
//  OpenCase.swift
//  HowToUseAED
//
//  Created by xnoag on 2023/04/16.
//

import SwiftUI
import AVFoundation
import AVKit

struct OpenCase: View {
    let buttonClickSound = Bundle.main.path(forResource: "ButtonClickSound", ofType: "mp3")
    @State var audioPlayer: AVAudioPlayer!
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {
                    VStack {
                        Spacer()
                        Text("Open the AED case")
                            .font(.title)
                            .fontWeight(.bold)
                        ProgressView(value: 0, total: 7)
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
                        VStack {
                            Image("AEDCase")
                                .resizable()
                                .scaledToFit()
                            NavigationLink(destination: OpenCaseExplain()) {
                                Text("Open AED")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color(.red))
                                    .cornerRadius(20)
                                    .padding()
                            }//NavigationLink
                        }//VStack
                        .frame(width: geo.size.width * 0.45, height: geo.size.height * 0.9)
                    }//HStack
                    .frame(width: geo.size.width * 1, height: geo.size.height * 0.9)
                }//VStack
                .padding()
                .onAppear() {
                    self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: buttonClickSound!))
                    audioPlayer?.play()
                }
            }//GeometryReader
        }// NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
    }
}

struct OpenCase_Previews: PreviewProvider {
    static var previews: some View {
        OpenCase()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
