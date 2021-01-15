//
//  SycamoreMapleView.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/8.
//

import SwiftUI

struct SycamoreMapleView: View {
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack{
            Text("Sycamore maple").font(.system(size: 30)).foregroundColor(Color.green)
            Button("Acer pseudoplatanus") {
                rotateDegree = 360
            }
            .font(.title)
            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/d2747c12a135a00ff8e6d8af86acbec3c6f8248d.jpg")!)
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

struct SycamoreMapleView_Previews: PreviewProvider {
    static var previews: some View {
        SycamoreMapleView()
    }
}
