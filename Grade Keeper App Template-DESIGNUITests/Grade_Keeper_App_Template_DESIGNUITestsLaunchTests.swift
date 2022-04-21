//
//  Grade_Keeper_App_Template_DESIGNUITestsLaunchTests.swift
//  Grade Keeper App Template-DESIGNUITests
//
//  Created by Ömer Faruk Kılıçaslan on 21.04.2022.
//

import XCTest

class Grade_Keeper_App_Template_DESIGNUITestsLaunchTests: XCTestCase {

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
