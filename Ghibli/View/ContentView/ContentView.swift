//
//  ContentView.swift
//  Ghibli
//
//  Created by Ahmad Ubaidillah on 06/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach((1...20), id: \.self){ number in
                        FilmItemCell(filmData: viewModel.film)
                            .padding(.bottom)
                    }
                }
                .listStyle(PlainListStyle())
                
                HStack{
                    Spacer()
                    
                    VStack(){
                        
                        ScrollView(showsIndicators: false){
                            ForEach((1...15), id: \.self){ number in
                                Button(action: {
                                    
                                }, label: {
                                    Text("1999")
//                                        .fontWeight(.bold)
                                        .padding(.horizontal, 18)
                                        .padding(.vertical, 8)
                                        .foregroundColor(.black)
                                        .background(Color(.white))
                                        .cornerRadius(10)
                                })
                                .padding(.vertical, 5)
                            }
                        }
                        
                        Spacer()
                    }
//                    .ignoresSafeArea()
                    .frame(width: UIScreen.screenWidth/3)
                    .background(Color(.gray).opacity(0.5))
                    .cornerRadius(20)
                }
//                .hidden()
            }
            .navigationTitle("Ghibli")
            .navigationBarItems(trailing: Button(action:{
                
            }){
                HStack{
                    Text("Year")
                    Image(systemName: "slider.horizontal.3")
                }
            })
        }
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
