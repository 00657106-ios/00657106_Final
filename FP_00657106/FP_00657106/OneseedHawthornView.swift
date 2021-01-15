//
//  OneseedHawthornView.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/8.
//

import SwiftUI

struct OneseedHawthornView: View {
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack{
            Text("Oneseed hawthorn").font(.system(size: 30)).foregroundColor(Color.green)
            Button("Crataegus monogyna") {
                rotateDegree = 360
            }
            .font(.title)
            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/26b1520c799177ee1b7c4a27f9f46c4ace617dd2.jpg")!)
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

struct OneseedHawthornView_Previews: PreviewProvider {
    static var previews: some View {
        OneseedHawthornView()
    }
}
