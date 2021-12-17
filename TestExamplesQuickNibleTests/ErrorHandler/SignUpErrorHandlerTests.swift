//
//  SignUpErrorHandlerTests.swift
//  BDDTestExamplesTests
//
//  Created by Artem Grebinik on 29.06.2021.
//

import Quick
import Nimble
@testable import TestExamples

class SignUpErrorHandlerTests: QuickSpec {
    
    override func spec() {
        
        describe("testErrorHandler") {
            var sut: SignUpErrorHandler!
            var failedRequest: SignUpErrorHandler?
            
            context("WhenFailedRequestErrorCreated") {
                
                beforeEach {
                    failedRequest = SignUpErrorHandler.failedRequest(description: "Some error")
                    sut = SignUpErrorHandler(customError: "Some error")
                }
                it("error request should be equal") {
                    expect(failedRequest).to(equal(sut))
                }
                it("error description should be equal") {
                    expect(failedRequest!.errorDescription).to(equal(sut!.errorDescription))
                }
            }
            
            context("WhenResponseErrorCreated") {
                beforeEach {
                    failedRequest = SignUpErrorHandler.invalidResponseModel
                    sut = SignUpErrorHandler.invalidResponseModel
                }
                it("error request should be equal") {
                    expect(failedRequest).to(equal(sut))
                }
                it("error description should be equal") {
                    expect(failedRequest!.errorDescription).to(equal(sut!.errorDescription))
                }
            }
            
            context("WhenErrorCreated") {
                beforeEach {
                    failedRequest = SignUpErrorHandler.invalidRequestURLString
                    sut = SignUpErrorHandler.invalidRequestURLString
                }
                it("error request should be equal") {
                    expect(failedRequest).to(equal(sut))
                }
                it("error description should be equal") {
                    expect(failedRequest!.errorDescription).to(equal(sut!.errorDescription))
                }
            }
        }
    }
}
