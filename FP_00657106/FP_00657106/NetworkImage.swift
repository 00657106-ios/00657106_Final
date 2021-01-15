//
//  NetworkImage.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/7.
//
import SwiftUI


struct NetworkImage: View  {
    var url: URL
    @State private var image = Image(systemName: "photo")
    @State private var downloadImageOk = false
    
    func downLoad() {
        if let data = try? Data(contentsOf: url),
           let uiImage = UIImage(data: data) {
            image = Image(uiImage: uiImage)
            downloadImageOk = true
        }
    }
    var body: some View {
        image
            .resizable()
            .onAppear {
                if downloadImageOk == false {
                    downLoad()
                }
            }
    }
    
}
