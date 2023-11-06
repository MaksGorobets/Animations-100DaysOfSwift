
//
//  GameView.swift
//  Animations
//
//  Created by Maks Winters on 06.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var characterImage = "m"
    @State private var cloudsPos = 10.0
    @State private var coinsDegrees = 0.0
    @State private var mJumpOffset = 70.0
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack {
                HStack {
                    Image("clouds")
                        .offset(CGSize(width: cloudsPos, height: 10.0))
                        .animation(.linear(duration: 10)
                            .repeatForever(),
                                   value: cloudsPos)
                }
                Spacer()
                Image("coin")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .rotation3DEffect(Angle(degrees: coinsDegrees), axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .onTapGesture {
                        withAnimation{
                            coinsDegrees += 360
                        }
                    }
                Spacer()
                Image(characterImage)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .offset(CGSize(width: 10.0, height: mJumpOffset))
                    .onTapGesture {
                        characterImage = characterImage == "m" ? "mJump" : "m"
                        withAnimation(.easeOut(duration: 0.2)) {
                            mJumpOffset -= 100
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.easeIn(duration: 0.2)) {
                                mJumpOffset += 100
                            }
                            characterImage = characterImage == "mJump" ? "m" : "mJump"
                        }
                    }
                Image("pipe")
                    .resizable()
                    .frame(width: 180, height: 200)
                    .offset(CGSize(width: 10.0, height: 60.0))
            }
        }
        .onAppear {
            cloudsPos = 120
        }
    }
}

#Preview {
    ContentView()
}
