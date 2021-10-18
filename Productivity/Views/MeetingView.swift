//
//  MeetingView.swift
//  Productivity
//
//  Created by Devang Papinwar on 17/10/21.
//

import SwiftUI



struct MeetingView: View
{
    private let speech = SpeechRecognizer()
    @Binding var scrum: DailyScrum
    @State private var transcript = ""
    @State private var isRecording = false
    @StateObject var scrumTimer = ScrumTimer()
    var body: some View
    {
        ZStack
        {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.color)
            VStack {
                MeetingHeaderView(secondsPassed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining)
                MeetingTimerView(isRecording : isRecording ,speakers: scrumTimer.speakers, scrumColor: scrum.color)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            scrumTimer.speakerChangedAction = {
                
            }
            speech.record(to: $transcript)
            isRecording = true
            scrumTimer.startScrum()
        }
        .onDisappear {
            speech.stopRecording()
            isRecording = false
            scrumTimer.stopScrum()
            let newHistory = History(attendees: scrum.attendees, lengthInMinutes: scrumTimer.secondsElapsed / 60 , transcript: transcript)
            scrum.history.insert(newHistory, at: 0)
        }
    }
}


struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.data[0]))
    }
}
