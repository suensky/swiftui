//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Huanhuan Sun on 1/13/21.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
  
  @State private var scrums = DailyScrum.data
  var body: some Scene {
    WindowGroup {
      NavigationView {
        ScrumsView(scrums: $scrums)
      }
    }
  }
}
