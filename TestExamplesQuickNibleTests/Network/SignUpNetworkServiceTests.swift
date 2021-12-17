//
//  SignUpNetworkServiceTests.swift
//  TestExamplesQuickNibleTests
//
//  Created by Artem Grebinik on 17.12.2021.
//


import Quick
import Nimble
@testable import TestExamples

class SignUpNetworkServiceTests: QuickSpec {
    
    private enum Constants {
        static let urlString = "http://appsdeveloperblog.com:8080/signup-mock-service/users"
    }
    
    override func spec() {
        
        describe("testSignUpViewController") {
            var sut: SignUpNetworkService!
            var signUpFieldsModel: SignUpFieldModel!
          
            context("WhenGivenSuccessfullResponse") {
                beforeEach {
                    let config = URLSessionConfiguration.ephemeral
                    config.protocolClasses = [MockURLProtocol.self]
                    let urlSession = URLSession(configuration: config)
                    sut = SignUpNetworkService(urlString: Constants.urlString, urlSession: urlSession)
                    signUpFieldsModel = SignUpFieldModel(firstName: "Anton",
                                                         lastName: "Panteleimenko",
                                                         email: "mail@chisw.com",
                                                         password: "qwerty123")
                }
                
                it("ReturnsSuccess") {
                    let jsonString = "{\"status\":\"ok\"}"
                    MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
                    
                    waitUntil(timeout: .seconds(5)) { done in
                        sut.signUp(with: signUpFieldsModel) { (signupResponseModel, error) in
                            //"{\"status\":\"ok\"}"
                            expect(signupResponseModel?.status).to(equal("ok"))
                            done()
                        }
                    }
                }
            }
        }
    }
}
