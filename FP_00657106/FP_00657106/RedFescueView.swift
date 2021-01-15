//
//  RedFescueView.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/8.
//

import SwiftUI

struct RedFescueView: View {
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack{
            Text("Red fescue").font(.system(size: 30)).foregroundColor(Color.green)
            Button("Festuca rubra") {
                rotateDegree = 360
            }
            .font(.title)
            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/0b932c8a275efc79f473a71bec20d6f15e9b6b90.jpg")!)
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

struct RedFescueView_Previews: PreviewProvider {
    static var previews: some View {
        RedFescueView()
    }
}
