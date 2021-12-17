//
//  SignUpViewControllerTests.swift
//  TestExamplesQuickNibleTests
//
//  Created by Artem Grebinik on 17.12.2021.
//

import Quick
import Nimble
@testable import TestExamples

class SignUpViewControllerTests: QuickSpec {
    override func spec() {
        
        describe("testSignUpViewController") {
            var sut: SignUpViewController!
           
            context("WhenSignupButtonTapped") {
                beforeEach {
                    sut = SignUpViewController()
                    sut.loadViewIfNeeded()
                }
                it("The processUserSignup() method was not called on a Manager object when the signup button was tapped in a SignupViewController") {
                    let mockSignUpFieldValidatorModel = MockSignUpFieldValidatorModel()
                    let fakeSignUpNetworkService = FakeSignUpNetworkService()
                    let mockSignUpResultDelegate = MockSignUpResultDelegate()
                    
                    let mockSignupManager = MockSignUpManager(
                        modelFieldValidator: mockSignUpFieldValidatorModel,
                        networkService: fakeSignUpNetworkService,
                        delegate: mockSignUpResultDelegate)
                    
                    sut.signUpManager = mockSignupManager
                    sut.signUpButtonRef.sendActions(for: .touchUpInside)

                    expect(mockSignupManager.processUserSignupCalled) == false
                }
            }
            
            context("TestSignUp") {
                beforeEach {
                    sut = SignUpViewController()
                    sut.loadViewIfNeeded()
                }
                it("The signUp() method was not called on a Manager object when the signup button was tapped in a SignupViewController") {
                    // Arrange
                    let dummySignUpFieldValidatorModel = DummySignUpFieldValidatorModel()
                    let dummySignUpNetworkService = DummySignUpNetworkService()
                    let mockSignUpResultDelegate = MockSignUpResultDelegate()
                    
                    let mockSignupManager = MockSignUpManager(modelFieldValidator: dummySignUpFieldValidatorModel,
                                                                networkService: dummySignUpNetworkService,
                                                                delegate: mockSignUpResultDelegate)
                    
                    sut.signUpManager = mockSignupManager
                    
                    // Act
                    sut.signUp()

                    expect(mockSignupManager.processUserSignupCalled) == true
                }
            }
        }
    }
}
