//
//  ContentView.swift
//  Memorize
//
//

import SwiftUI

struct ContentView: View {
    let backEmojis : Array<String> =
    ["🐤","🐜","🪲","🫎","🐡","🐞","🪱","🦎","🦟","🦆","🦩","🦄","🦋","🐺"]
    
    var body: some View {
        VStack{
            Cards
            Spacer()
            CardButtons()
        }
        .padding()
            
    }
    
    var Cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<backEmojis.count, id: \.self){ index in
                CardView(cardEmoji: backEmojis[index], faceDown: false)
            }
        }
    }
    
    struct CardView: View {
        let cardEmoji : String
        @State var faceDown : Bool = true
        var body: some View {
            let base = RoundedRectangle(cornerRadius: 5)
            ZStack{
                if(faceDown){
                    base.fill(.orange)
                }
                else {
                    base.fill(.white)
                    base.stroke(.orange)
                    Text(cardEmoji)
                }
            }
            
        }
    }
    
}


struct CardButtons: View {
    var body: some View {
        Button("Add/Remove Button") {
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
