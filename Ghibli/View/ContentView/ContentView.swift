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
                                    if viewModel.yearsDict[year]! {
                                        YearButtonActive(year: year)
                                    }else{
                                        YearButtonInactive(year: year)
                                    }
                                    
                                })
//                                .padding(.vertical, 5)
                            }
                            .frame(width: UIScreen.screenWidth/3)
                        }
                    }
                    .background(Color(.white))
                    .ignoresSafeArea(edges: .bottom)
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
