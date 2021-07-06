//
//  ContentViewModel.swift
//  Ghibli
//
//  Created by Ahmad Ubaidillah on 06/07/21.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var film = Film(id: nil, title: "Castle in the Sky", original_title: nil, original_title_romanised: nil, description: "Description : The orphan Sheeta inherited a mysterious crystal that links her to the mythical sky-kingdom of Laputa. With the help of resourceful Pazu and a rollicking band of sky pirates, she makes her way to the ruins of the once-great civilization. Sheeta and Pazu must outwit the evil Muska, who plans to use Laputa's science to make himself ruler of the world", director: "Hayao Miyazaki", producer: nil, release_date: "1986", running_time: nil, rt_score: nil, people: nil, species: nil, locations: nil, vehicles: nil, url: nil)
    
    @Published var years: [String] = ["1986", "1988", "1988", "1989", "1991", "1992", "1994", "1995", "1997", "1999", "2001"]
    
    @Published var yearsSet = Set<String>()
    
    init() {
        yearsSet = fillTheSets(arr: years)
    }
    
    func fillTheSets(arr: [String]) -> Set<String> {
        
        var tempSets = Set<String>()
        
        for year in arr {
            tempSets.insert(year)
        }
        
        print(tempSets)
        
        return tempSets
    }
    
    
}
