//
//  CardView.swift
//  Scrumdinger
//
//  Created by Huanhuan Sun on 1/15/21.
//

import SwiftUI

struct CardView: View {
  let scrum: DailyScrum
  var body: some View {
    VStack(alignment: .leading) {
      Text(scrum.title)
        .font(.headline)
      Spacer()
      HStack {
        Label("\(scrum.attendees.count)", systemImage: "person.3")
          .accessibilityElement(children: .ignore)
        
        Spacer()
        Label("\(scrum.lengthInMinutes)", systemImage: "clock")
          .padding(.trailing, 20)
          .accessibilityElement(children: .ignore)
          .accessibilityLabel(Text("Meeting length"))
          .accessibilityValue(Text("\(scrum.lengthInMinutes) minutes"))
      }
      .font(.caption)
      .foregroundColor(scrum.color.accessibleFontColor)
    }
    .padding()
  }
}

struct CardView_Previews: PreviewProvider {
  static var scrum = DailyScrum.data[0]
  static var previews: some View {
    CardView(scrum: scrum)
      .background(scrum.color)
      .previewLayout(.fixed(width: 400, height: 60))
  }
}
