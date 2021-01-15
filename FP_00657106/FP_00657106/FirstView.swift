//
//  FirstView.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/8.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        ZStack(alignment: .center) {
            NavigationView {
                NavigationLink(destination: ContentView()){
                    Text("植物圖鑑APP     點此進入首頁").font(.system(size: 50)).foregroundColor(Color.green).background(Image("back").clipShape(Circle())
                                                                                                                                    .padding(40)
                                                                                                                                    .offset(x: -20, y: 0)
                                                                                                                                    )
                }
                
                
            }
            
        }
            
        
    }
    
}


struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
