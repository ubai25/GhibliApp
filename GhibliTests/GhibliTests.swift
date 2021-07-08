//
//  GhibliTests.swift
//  GhibliTests
//
//  Created by Ahmad Ubaidillah on 08/07/21.
//

import XCTest
@testable import Ghibli

class GhibliTests: XCTestCase {
    
    let films = [
        Film(id: nil, title: "Title dummy 1", original_title: nil, original_title_romanised: nil, description: "Description 1", director: "Hayao Miyazaki 1", producer: nil, release_date: "1986", running_time: nil, rt_score: nil, people: nil, species: nil, locations: nil, vehicles: nil, url: nil),
        Film(id: nil, title: "Title dummy 2", original_title: nil, original_title_romanised: nil, description: "Description 2", director: "Hayao Miyazaki 2", producer: nil, release_date: "1999", running_time: nil, rt_score: nil, people: nil, species: nil, locations: nil, vehicles: nil, url: nil),
        Film(id: nil, title: "Title dummy 3", original_title: nil, original_title_romanised: nil, description: "Description 3", director: "Hayao Miyazaki 3", producer: nil, release_date: "1999", running_time: nil, rt_score: nil, people: nil, species: nil, locations: nil, vehicles: nil, url: nil)]
    
    var content = ContentViewModel()
    
    func testParseResponseFromAPI() throws {
        if let path = Bundle.main.path(forResource: "GhibliSource", ofType: "json"){
            print(path)
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                content.filmDatas = try JSONDecoder().decode([Film].self, from: data)
            }catch{
                print(error)
            }
        }
        
        XCTAssertEqual(content.filmDatas.count, 3)
        XCTAssertEqual(content.filmDatas[0].title, "Title 1")
        XCTAssertEqual(content.filmDatas[1].description, "Description 2")
        XCTAssertEqual(content.filmDatas[2].director, "Hayao Miyazaki 3")
    }

    func testGroupingYear() throws {
        content.filmDatas = films
        
        //there are should only 2 datas : 1986 and 1999
        XCTAssertEqual(content.yearsDict.count, 2)
    }
    
    func testFilterContent() throws {
        content.filmDatas = films
        
        //non filtered data equals to filmDatas (3 items)
        XCTAssertEqual(content.filmDatasFiltered.count, 3)
        
        //disable 1999 (button 1999 clicked)
        content.yearsDict["1999"] = false
        
        //filtered data only left 1 data with released year 1986
        XCTAssertEqual(content.filmDatasFiltered.count, 1)
        XCTAssertEqual(content.filmDatasFiltered[0].release_date, "1986")
        
        //enable 1999 (button 1999 clicked again)
        content.yearsDict["1999"] = true
        
        //two data with released year 1999 join back to filtered data
        XCTAssertEqual(content.filmDatasFiltered.count, 3)
    }

}
