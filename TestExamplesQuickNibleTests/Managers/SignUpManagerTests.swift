//
//  SignUpManagerTests.swift
//  TestExamplesQuickNibleTests
//
//  Created by Artem Grebinik on 17.12.2021.
//
import Quick
import Nimble
@testable import TestExamples

class SignUpManagerTests: QuickSpec {
    
    override func spec() {
        
        describe("testSignUpViewController") {
            var signUpFieldModel: StubSignUpFieldModel!
            var mockSignupModelValidator: MockSignUpFieldValidatorModel!
            var fakeSignUpNetworkService: FakeSignUpNetworkService!
            var mockSignUpResultDelegate: MockSignUpResultDelegate!
            var sut: SignUpManager!
            
            beforeEach {
                signUpFieldModel = StubSignUpFieldModel()
                mockSignupModelValidator = MockSignUpFieldValidatorModel()
                fakeSignUpNetworkService = FakeSignUpNetworkService()
                mockSignUpResultDelegate = MockSignUpResultDelegate()
                sut = SignUpManager(modelFieldValidator: mockSignupModelValidator,
                                    networkService: fakeSignUpNetworkService,
                                    delegate: mockSignUpResultDelegate)
            }
            
            context("WithTextFromFields") {
                it("WillValidateEachValue") {
                    
                    sut.processUserSignup(model: signUpFieldModel)
                    expect(mockSignupModelValidator.isFirstNameValidated) == true
                    expect(mockSignupModelValidator.isLastNameValidated) == true
                    expect(mockSignupModelValidator.isEmailValidated) == true
                    expect(mockSignupModelValidator.isPasswordValidated) == true
                }
            }
            
            context("WithTextFromFields") {
                it("WillFailValidation") {
                    let model = signUpFieldModel.returnEmptyStub()
                    sut.processUserSignup(model: model)
                    
                    expect(mockSignupModelValidator.isFirstNameValidated) == true
                    expect(mockSignupModelValidator.isLastNameValidated) == true
                    expect(mockSignupModelValidator.isEmailValidated) == true
                    expect(mockSignupModelValidator.isPasswordValidated) == true
                }
            }
            
            context("WhenGivenValidFormModel") {
                it("ShouldCallSignUpMethod") {
                    sut.processUserSignup(model: signUpFieldModel)
                    
                    expect(fakeSignUpNetworkService.isSignupMethodCalled) == true
                }
            }
            
            context("WhenSignUpWorked") {
                it("CallsSuccess") {
                    let myExpectation = self.expectation(description: "Expected the successfulSignup() method to be called")
                    mockSignUpResultDelegate.expectation = myExpectation
                    //
                    sut.processUserSignup(model: signUpFieldModel)
                    
                    waitUntil(timeout: .seconds(5)) { done in
                        done()
                    }
                    expect(mockSignUpResultDelegate.successfulSignupCounter).to(equal(1))
                }
            }
            
            context("WhenSignUpFailed") {
                it("ShouldCallError") {
                    let errorHandlerExpectation = self.expectation(description: "Expected the errorHandler() method to be called")
                    mockSignUpResultDelegate.expectation = errorHandlerExpectation
                    fakeSignUpNetworkService.shouldReturnError = true
                    sut.processUserSignup(model: signUpFieldModel)
                    
                    waitUntil(timeout: .seconds(5)) { done in
                        done()
                    }
                    expect(mockSignUpResultDelegate.successfulSignupCounter).to(equal(0))
                    expect(mockSignUpResultDelegate.errorHandlerCounter) == 1
                    expect(mockSignUpResultDelegate.signupError).toNot(beNil())
                    
                }
            }
        }
    }
}

