//
//  FilmItem.swift
//  Ghibli
//
//  Created by Ahmad Ubaidillah on 06/07/21.
//

import SwiftUI

struct FilmItemCell: View {
    
    let filmData: Film
    
    var body: some View {
        VStack{
            Image("ghibli")
            Text(filmData.title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(5)
                 Text(filmData.description)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 5)
            Text("Release year : \(filmData.release_date)")
            Text("director : \(filmData.director)")
        }
    }
    
}

struct FilmItem_Previews: PreviewProvider {
    static var previews: some View {
        FilmItemCell(filmData: Film(id: nil, title: "Castle in the Sky", original_title: nil, original_title_romanised: nil, description: "Description : The orphan Sheeta inherited a mysterious crystal that links her to the mythical sky-kingdom of Laputa. With the help of resourceful Pazu and a rollicking band of sky pirates, she makes her way to the ruins of the once-great civilization. Sheeta and Pazu must outwit the evil Muska, who plans to use Laputa's science to make himself ruler of the world", director: "Hayao Miyazaki", producer: nil, release_date: "1986", running_time: nil, rt_score: nil, people: nil, species: nil, locations: nil, vehicles: nil, url: nil))
//            .previewLayout(.sizeThatFits)
//            .padding()
    }
}
