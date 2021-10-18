//
//  CardView.swift
//  Productivity
//
//  Created by Devang Papinwar on 17/10/21.
//

import SwiftUI

struct CardView: View
{
    let scrum : DailyScrum
    
    var body: some View
    {
        VStack
        {
            Text(scrum.title)
                .font(.headline)
            
            Spacer()
            HStack
            {
                Label("\(scrum.attendees.count)" , systemImage: "person.3")
                Spacer()
                Label("\(scrum.lengthInMinutes)" , systemImage: "clock")
            }
            .padding()
        }
        .padding()
        .font(.caption)
    }
}

struct CardView_Previews: PreviewProvider
{
    static var scrum = DailyScrum.data[0]
    static var previews: some View
    {
        CardView(scrum: scrum)
            .background(scrum.color)
    }
}
