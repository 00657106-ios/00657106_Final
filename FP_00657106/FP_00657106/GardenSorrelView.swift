//
//  GardenSorrelView.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/8.
//

import SwiftUI

struct GardenSorrelView: View {
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack{
            Text("Garden sorrel").font(.system(size: 30)).foregroundColor(Color.green)
            Button("Rumex acetosa") {
                rotateDegree = 360
            }
            .font(.title)
            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/780b9f3c63318588b8874d608c2d4900fc2adce3.jpg")!)
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

struct GardenSorrelView_Previews: PreviewProvider {
    static var previews: some View {
        GardenSorrelView()
    }
}
