//
//  LoginUseCase.swift
//  LoginCleanArchitecture (iOS)
//
//  Created by Viral on 08/11/21.
//

import Foundation

protocol LoginUseCaseOutput {
    func loginSucess()
    func loginFailed()
}

class LoginUseCase {
    let output: LoginUseCaseOutput

    init(output: LoginUseCaseOutput) {
        self.output = output
    }

    func login(name: String, password: String) {
        // if success
        output.loginSucess()
        // else
        output.loginFailed()
    }
}
