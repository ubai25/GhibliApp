//
//  YearButtonActive.swift
//  Ghibli
//
//  Created by Ahmad Ubaidillah on 07/07/21.
//

import SwiftUI

struct YearButtonActive: View {
    
    let year: String
    
    var body: some View {
        Text(year)
            .padding(.horizontal, 18)
            .padding(.vertical, 8)
            .foregroundColor(.black)
            .background(Color(.white))
            .cornerRadius(10)
            .shadow(color: Color(.black).opacity(0.2), radius: 5, x: 2, y: 2)
            .padding(.vertical, 5)
    }
}

struct YearButtonActive_Previews: PreviewProvider {
    static var previews: some View {
        YearButtonActive(year: "1995")
    }
}
