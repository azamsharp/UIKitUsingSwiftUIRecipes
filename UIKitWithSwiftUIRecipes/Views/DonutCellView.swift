//
//  DonutCellView.swift
//  Learn
//
//  Created by Mohammad Azam on 6/23/22.
//

import SwiftUI

struct DonutCellView: View {
    
    let donut: Donut
    
    var body: some View {
        HStack {
            Image(donut.picture)
                .resizable()
                .frame(width: 75, height: 75)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(donut.name)
            Spacer()
            Image(systemName: "chevron.right")
               
        }.padding()
    }
}

struct DonutCellView_Previews: PreviewProvider {
    static var previews: some View {
        DonutCellView(donut: Donut(name: "Chocolate Donut", picture: "1"))
    }
}
