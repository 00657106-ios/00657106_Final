//
//  WhiteCloverView.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/8.
//

import SwiftUI

struct WhiteCloverView: View {
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack{
            Text("White clover").font(.system(size: 30)).foregroundColor(Color.green)
            Button("Trifolium repens") {
                rotateDegree = 360
            }
            .font(.title)
            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/c766ed84c547abac6021244bc0014d665ba7726f.jpg")!)
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

struct WhiteCloverView_Previews: PreviewProvider {
    static var previews: some View {
        WhiteCloverView()
    }
}
