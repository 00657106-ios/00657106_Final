//
//  EnglishOakView.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/8.
//

import SwiftUI

struct EnglishOakView: View {
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack{
            Text("English oak").font(.system(size: 30)).foregroundColor(Color.green)
            Button("Quercus robur") {
                rotateDegree = 360
            }
            .font(.title)
            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/2292b670683abdaac354389514105df0018d9ef8.jpg")!)
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

struct EnglishOakView_Previews: PreviewProvider {
    static var previews: some View {
        EnglishOakView()
    }
}
