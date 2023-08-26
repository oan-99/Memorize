//
//  ContentView.swift
//  Memorize
//
//

import SwiftUI

struct ContentView: View {
    let backEmojis : Array<String> =
    ["🐤","🐜","🪲","🫎","🐡","🐞","🪱","🦎","🦟","🦆","🦩","🦄","🦋","🐺"]
    @State var cardCount = 4
    
    var body: some View {
        VStack{
            ScrollView{
                Cards
            }
            Spacer()
            CardButtons
        }
        
        .padding()
            
    }
    
    
    var Cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(cardEmoji: backEmojis[index], faceDown: false)
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    struct CardView: View {
        let cardEmoji : String
        @State var faceDown : Bool = true
        var body: some View {
            let base = RoundedRectangle(cornerRadius: 5)
            ZStack{
                Group {
                    base.fill(.white)
                    base.stroke(.orange)
                    Text(cardEmoji)
                }
                .opacity(faceDown ? 0 : 1)
                base.fill().opacity(faceDown ? 1: 0)
            }
            .onTapGesture {
                faceDown = !faceDown
            }
            
        }
    }
    
    
    var CardButtons: some View {
        
        HStack{
            Button(action: {
                if cardCount < backEmojis.count {
                    cardCount += 1
                }
            }, label: {
                Image(systemName: "rectangle.stack.badge.plus.fill")
                    .font(.title)
            })
            Spacer()
            Button(action: {
                if cardCount > 1 {
                    cardCount -= 1
                }
            }, label: {
                Image(systemName: "rectangle.stack.badge.minus.fill")
                    .font(.title)
            })
        }
        .padding()
        
    }
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
