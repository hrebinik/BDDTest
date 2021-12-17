//
//
//  Created by XCFit Framework
//  Copyright © 2017 XCFit Framework. All rights reserved.
//


/*

 This is sample code created by XCFit Framework and can be edited/Removed as needed.
 
 This is very important file as we will be using it as initialiser of all out test suite. We have to resgister all our Step Definitions in this class. e.g we have registed CommonStepDefinitions and HomeScreenSteps here

 */


import Foundation
import Cucumberish

class TestExamplesCucumberTests: NSObject {
    @objc class func CucumberishSwiftInit()
    {
        var application : XCUIApplication!
        //A closure that will be executed just before executing any of your features
        beforeStart { () -> Void in
            application = XCUIApplication()
        }
        //A Given step definition
        Given("the app is running") { (args, userInfo) -> Void in
            application.launch()
        }
        
        Given("I am on Login Screen") { (args, userInfo) -> Void in            self.waitForElementToAppear(XCUIApplication().otherElements["LoginView"])
        }
        
        Given("I see Sign Up button") { (args, userInfo) -> Void in
           let element = application.buttons["signUp"]
            XCTAssert(element.waitForExistence(timeout: 5))
            XCTAssert(element.isHittable)
        }

        Given("I see name textField") { (args, userInfo) -> Void in
            let element = application.textFields["firstNameTextField"]
            self.waitForElementToAppear(element)
        }
        Given("I see lastName textField") { (args, userInfo) -> Void in            
            let element = application.textFields["lastNameTextField"]
            self.waitForElementToAppear(element)
        }

        
        When("I enter \"([^\\\"]*)\" in the name text fields") { (args, userInfo) -> Void in
            let task = (args?[0])!
            let element = application.textFields["firstNameTextField"]
            element.tap()
            waitForElementToAppear(application.keyboards.firstMatch)
            element.typeText(task + "\n")
        }
        Then("I enter \"([^\\\"]*)\" in the last name text fields") { (args, userInfo) -> Void in
            let task = (args?[0])!
            let element = application.textFields["lastNameTextField"]
            element.tap()
            waitForElementToAppear(application.keyboards.firstMatch)
            element.typeText(task + "\n")
        }
        Then("I enter \"([^\\\"]*)\" in the email text fields") { (args, userInfo) -> Void in
            let task = (args?[0])!
            let element = application.textFields["emailTextField"]
            element.tap()
            waitForElementToAppear(application.keyboards.firstMatch)
            element.typeText(task + "\n")
        }
        
        Then("I enter \"([^\\\"]*)\" in the password text fields") { (args, userInfo) -> Void in
            let task = (args?[0])!
            let element = application.secureTextFields["passwordTextField"]
            element.tap()
            waitForElementToAppear(application.keyboards.firstMatch)
            element.typeText(task + "\n")
        }
        
        Then("I press the button") { (args, userInfo) -> Void in
            application.buttons["signUp"].tap()
        }

        Then("^I see an alert with title \"([^\\\"]*)\"") { (args, userInfo) -> Void in
            let alertDescription = args?[0]
            XCTestCase().addUIInterruptionMonitor(withDescription: alertDescription!) { (alert) -> Bool in
                alert.buttons["OK"].tap()
                return true
            }
            XCUIApplication().tap()
        }

        let bundle = Bundle(for: TestExamplesCucumberTests.self)

        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: nil, excludeTags: nil)
    }
    
    class func waitForElementToAppear(_ element: XCUIElement){
        let result = element.waitForExistence(timeout: 10)
        guard result else {
            XCTFail("Element does not appear")
            return
        }
    }
}
