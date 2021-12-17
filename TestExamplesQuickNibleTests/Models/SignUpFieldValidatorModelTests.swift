//
//  SignUpFieldValidatorModelTests.swift
//  TestExamplesQuickNibleTests
//
//  Created by Artem Grebinik on 17.12.2021.
//

import Foundation
import Quick
import Nimble
@testable import TestExamples

class SignUpFieldValidatorModelTests: QuickSpec {
    
    override func spec() {
        describe("testSignUpValidator") {
            var sut: SignUpFieldValidatorModel!
            
            context("WhenValidFirstNameProvided") {
                beforeEach {
                    sut = SignUpFieldValidatorModel()
                }
                it("should have returned TRUE for a valid first name but returned FALSE") {
                    let isFirstNameValid = sut.isFirstNameValid(firstName: "Anton")
                    expect(isFirstNameValid) == true
                }
            }
         
            context("WhenTooShortFirstNameProvided") {
                beforeEach {
                    sut = SignUpFieldValidatorModel()
                }
                it("The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(ValidationConstants.firstNameFieldCharacterLength.min) characters but it has returned TRUE") {
                    let isFirstNameValid = sut.isFirstNameValid(firstName: "A")
                    expect(isFirstNameValid) == false
                }
            }
            
            context("WhenTooLongFirstNameProvided") {
                beforeEach {
                    sut = SignUpFieldValidatorModel()
                }
                it("The isFirstNameValid() should have returned FALSE for a first name that is longer than \(ValidationConstants.firstNameFieldCharacterLength.max) characters but it has returned TRUE") {
                    let isFirstNameValid = sut.isFirstNameValid(firstName: "AntonAntonAnton")
                    expect(isFirstNameValid) == false
                }
            }
            
            context("WhenValidLastNameProvided") {
                beforeEach {
                    sut = SignUpFieldValidatorModel()
                }
                it("The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE") {
                    let isLastNameValid = sut.isLastNameValid(lastName: "Panteleimenko")
                    expect(isLastNameValid) == true
                }
            }
            
            context("WhenTooShortLastNameProvided") {
                beforeEach {
                    sut = SignUpFieldValidatorModel()
                }
                it("The isLastNameValid() should have returned FALSE for a last name that is shorter than \(ValidationConstants.lastNameFieldCharacterLength.min) characters but it has returned TRUE") {
                    let isLastNameValid = sut.isLastNameValid(lastName: "P")
                    expect(isLastNameValid) == false
                }
            }
            
            context("WhenTooLongLastNameProvided") {
                beforeEach {
                    sut = SignUpFieldValidatorModel()
                }
                it("The isLastNameValid() should have returned FALSE for a last name that is longer than \(ValidationConstants.lastNameFieldCharacterLength.max) characters but it has returned TRUE") {
                    let isLastNameValid = sut.isLastNameValid(lastName: "PanteleimenkoPanteleimenko")
                    expect(isLastNameValid) == false
                }
            }
            
            context("WhenValidEmailProvided") {
                beforeEach {
                    sut = SignUpFieldValidatorModel()
                }
                it("Provided valid email address format but validation did not pass") {
                    let isValidEmailFormat = sut.isEmailValid(email: "mail@chisw.com")
                    expect(isValidEmailFormat) == true
                }
            }
            
            context("WhenInValidEmailProvided") {
                beforeEach {
                    sut = SignUpFieldValidatorModel()
                }
                it("Provided invalid email address format but validation still passed") {
                    let isValidEmailFormat = sut.isEmailValid(email: "mail@chisw")
                    expect(isValidEmailFormat) == false
                }
            }
            
            context("WhenValidPasswordProvided") {
                beforeEach {
                    sut = SignUpFieldValidatorModel()
                }
                it("The isPasswordValid() should have returned TRUE for a valid password  but it has returned FALSE") {
                    let isPasswordValid = sut.isPasswordValid(password: "qwerty123")
                    expect(isPasswordValid) == true
                }
            }
            
            context("WhenTooShortPasswordProvided") {
                beforeEach {
                    sut = SignUpFieldValidatorModel()
                }
                it("The isPasswordValid() should have returned FALSE for a password that is shorter than \(ValidationConstants.passwordFieldCharacterLength.min) but it has returned TRUE") {
                    let isPasswordValid = sut.isPasswordValid(password: "123")
                    expect(isPasswordValid) == false
                }
            }
            
            context("WhenTooLongPasswordProvided") {
                beforeEach {
                    sut = SignUpFieldValidatorModel()
                }
                it("The isPasswordValid() should have returned FALSE for a password that is longer than \(ValidationConstants.passwordFieldCharacterLength.max) but it has returned TRUE") {
                    let isPasswordValid = sut.isPasswordValid(password: "qwerty123qwerty123qwerty123")
                    expect(isPasswordValid) == false
                }
            }
        }
    }
}


