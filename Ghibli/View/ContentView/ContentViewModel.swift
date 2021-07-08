//
//  ContentViewModel.swift
//  Ghibli
//
//  Created by Ahmad Ubaidillah on 06/07/21.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    private let url = "https://ghibliapi.herokuapp.com/films"

    @Published var filmDatas = [Film]()
    {
        didSet{
            for data in filmDatas {
                yearsDict[data.release_date] = true
            }
        }
    }
    
    @Published var filmDatasFiltered = [Film]()
    
    @Published var yearsDict = Dictionary<String, Bool>()
    {
        didSet{
            filmDatasFiltered = filmDatas.filter { film in
                return yearsDict[film.release_date] ?? false
            }
        }
    }
    
    init() {
        callAPI(url: url)
    }
    
    func callAPI(url: String) {
        guard let url = URL(string: url) else { return}

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
