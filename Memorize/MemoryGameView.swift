//
//  MemoryGameView.swift
//  Memorize
//
//  Created by John Eigenbrode on 8/26/24.
//

import SwiftUI

struct MemoryGameView: View {
    let emojis = ["👻", "☠️", "🤡", "😈", "👺", "💩", "🤠", "👀", "👁️", "⛑️", "🦊", "🐸"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {  // Single line of code has implicit return
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 95))]){
            ForEach(0..<cardCount, id:\.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button {
            cardCount += offset
        }label: {
            Image(systemName: symbol)
        }
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardCountAdjusters: some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }  // implicit return
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    } // implicit return
}


struct CardView: View {
    let content: String
    @State var isFaceUp = true      //@State generate pointer to var
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius:12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth:2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)  // gets back color from above .fill() is default
            
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    MemoryGameView()
}
