//
//  SwiftUIViewController.swift
//  OneLabHW2
//
//  Created by Arnur Sakenov on 02.04.2023.
//

import SwiftUI

struct ActiveCallView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isMuted = false
    @State private var isSpeakerOn = false

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack {
                Text("Caller Name")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                Text("00:00")
                    .foregroundColor(.white)
                    .padding(.bottom, 40)

                VStack {
                    HStack(spacing: 30) {
                        VStack {
                            Image(systemName: "mic.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                            Text("Mute")
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                        }
                        .buttonStyle(BorderlessButtonStyle())

                    

                        VStack {
                            Image(systemName: "keypad")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                            Text("Keypad")
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                        }
                        .buttonStyle(BorderlessButtonStyle())

                      

                        VStack {
                            Image(systemName: "speaker.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                            Text("Speaker")
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 10)

                    HStack(spacing: 20) {
                        VStack {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                            Text("Add Call")
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                        }
                        .buttonStyle(BorderlessButtonStyle())

                        VStack {
                            Image(systemName: "video.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                            Text("FaceTime")
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                        }
                        .buttonStyle(BorderlessButtonStyle())

                        VStack {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                            Text("Contacts")
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    .padding(.horizontal, 40)
                }
                .padding(.bottom, 40)

                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 60, height: 60)
                        Image(systemName: "phone.down.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                    }
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding(.bottom, 40)
            }
        }
    }
}

struct ActiveCallView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveCallView()
    }
}


