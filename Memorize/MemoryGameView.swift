//
//  MemoryGameView.swift
//  Memorize
//
//  Created by John Eigenbrode on 8/26/24.
//

import SwiftUI

struct MemoryGameView: View {
    let emojis = ["👻", "☠️", "🤡", "😈", "👺", "💩", "🤠", "👀", "👁️", "⛑️", "🦊", "🐸"]
    var body: some View {
        HStack{
            ForEach(emojis.indices, id:\.self) { index in
                CardView(content: emojis[index])
                
            }
            
        }
        .foregroundStyle(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false      //@State generate pointer to var
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius:12)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth:2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()  // gets back color from above .fill() is default
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    MemoryGameView()
}
