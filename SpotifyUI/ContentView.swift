//
//  ContentView.swift
//  SpotifyUI
//
//  Created by Jason Pereira on 9/18/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlaying = false
    @State private var isShuffled = true
    @State private var isLooping = true
    @State private var isFavorited = false
    @State private var progress: Double = 67
    
    let songDuration: Double = 235
    
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {}) {Image(systemName: "chevron.down")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)}
                Spacer()
                Text("Take Care (Deluxe)")
                    .font(.caption)
                    .bold()
                Spacer()
                
                Menu {
                    Button(action: {}) {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    Button(action: {}) {
                        Label("Add to Playlist", systemImage: "music.note.list")
                    }
                    Button(action: {}) {
                        Label("Add to Album", systemImage: "square.stack.fill")
                    }
                    Button(action: {}) {
                        Label("Sleep Timer", systemImage: "powersleep")
                    }
                }
                label: {
                    Image(systemName: "ellipsis")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
            }
            .padding(20)
            Spacer()
            Spacer()
            
            Image("takeCare")
                .resizable()
                .scaledToFill()
                .frame(width: 346, height: 346)
                .cornerRadius(4)
                .shadow(color: .black.opacity(0.4), radius: 10, x: 5, y: 5)
                
            Spacer()
            Spacer()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Headlines")
                        .font(.title2)
                        .bold()
                    Text("Drake")
                        .font(.subheadline)
                }
                Spacer()
                Button (action: {isFavorited.toggle()})
                {
                    Image(systemName: isFavorited ? "heart" : "heart.fill")
                }
            
            }
            .padding(20)
            
            VStack {
                Slider(value: $progress, in: 0...songDuration)
                    .accentColor(.white)
                    .padding()
                    .scaleEffect(x: 0.5, y: 0.5)
                    .frame(width: 748)
                    .padding(.vertical, -26)
                
                HStack {
                    Text(getTime(seconds: progress))
                        .font(.caption)
                    Spacer()
                    Text("-"+getTime(seconds: songDuration-progress))
                        .font(.caption)
                }
                .padding(.horizontal, 22)

            }
            .padding(.bottom, 4)
            
            HStack {
                Button(action: {
                    isShuffled.toggle()
                })
                {
                    Image(systemName: "shuffle")
                        .foregroundStyle(isShuffled ? .green : .white)
                }
                
                Spacer()
                
                Button(action: {

                })
                {
                    Image(systemName: "backward.end.fill")
                }
                
                Spacer()
                
                Button(action: {
                    isPlaying.toggle()
                })
                {
                    Image(systemName: isPlaying ? "play.circle.fill" : "pause.circle.fill")
                        .font(.system(size: 70))
                        .animation(nil, value: isPlaying)
                }
                
                Spacer()
                
                Button(action: {

                })
                {
                    Image(systemName: "forward.end.fill")
                }
                
                Spacer()
                Button(action: {
                    isLooping.toggle()
                })
                {
                    Image(systemName: "repeat")
                        .foregroundStyle(isLooping ? .green : .white)
                }
            }
            .font(.system(size: 36))
            .padding(.horizontal, 22)
            
            Spacer()
            
            HStack(spacing: 40) {
                Button(action: {})
                {
                    Image(systemName: "laptopcomputer")
                }
                Spacer()
                Button(action: {}) {Image(systemName: "square.and.arrow.up")}
                Button(action: {}) {Image(systemName: "rectangle.stack")}
            }
            .padding(20)
            Spacer()
        }
        .foregroundStyle(.white)
        .background(Color(red: 108/255, green: 69/255, blue: 45/255).gradient)
    }
    
    func getTime(seconds: Double) -> String {
        let minutes = Int(seconds / 60)
        let seconds = Int(seconds) - minutes*60
        
        return String(format: "%d:%02d", minutes, seconds)
    }
}

#Preview {
    ContentView()
}
