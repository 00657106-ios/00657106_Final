//
//  EuropeanBeechView.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/8.
//

import SwiftUI

struct EuropeanBeechView: View {
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack{
            Text("European beech").font(.system(size: 30)).foregroundColor(Color.green)
            Button("Fagus sylvatica") {
                rotateDegree = 360
            }
            .font(.title)
            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/a733221df31a1ff99af03566841744f3b4c6cffe.jpg")!)
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

struct EuropeanBeechView_Previews: PreviewProvider {
    static var previews: some View {
        EuropeanBeechView()
    }
}
