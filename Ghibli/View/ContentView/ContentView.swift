//
//  ContentView.swift
//  Ghibli
//
//  Created by Ahmad Ubaidillah on 06/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    @State var isShowFilter : Bool = true
    
    var body: some View {
        
        NavigationView{
            ZStack{
                List((0..<viewModel.filmDatasFiltered.count), id:\.self){ number in
                    FilmItemCell(filmData: viewModel.filmDatasFiltered[number])
                }
                .listStyle(PlainListStyle())
                
                HStack{
                    Spacer()
                    
                    VStack(){
                        
                        ScrollView(showsIndicators: false){
                            ForEach(viewModel.yearsDict.keys.sorted(), id: \.self){ year in
                                Button(action: {
                                    viewModel.yearsDict[year]?.toggle()
                                }, label: {
                                    Text(year)
//                                        .fontWeight(.bold)
                                        .padding(.horizontal, 18)
                                        .padding(.vertical, 8)
                                        .foregroundColor(.black)
                                        .background(Color(.white))
                                        .cornerRadius(10)
                                        .shadow(color: Color(.black).opacity(0.2), radius: 5, x: 2, y: 2)
                                })
                                .padding(.vertical, 5)
                            }
                            .frame(width: UIScreen.screenWidth/3)
                        }
//                        Spacer()
                    }
                    .background(Color(.gray).opacity(0.8))
                    .ignoresSafeArea(edges: .bottom)
//                    .cornerRadius(20)
                }
                .isHidden(isShowFilter)
            }
            .navigationTitle("Ghibli")
            .navigationBarItems(trailing: Button(action:{
                withAnimation {
                    isShowFilter.toggle()
                }
            }){
                HStack{
                    Text("Year")
                    Image(systemName: "slider.horizontal.3")
                }
            })
            .onTapGesture {
                isShowFilter = true
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
