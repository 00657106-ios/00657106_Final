//
//  CommonVelvetgrassView.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/8.
//

import SwiftUI

struct CommonVelvetgrassView: View {
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack{
            Text("Common velvetgrass").font(.system(size: 30)).foregroundColor(Color.green)
            Button("Holcus lanatus") {
                rotateDegree = 360
            }
            .font(.title)
            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/46619775d4319328b2fad6f1ba876ccca2d03534.jpg")!)
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

struct CommonVelvetgrassView_Previews: PreviewProvider {
    static var previews: some View {
        CommonVelvetgrassView()
    }
}
