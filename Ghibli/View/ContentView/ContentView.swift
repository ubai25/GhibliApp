//
//  ContentView.swift
//  Ghibli
//
//  Created by Ahmad Ubaidillah on 06/07/21.
//

import SwiftUI

struct ContentView: View {
    
    let film = Film(id: nil, title: "Castle in the Sky", original_title: nil, original_title_romanised: nil, description: "Description : The orphan Sheeta inherited a mysterious crystal that links her to the mythical sky-kingdom of Laputa. With the help of resourceful Pazu and a rollicking band of sky pirates, she makes her way to the ruins of the once-great civilization. Sheeta and Pazu must outwit the evil Muska, who plans to use Laputa's science to make himself ruler of the world", director: "Hayao Miyazaki", producer: nil, release_date: "1986", running_time: nil, rt_score: nil, people: nil, species: nil, locations: nil, vehicles: nil, url: nil)
    
    var body: some View {
        NavigationView{
            List{
                ForEach((1...20), id: \.self){ number in
                    
                    FilmItemCell(filmData: film)
                        .padding(.bottom)
                }
            }
            .navigationTitle("Ghibli")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
