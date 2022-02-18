//
//  LoginUserCaseFactory.swift
//  LoginCleanArchitecture
//
//  Created by Viral on 10/11/21.
//

import Foundation

final class LoginUseCaseFactory {
    func makeUseCase() -> LoginUseCase {
        return LoginUseCase(output: LoginUseCaseOutputComposer([
            LoginPresenter(),
            CrashlyticsLoginTracker(),
            FirebaseLoginTracker()
        ]))
    }
}
