//
//  ContentView.swift
//  FP_00657106
//
//  Created by User13 on 2020/12/30.
//

import SwiftUI
struct SearchResponse: Codable {
    let data: [StoreItem]
}

struct ImagePickerController: UIViewControllerRepresentable {
    
    @Binding var showSelectPhoto: Bool
    @Binding var selectImage: Image
    typealias UIViewControllerType = UIImagePickerController
    
    func makeCoordinator() -> Coordinator {
        Coordinator(imagePickerController: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
     
    class Coordinator: NSObject, UIImagePickerControllerDelegate,
                       UINavigationControllerDelegate {
        internal init(imagePickerController:
                        ImagePickerController) {
            self.imagePickerController = imagePickerController
        }
        
        let imagePickerController: ImagePickerController
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info:
                                    [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                imagePickerController.selectImage = Image(uiImage:
                                                            uiImage)
            }
            imagePickerController.showSelectPhoto = false
            
        }
        
    }
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


struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    @State private var selectImage = Image(systemName: "photo")
    @State private var showSelectPhoto = false
    @StateObject var fetch = FetchToDo()
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    var body: some View {
                TabView {
                    NavigationView {
                        VStack {
                            List{
                                Group{
                                    NavigationLink(destination: EvergreenOakView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/1a03948baf0300da25558c2448f086d39b41ca30.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("Evergreen oak").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                    NavigationLink(destination: StingingNettleView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/85256a1c2c098e254fefe05040626a4df49ce248.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("Stinging nettle").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                    NavigationLink(destination: OrchardgrassView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/428f40dadfa0281dc890ead17fcd07882f9efb09.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("Orchardgrass").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                    NavigationLink(destination: NarrowleafPlantainView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/78a8374f009e6ed2dc71ca17d18e4271ea0a2a7b.jpg")!)
                                                .frame(width: 50, height: 50, alignment: .center)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("Narrowleaf plantain").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                    NavigationLink(destination: EnglishOakView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/2292b670683abdaac354389514105df0018d9ef8.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("English oak").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                    NavigationLink(destination: RedFescueView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/0b932c8a275efc79f473a71bec20d6f15e9b6b90.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("Red fescue").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                    NavigationLink(destination: CreepingButtercupView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/c6d9a5222b6ef0e3a7bdef3350278718d3097bce.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("Creeping buttercup").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                    NavigationLink(destination: CommonVelvetgrassView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/46619775d4319328b2fad6f1ba876ccca2d03534.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("Common velvetgrass").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                    NavigationLink(destination: WhiteCloverView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/c766ed84c547abac6021244bc0014d665ba7726f.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("White clover").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                }
                                Group{
                                    NavigationLink(destination: EuropeanAshView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/56cbb2c6905b39891def2c7aa09a94d63a0e572a.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("European ash").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                    NavigationLink(destination: OneseedHawthornView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/26b1520c799177ee1b7c4a27f9f46c4ace617dd2.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("Oneseed hawthorn").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                    NavigationLink(destination: RedCloverView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/7eb243363838c9975c57204057e63fa8101c26d8.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("Red clover").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                    NavigationLink(destination: TallButtercupView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/8390d605e1947cb44e24af9492f96df4a34e8ca8.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("Tall buttercup").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                    NavigationLink(destination: CommonFilbertView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/0d92cadb0d66dce1b0a8b26913125d6501e31d68.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("Common filbert").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                    NavigationLink(destination: EuropeanBeechView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/a733221df31a1ff99af03566841744f3b4c6cffe.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("European beech").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                    NavigationLink(destination: CommonRushView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/93041212342d6e8f9f544fd55000c037485a360e.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("Common rush").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                    NavigationLink(destination: GardenSorrelView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/780b9f3c63318588b8874d608c2d4900fc2adce3.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("Garden sorrel").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                }
                                Group{
                                    NavigationLink(destination: SweetVernalgrassView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/fcf64ef0676db8ca9d2abf4017f5b8211b10e0b1.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("Sweet vernalgrass").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                    NavigationLink(destination: QueenOfTheMeadowView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/f5f2a3d241dcd22e237cdebdbf770477721516f0.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("Queen of the meadow").font(.system(size: 25)).foregroundColor(Color.black)
                                        }
                                    }
                                    NavigationLink(destination: SycamoreMapleView()) {
                                        HStack{
                                            NetworkImage(url: URL(string: "https://bs.floristic.org/image/o/d2747c12a135a00ff8e6d8af86acbec3c6f8248d.jpg")!)
                                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .clipShape(Circle())
                                                .scaledToFit()
                                                .clipped()
                                            
                                            Text("Sycamore maple").font(.system(size: 25)).foregroundColor(Color.black)
                                            
                                        }
                                    }
                                }
                            }.navigationTitle("植物種類").foregroundColor(Color.green)
                            
                            
                        }
                        
                    }.tabItem {Image(systemName: "house.fill"); Text("Plant Menu")}
                    VStack {
                        List(fetch.datas) { data in
                            HStack {
                                Text(data.common_name)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color.black)
                            }
                            
                        }
                        
                    }.tabItem {Image(systemName: "heart.fill"); Text("Plant List") }
                    VStack {
                    Text("可以玩的高麗菜&酷酷的花").font(.system(size:30)).foregroundColor(Color.green)
                        Image("plant")
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.green)
                                    .scaleEffect(animationAmount)
                                    .opacity(Double(2 - animationAmount))
                                    .animation(
                                        Animation.easeOut(duration: 2)
                                            .repeatForever(autoreverses: false)
                                    )
                            )
                            .onAppear {
                                self.animationAmount = 2
                            }
                        Image("vegetable")
                            .clipShape(Circle())
                            .scaledToFit()
                            .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
                            .animation(.easeInOut)
                            .foregroundColor(.green)
                            .gesture(
                                DragGesture()
                                    .updating($dragOffset, body: { (value, state, transaction) in
                                        
                                        state = value.translation
                                    })
                                    .onEnded({ (value) in
                                        self.position.height += value.translation.height
                                        self.position.width += value.translation.width
                                    })
                            )
                        
                    }.tabItem {Image(systemName: "star.fill"); Text("Play Plant") }
                    VStack {
                        Button(action: {
                            showSelectPhoto = true
                        }) {
                            selectImage
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .clipped()
                            
                        }
                        .sheet(isPresented: $showSelectPhoto) {
                            ImagePickerController(showSelectPhoto: self.$showSelectPhoto, selectImage: $selectImage)
                        }
                        
                    }.tabItem {Image(systemName: "photo.fill"); Text("Love Plant") }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
