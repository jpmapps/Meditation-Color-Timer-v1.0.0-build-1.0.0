//
//  Take_a_MinuteApp.swift
//  Take a Minute Watch WatchKit Extension
//
//  Created by Joe Martin on 29/10/2021.
//  Copyright © 2021 Joe Martin. All rights reserved.
//

import SwiftUI

@main
struct Take_a_MinuteApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
