//
//  Take_a_Minute_WatchUITestsLaunchTests.swift
//  Take a Minute WatchUITests
//
//  Created by Joe Martin on 29/10/2021.
//  Copyright © 2021 Joe Martin. All rights reserved.
//

import XCTest

class Take_a_Minute_WatchUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
