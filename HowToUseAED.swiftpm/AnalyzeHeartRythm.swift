//
//  AnalyzeHeartRythm.swift
//  HowToUseAED
//
//  Created by xnoag on 2023/04/17.
//

import SwiftUI
import AVFoundation
import AVKit


struct AnalyzeHeartRythm: View {
    @State private var isPresented = false
    let player = AVPlayer(url: Bundle.main.url(forResource: "Analyzing", withExtension: "mp3")!)
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack {
                    VStack {
                        Spacer()
                        Text("When the analysis is in progress, do not touch the patient.")
                            .font(.title2)
                            .fontWeight(.bold) 
                        ProgressView(value: 4, total: 7)
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
                        
                        Image("PleaseWait")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.9)
                        
                        
                        
                    }//HStack
                    .frame(width: geo.size.width * 1, height: geo.size.height * 0.9)
                }//VStack
                .frame(width: geo.size.width * 1, height: geo.size.height * 1)
                .padding()
                .fullScreenCover(isPresented: $isPresented, onDismiss: {}, content: { AnalyzeHeartRythmExplain()
                        .transition(.move(edge: .trailing))
                })
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.player.play()
                        DispatchQueue.main.asyncAfter(deadline: .now() + self.player.currentItem!.asset.duration.seconds + 2.5) {
                            self.isPresented.toggle()
                        }
                    }
                }
                    
            }//GeometryReader
        }//NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
    }
}

struct AnalyzeHeartRythm_Previews: PreviewProvider {
    static var previews: some View {
        AnalyzeHeartRythm()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
