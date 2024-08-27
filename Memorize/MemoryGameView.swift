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
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundStyle(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack(content:{
            if isFaceUp{
                RoundedRectangle(cornerRadius:12).fill(Color.white)
                RoundedRectangle(cornerRadius:12).strokeBorder(lineWidth:2)
                Text("👻").font(.largeTitle)
            } else {
                  // gets back color from above
            }
            
        })
    }
}

#Preview {
    MemoryGameView()
}
