//
//  StingingNettle.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/8.
//
import SwiftUI

struct StingingNettleView: View  {
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack{
            
            Text("Stinging nettle").font(.system(size: 30)).foregroundColor(Color.green)
            Button("Urtica dioica") {
                rotateDegree = 360
            }
            .font(.title)
            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/85256a1c2c098e254fefe05040626a4df49ce248.jpg")!)
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

struct StingingNettleView_Previews: PreviewProvider {
    static var previews: some View {
        StingingNettleView()
    }
}
