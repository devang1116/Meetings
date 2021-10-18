//
//  HistoryView.swift
//  Productivity
//
//  Created by Devang Papinwar on 18/10/21.
//

import SwiftUI

struct HistoryView: View
{
    let history : History
    var body: some View
    {
        ScrollView
        {
            VStack
            {
                Divider()
                    .padding()
                Text("Attendees")
                    .font(.headline)
                Text(history.attendees.joined(separator: " , "))
                    .padding()
                Spacer()
                Divider()
                
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding()
                    Text(transcript)
                }
            }
            .padding()
        }
        .navigationTitle(Text(history.date, style: .date))
                .padding()
    }
}

struct HistoryView_Previews: PreviewProvider
{
    
    static var previews: some View
    {
        HistoryView(history: History(attendees: ["Jon", "Darla", "Luis"], lengthInMinutes: 10, transcript: "Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI..."))
    }
}
