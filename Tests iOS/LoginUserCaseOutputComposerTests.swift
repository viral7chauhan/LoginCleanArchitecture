//
//  LoginUserCaseOutputComposerTests.swift
//  Tests iOS
//
//  Created by Viral on 08/11/21.
//

import XCTest
@testable import LoginCleanArchitecture

class LoginUserCaseOutputComposerTests: XCTestCase {

    func test_composingZeroOutput_doesNotCrash() {
        let sut = LoginUseCaseOutputComposer([])
        sut.loginSucess()
        sut.loginFailed()
    }

    func test_composingMultipleOutput_delegateSuceededMessage() {
        let output1 = LoginUserCaseOutputSpy()
        let output2 = LoginUserCaseOutputSpy()
        let sut = LoginUseCaseOutputComposer([output1, output2])

        sut.loginSucess()

        XCTAssertEqual(output1.loginSuccessCallCount,  1)
        XCTAssertEqual(output1.loginFailedCallCount,  0)

        XCTAssertEqual(output2.loginSuccessCallCount,  1)
        XCTAssertEqual(output2.loginFailedCallCount,  0)
    }

    func test_composingMultipleOutput_delegateFailedMessage() {
        let output1 = LoginUserCaseOutputSpy()
        let output2 = LoginUserCaseOutputSpy()
        let sut = LoginUseCaseOutputComposer([output1, output2])

        sut.loginFailed()

        XCTAssertEqual(output1.loginSuccessCallCount,  0)
        XCTAssertEqual(output1.loginFailedCallCount,  1)

        XCTAssertEqual(output2.loginSuccessCallCount,  0)
        XCTAssertEqual(output2.loginFailedCallCount,  1)
    }
}

final class LoginUserCaseOutputSpy: LoginUseCaseOutput {
    var loginSuccessCallCount = 0
    var loginFailedCallCount = 0

    func loginFailed() {
        loginFailedCallCount += 1
    }

    func loginSucess() {
        loginSuccessCallCount += 1
    }
}
