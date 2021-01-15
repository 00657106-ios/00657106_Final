//
//  EuropeanAshView.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/8.
//

import SwiftUI

struct EuropeanAshView: View {
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack{
            Text("European ash").font(.system(size: 30)).foregroundColor(Color.green)
            Button("Fraxinus excelsior") {
                rotateDegree = 360
            }
            .font(.title)
            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/56cbb2c6905b39891def2c7aa09a94d63a0e572a.jpg")!)
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

struct EuropeanAshView_Previews: PreviewProvider {
    static var previews: some View {
        EuropeanAshView()
    }
}
