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
    
    var CardButtons: some View {
        
        HStack{
            RemoveCard
            Spacer()
            AddCard
        }
        .font(.title)
        .padding()
        
    }
    
    func CardCreator (by offset: Int, symbol: String) -> some View{
        Button(action:{
            cardCount += offset
        }, label:{
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > backEmojis.count )
    }
    
    var AddCard: some View {
        CardCreator(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var RemoveCard: some View {
        CardCreator(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    
    
}

struct CardView: View {
    let cardEmoji : String
    @State var faceDown : Bool = true
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack{
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(cardEmoji).font(.largeTitle)
            }
            .opacity(faceDown ? 0 : 1)
            base.fill().opacity(faceDown ? 1: 0)
        }
        .onTapGesture {
            faceDown = !faceDown
        }
        
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
