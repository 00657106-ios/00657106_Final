//
//  test.swift
//  FP_00657106
//
//  Created by User13 on 2021/1/7.
//


import SwiftUI
struct SearchResponse: Codable {
    let data: [StoreItem]
}

struct StoreItem: Codable, Identifiable {
   let id: Int
   let common_name:String
   let scientific_name:String
   let image_url: URL

}
class FetchToDo: ObservableObject {
  @Published var datas = [StoreItem]()
     
    init() {
        let url = URL(string: "https://trefle.io/api/v1/plants?token=8lQEgEoqdUm0p98CJ8H29SEm_90xxUZDFVn-rOlZTrA")!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    let decodedData = try JSONDecoder().decode(SearchResponse.self, from: todoData)
                    DispatchQueue.main.async {
                        self.datas = decodedData.data
                    }
                } else {
                    print("No data")
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}


struct test: View {
    @ObservedObject var fetch = FetchToDo()
    var body: some View {
        NavigationView {
            VStack {
                List(fetch.datas) { data in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: EvergreenOakView(data: StoreItem)) {
                            Text(data.common_name)
                                .font(.system(size: 20))
                                .foregroundColor(Color.black)
                                                
                                            }
                        
                    }
                    
                }
                
            }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
