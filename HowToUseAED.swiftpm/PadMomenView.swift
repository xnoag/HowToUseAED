//
//  SwiftUIView.swift
//  
//
//  Created by xnoag on 2023/04/17.
//

import SwiftUI
import AVFoundation
import AVKit


struct PadMomenView: View {
    let buttonClickSound = Bundle.main.path(forResource: "ButtonClickSound", ofType: "mp3")
    @State var audioPlayer: AVAudioPlayer!
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {
                    VStack {
                        Spacer()
                        Text("Place the electrode pads on the person's chest following the AED's instructions for pad placement.")
                            .font(.title)
                            .fontWeight(.bold)
                        ProgressView(value: 2, total: 9)
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
                        
                        Image("RemoveAED")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.9)
                        
                        
                        
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

struct PadMomenView_Previews: PreviewProvider {
    static var previews: some View {
        PadMomenView()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
