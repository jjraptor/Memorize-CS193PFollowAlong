//
//  MemoryGameView.swift
//  Memorize
//
//  Created by John Eigenbrode on 8/26/24.
//

import SwiftUI

struct MemoryGameView: View {
    var body: some View {
        HStack{
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .foregroundStyle(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false      //@State generate pointer to var
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius:12)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth:2)
                Text("👻").font(.largeTitle)
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
