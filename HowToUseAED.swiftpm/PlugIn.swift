//
//  PlugIn.swift
//  HowToUseAED
//
//  Created by xnoag on 2023/04/16.
//

import SwiftUI
import AVFoundation
import AVKit

struct PlugIn: View {
    @State private var cardLocation = CGPoint(x: 450, y: 100)
    @State private var rightLocation = false
    @State private var showExplain = false
    
    let buttonClickSound = Bundle.main.path(forResource: "ButtonClickSound", ofType: "mp3")
    let buttonClickSound1 = Bundle.main.path(forResource: "PlugIn", ofType: "mp3")
    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        
        if rightLocation == true {
            ZStack {
                PlugMomenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            showExplain = true
                        }
                    }
                
                if showExplain {
                    PlugInExplain()
                }
            }
            
        } else {
            NavigationView {
                GeometryReader { geo in
                    VStack {
                        VStack {
                            Spacer()
                            if cardLocation.y > 100 {
                                NavigationLink(destination: PlugInExplain()) {
                                    Text("Finished")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .padding()
                                        .background(Color.red)
                                        .cornerRadius(10)
                                        .padding(.top, 20)
                                }
                            } else {
                                Text("Plug the pads connector into the jack next to the flashing light")
                                    .font(.title)
                                    .fontWeight(.bold)
                            }
                            ProgressView(value: 3, total: 7)
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
                            Image("BeforePlugInAED")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.9)
                                .overlay(
                                    Image("Plug")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                        .position(cardLocation)
                                        .gesture(
                                            DragGesture()
                                                .onChanged({ value in
                                                    cardLocation = value.location
                                                    if ((cardLocation.x > 555 && cardLocation.x < 595) && (cardLocation.y > 408 && cardLocation.y < 448)){
                                                        rightLocation = true
                                                    }
                                                    else{
                                                        rightLocation = false
                                                    }
                                                })
                                        )
                                )
                        }//HStack
                        .frame(width: geo.size.width * 1, height: geo.size.height * 0.9)
                    }//VStack
                    .frame(width: geo.size.width * 1, height: geo.size.height * 1)
                    .padding()
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: buttonClickSound1!))
                            audioPlayer?.play()
                        }
                    }
                }//GeometryReader
            }//NavigationView
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
        }
    }
}
struct PlugIn_Previews: PreviewProvider {
    static var previews: some View {
        PlugIn()
            //.previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
