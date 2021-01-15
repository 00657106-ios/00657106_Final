//
//  RedCloverView.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/8.
//

import SwiftUI

struct RedCloverView: View {
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack{
            Text("Red clover").font(.system(size: 30)).foregroundColor(Color.green)
            Button("Trifolium pratense") {
                rotateDegree = 360
            }
            .font(.title)
            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/7eb243363838c9975c57204057e63fa8101c26d8.jpg")!)
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

struct RedCloverView_Previews: PreviewProvider {
    static var previews: some View {
        RedCloverView()
    }
}
