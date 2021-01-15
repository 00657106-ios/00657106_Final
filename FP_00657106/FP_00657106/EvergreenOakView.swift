//
//  EvergreenOakView.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/7.
//

import SwiftUI

struct EvergreenOakView: View  {
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack{
            
            Text("Evergreen oak").font(.system(size: 30)).foregroundColor(Color.green)
            Button("Quercus rotundifolia") {
                rotateDegree = 360
            }
            .font(.title)
            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/1a03948baf0300da25558c2448f086d39b41ca30.jpg")!)
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

struct EvergreenOakView_Previews: PreviewProvider {
    static var previews: some View {
        EvergreenOakView()
    }
}
