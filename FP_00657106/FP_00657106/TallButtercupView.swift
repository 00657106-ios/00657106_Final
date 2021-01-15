//
//  TallButtercupView.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/8.
//

import SwiftUI

struct TallButtercupView: View {
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack{
            Text("Tall buttercup").font(.system(size: 30)).foregroundColor(Color.green)
            Button("Ranunculus acris") {
                rotateDegree = 360
            }
            .font(.title)
            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/8390d605e1947cb44e24af9492f96df4a34e8ca8.jpg")!)
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

struct TallButtercupView_Previews: PreviewProvider {
    static var previews: some View {
        TallButtercupView()
    }
}
