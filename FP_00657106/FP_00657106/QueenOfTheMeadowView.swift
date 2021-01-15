//
//  QueenOfTheMeadowView.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/8.
//

import SwiftUI

struct QueenOfTheMeadowView: View {
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack{
            Text("Queen of the meadow").font(.system(size: 30)).foregroundColor(Color.green)
            Button("Filipendula ulmaria") {
                rotateDegree = 360
            }
            .font(.title)
            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/f5f2a3d241dcd22e237cdebdbf770477721516f0.jpg")!)
                .frame(width: 360, height: 360, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
                .scaledToFit()
                .clipped()
                .rotationEffect(.degrees(rotateDegree))
                .animation(
                    Animation.linear(duration: 0.5)
                        .repeatCount(3, autoreverses: false)
                )
        }
    }
}

struct QueenOfTheMeadowView_Previews: PreviewProvider {
    static var previews: some View {
        QueenOfTheMeadowView()
    }
}
