//
//  AttachingPad.swift
//  HowToUseAED
//
//  Created by xnoag on 2023/04/16.
//

import SwiftUI
import AVFoundation
import AVKit

struct AttachingPad: View {
    
    @State private var cardLocation1 = CGPoint(x: 185, y: 100)
    @State private var cardLocation2 = CGPoint(x: 0, y: 100)
    @State private var rightLocation = [false, false]
    @State private var littleRightLocation = [false, false]
    @State private var showExplain = false
    let buttonClickSound = Bundle.main.path(forResource: "ButtonClickSound", ofType: "mp3")
    let buttonClickSound1 = Bundle.main.path(forResource: "AttachPad", ofType: "mp3")
    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View {
      
        
        if rightLocation[0] == true && rightLocation[1] == true {
            ZStack {
                PadMomenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            showExplain = true
                        }
                    }

                if showExplain == true {
                    AttachingPadExplain()
                }
            }
            
        } else {
            NavigationView {
                GeometryReader { geo in
                    VStack {
                        VStack {
                            Spacer()
//                                Text("Place the electrode pads on the person's chest following the AED's instructions for pad placement.")
//                                    .font(.title)
//                                    .fontWeight(.bold)
                                if cardLocation1.x < 0 && cardLocation2.x < 0 {
                                    NavigationLink(destination: AttachingPadExplain()) {
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
                                    Text("Place the electrode pads on the person's chest following the AED's instructions for pad placement.")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                }
                            
                            ProgressView(value: 2, total: 7)
                                .scaleEffect(y: 2)
                                .progressViewStyle(.customProgressView)
                                .padding()
                        }
                            .frame(width: geo.size.width * 1, height: geo.size.height * 0.05)
                        Spacer()
                            .frame(width: geo.size.width * 1, height: geo.size.height * 0.05)
                        HStack {
                            Image("BeforePadPatient")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.9)
                            
                            Image("RemoveAED")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.9)
                                .overlay(
                                    HStack {
                                        Image("LPad")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 130)
                                            .position(cardLocation1)
                                            .gesture(
                                                DragGesture()
                                                    .onChanged({ value in
                                                        cardLocation1 = value.location
                                                        if ((cardLocation1.x > -477 && cardLocation1.x < -437) && (cardLocation1.y > 412 && cardLocation1.y < 452)){
                                                            rightLocation[0] = true
                                                            print(cardLocation1.x, cardLocation1.y)
                                                        }
                                                        else{
                                                            rightLocation[0] = false
                                                        }
                                                        if ((cardLocation1.x > -1000) && (cardLocation1.x < 0)) {
                                                            littleRightLocation[0] = true
                                                        } else {
                                                            littleRightLocation[0] = false
                                                        }
                                                    })
                                            )
                                        
                                        Image("RPad")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 130)
                                            .position(cardLocation2)
                                            .gesture(
                                                DragGesture()
                                                    .onChanged({ value in
                                                        cardLocation2 = value.location
                                                        if ((cardLocation2.x > -623 && cardLocation2.x < -583) && (cardLocation2.y > 620 && cardLocation2.y < 660)){
                                                            rightLocation[1] = true
                                                            print(cardLocation2.x, cardLocation2.y) }
                                                        else{
                                                            rightLocation[1] = false
                                                        }
                                                        if ((cardLocation2.x > -1000) && (cardLocation2.x < 0)) {
                                                            littleRightLocation[1] = true
                                                        } else {
                                                            littleRightLocation[1] = false
                                                        }
                                                    })
                                            )
                                    })
                            
                            
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

struct AttachingPad_Previews: PreviewProvider {
    static var previews: some View {
        AttachingPad()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
