//
//  CommonRushView.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/8.
//

import SwiftUI

struct CommonRushView: View {
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack{
            Text("Common rush").font(.system(size: 30)).foregroundColor(Color.green)
            Button("Juncus effusus") {
                rotateDegree = 360
            }
            .font(.title)
            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/93041212342d6e8f9f544fd55000c037485a360e.jpg")!)
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

struct CommonRushView_Previews: PreviewProvider {
    static var previews: some View {
        CommonRushView()
    }
}
