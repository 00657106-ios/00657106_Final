//
//  CommonFilbertView.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/8.
//

import SwiftUI

struct CommonFilbertView: View {
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack{
            Text("Common filbert").font(.system(size: 30)).foregroundColor(Color.green)
            Button("Corylus avellana") {
                rotateDegree = 360
            }
            .font(.title)
            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/0d92cadb0d66dce1b0a8b26913125d6501e31d68.jpg")!)
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

struct CommonFilbertView_Previews: PreviewProvider {
    static var previews: some View {
        CommonFilbertView()
    }
}
