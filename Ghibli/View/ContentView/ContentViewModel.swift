//
//  ContentViewModel.swift
//  Ghibli
//
//  Created by Ahmad Ubaidillah on 06/07/21.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var dummyFilm = Film(id: nil, title: "Title dummy", original_title: nil, original_title_romanised: nil, description: "Description : The orphan Sheeta inherited a mysterious crystal that links her to the mythical sky-kingdom of Laputa. With the help of resourceful Pazu and a rollicking band of sky pirates, she makes her way to the ruins of the once-great civilization. Sheeta and Pazu must outwit the evil Muska, who plans to use Laputa's science to make himself ruler of the world", director: "Hayao Miyazaki", producer: nil, release_date: "1986", running_time: nil, rt_score: nil, people: nil, species: nil, locations: nil, vehicles: nil, url: nil)

    @Published var filmDatas = [Film]()
    {
        didSet{
            for data in filmDatas {
                yearsDict[data.release_date] = true
            }
            
            print(yearsDict)
        }
    }
    
    @Published var filmDatasFiltered = [Film]()
    
    @Published var yearsDict = Dictionary<String, Bool>()
    {
        didSet{
            filmDatasFiltered = filmDatas.filter { film in
                return yearsDict[film.release_date] ?? false
            }
            
            print(filmDatasFiltered.count)
        }
    }
    
    init() {
        callAPI()
    }
    
    func callAPI() {
        guard let url = URL(string: "https://ghibliapi.herokuapp.com/films") else { return}
        
        print(url)
        
        URLSession.shared.dataTask(with: url){
            data, response, err in
            
            
            
            if(err == nil){
                do{
                    let responseData = try JSONDecoder().decode([Film].self, from: data!)
                    
                    DispatchQueue.main.async {
                        self.filmDatas = responseData
                    }
                    
                }catch{
                    print(error)
                }
            }
        }.resume()
    }
    
}
