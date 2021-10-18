//
//  MeetingHeaderView.swift
//  Productivity
//
//  Created by Devang Papinwar on 17/10/21.
//

import SwiftUI

struct MeetingHeaderView: View
{
    let secondsPassed : Int
    let secondsRemaining : Int
    private var progress : Double {
        guard secondsRemaining > 0 else { return 1 }
        let totalSeconds = Double(secondsPassed + secondsRemaining)
        return Double(secondsPassed) / totalSeconds
    }
    
    private var minutesRemaining: Int {
            secondsRemaining / 60
        }
    private var minutesRemainingMetric: String {
        minutesRemaining == 1 ? "minute" : "minutes"
    }
    
    var body: some View
    {
        VStack
        {
            ProgressView(value: 5, total: 15)
                .padding()
            HStack
            {
                VStack(alignment: .leading)
                {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsPassed)" , systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing)
                {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)" , systemImage: "hourglass.tophalf.fill")
                }
            }
            .accessibilityLabel(Text("Time remaining"))
            .accessibilityValue(Text("10 minutes"))
            .padding()
            
        }
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsPassed: 60, secondsRemaining: 180)
    }
}
