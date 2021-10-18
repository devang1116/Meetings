//
//  ScrumsView.swift
//  Productivity
//
//  Created by Devang Papinwar on 17/10/21.
//

import SwiftUI

struct ScrumsView: View
{
    @Binding var scrums : [DailyScrum]
    @State private var isPresented = false
    @State private var newSrcumData = DailyScrum.Data()
    var body: some View
    {
        List
        {
            ForEach(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: binding(for: scrum)))
                {
                    CardView(scrum: scrum)
                    .background(scrum.color)
                    .listRowBackground(scrum.color)
                }
                .listRowBackground(scrum.color)
            }
        }
        .navigationTitle("Daily Scrums")
        .padding()
        .navigationBarItems(trailing: Button(action: {isPresented = true}) {
                    Image(systemName: "plus")
            
                })
        .sheet(isPresented: $isPresented)
        {
            NavigationView
            {

                EditView(scrumData: $newSrcumData)
                    .navigationBarItems(leading: Button("Dismiss") {
                        isPresented = false
                    }, trailing: Button("Add"){
                        let newScrum = DailyScrum(title: newSrcumData.title, attendees: newSrcumData.attendees, lengthInMinutes: Int(newSrcumData.lengthInMinutes), color: newSrcumData.color)
                        scrums.append(newScrum)
                        isPresented = false
                    })
            }
        }
    }
    
    private func binding(for scrum: DailyScrum) -> Binding<DailyScrum> {
            guard let scrumIndex = scrums.firstIndex(where: { $0.id == scrum.id }) else {
                fatalError("Can't find scrum in array")
            }
            return $scrums[scrumIndex]
        }
}

struct ScrumsView_Previews: PreviewProvider
{
    static var previews: some View
    {
        NavigationView
        {
            ScrumsView(scrums: .constant(DailyScrum.data))
        }
    }
}
