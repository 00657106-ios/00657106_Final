//
//  NarrowleafPlantainView.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/8.
//

import SwiftUI

struct NarrowleafPlantainView: View {
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack{
            Text("Narrowleaf plantain").font(.system(size: 30)).foregroundColor(Color.green)
            Button("Plantago lanceolata") {
                rotateDegree = 360
            }
            .font(.title)
            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/78a8374f009e6ed2dc71ca17d18e4271ea0a2a7b.jpg")!)
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

struct NarrowleafPlantainView_Previews: PreviewProvider {
    static var previews: some View {
        NarrowleafPlantainView()
    }
}
