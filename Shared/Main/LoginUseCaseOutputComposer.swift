//
//  LoginUseCaseOutputComposer.swift
//  LoginCleanArchitecture (iOS)
//
//  Created by Viral on 08/11/21.
//

import Foundation

final class LoginUseCaseOutputComposer: LoginUseCaseOutput {
    let outputs: [LoginUseCaseOutput]

    init(_ outputs: [LoginUseCaseOutput]) {
        self.outputs = outputs
    }

    func loginFailed() {
        outputs.forEach { $0.loginFailed() }
    }

    func loginSucess() {
        outputs.forEach { $0.loginSucess() }
    }
}
