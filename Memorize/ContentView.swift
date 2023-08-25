//
//  ContentView.swift
//  Memorize
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardView(faceDown: false)
            CardView()
            CardView()
            Spacer()
            CardButtons()
        }
        .padding()
    }
}

struct CardView: View {
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
                Text("🦩")
            }
        }
        .padding()
        
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
