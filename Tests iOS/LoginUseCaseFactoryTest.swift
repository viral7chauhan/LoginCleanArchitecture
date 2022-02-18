//
//  LoginUseCaseFactoryTest.swift
//  Tests iOS
//
//  Created by Viral on 10/11/21.
//

import XCTest
@testable import LoginCleanArchitecture

class LoginUseCaseFactoryTest: XCTestCase {

    func test() {
        let sut = LoginUseCaseFactory()
        let userCase = sut.makeUseCase()
        let composer = userCase.output as? LoginUseCaseOutputComposer
        XCTAssertNotNil(composer)
        XCTAssertEqual(composer?.outputs.count, 3)
        XCTAssertEqual(composer?.count(ofType: LoginPresenter.self), 1)
        XCTAssertEqual(composer?.count(ofType: CrashlyticsLoginTracker.self), 1)
        XCTAssertEqual(composer?.count(ofType: FirebaseLoginTracker.self), 1)
    }
}

private extension LoginUseCaseOutputComposer {
    func count<T>(ofType: T.Type) -> Int {
        return outputs.filter { $0 is T }.count
    }
}
