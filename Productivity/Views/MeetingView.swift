//
//  MeetingView.swift
//  Productivity
//
//  Created by Devang Papinwar on 17/10/21.
//

import SwiftUI

struct MeetingView: View
{
    @Binding var scrum : DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    var body: some View
    {
        ZStack
        {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.color)
            VStack
            {
                MeetingHeaderView(secondsPassed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining)
                Circle()
                    .strokeBorder(lineWidth: 24, antialiased: true)
                    .padding()
                
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .accessibilityLabel(Text("Next speaker"))
        .padding()
        .onAppear(perform: {
            scrumTimer.reset(lengthInMinutes: scrumTimer.lengthInMinutes, attendees: scrum.attendees)
                scrumTimer.startScrum()
        })
        
        .onDisappear(perform: {
            scrumTimer.stopScrum()
            let history = History(attendees: scrum.attendees, lengthInMinutes: Int(scrum.lengthInMinutes) / 60)
            scrum.history.insert(history , at : 0)
        })
        .padding()
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.data[0]))
    }
}
