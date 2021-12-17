//
//  UIColorHexTests.swift
//  BDDTestExamplesTests
//
//  Created by Artem Grebinik on 29.06.2021.
//

import Quick
import Nimble
@testable import TestExamples

class UIColorHexTests: QuickSpec {
    
    override func spec() {
        
        describe("testUIColorInit") {
            var sus: UIColor!
            
            context("WithRGB") {
                var dodgerBlueHexColor: UIColor!
                
                beforeEach {
                    sus = UIColor(r: 30.0, g: 144.0, b: 255)
                    dodgerBlueHexColor = UIColor.init(hexString: "1E90FF")
                }
                it("should be same"){
                    expect(sus).to(equal(dodgerBlueHexColor))
                }
                it("should not be nil"){
                    expect(sus).notTo(beNil())
                    expect(dodgerBlueHexColor).notTo(beNil())
                }
            }
            
            context("WithGrayColor") {
                var silverColor: UIColor!
                
                beforeEach {
                    sus = UIColor(gray: 192.0)
                    silverColor = UIColor.init(hexString: "C0C0C0")
                }
                it("should be same"){
                    expect(sus).to(equal(silverColor))
                }
                it("should not be nil"){
                    expect(sus).notTo(beNil())
                    expect(silverColor).notTo(beNil())
                }
            }
            
            context("WithRandomColor") {
                beforeEach {
                    sus = UIColor.randomCGColor()
                }
                it("should not be nil"){
                    expect(sus).notTo(beNil())
                }
            }
            
            context("WithHexAlhpa") {
                var lightSalmon: UIColor!
                
                beforeEach {
                    sus = UIColor.init(hex: 16752762, alpha: 1.0)
                    lightSalmon = UIColor.init(hexString: "FFA07A")
                    
                }
                it("should be same"){
                    expect(sus).to(equal(lightSalmon))
                }
                it("should not be nil"){
                    expect(sus).notTo(beNil())
                    expect(lightSalmon).notTo(beNil())
                }
            }
            
            context("WithHexString") {
                let wrongColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                let threeDigits = UIColor.init(hexString: "F0F")
                let fourDigits = UIColor.init(hexString: "FC0C")
                let sixDigits = UIColor.init(hexString: "FF0000")
                let eightDigits = UIColor.init(hexString: "FF0000CC")
                let defaultState = UIColor.init(hexString: "FFF00000CCC")
                let errorState = UIColor.init(hexString: "what?")
                
                it("should be same"){
                    expect(wrongColor).to(equal(defaultState))
                    expect(wrongColor).to(equal(errorState))
                }
                it("should not be nil"){
                    expect(threeDigits).notTo(beNil())
                    expect(fourDigits).notTo(beNil())
                    expect(sixDigits).notTo(beNil())
                    expect(eightDigits).notTo(beNil())
                }
            }
        }
    }
}
