//
//  RxFirebaseAuth.swift
//  RxFirebase
//
//  Created by 森下 侑亮 on 2017/12/12.
//  Copyright © 2017年 Yusuke Morishita. All rights reserved.
//

import FirebaseAuth
import RxSwift

public extension Reactive where Base: Auth {

    func fetchProviders(for email: String) -> Single<[String]?> {
        return .create { observer in
            self.base.fetchProviders(forEmail: email, completion: { list, error in
                switch Result(list, error) {
                case .success(let list):
                    observer(.success(list))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func signIn(with email: String, password: String) -> Single<User> {
        return .create { observer in
            self.base.signIn(withEmail: email, password: password, completion: { user, error in
                switch Result(user, error) {
                case .success(let user):
                    observer(.success(user))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func signIn(with authCredential: AuthCredential) -> Single<User> {
        return .create { observer in
            self.base.signIn(with: authCredential, completion: { user, error in
                switch Result(user, error) {
                case .success(let user):
                    observer(.success(user))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func signInAnonymously() -> Single<User> {
        return .create { observer in
            self.base.signInAnonymously(completion: { user, error in
                switch Result(user, error) {
                case .success(let user):
                    observer(.success(user))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func signIn(with customToken: String) -> Single<User> {
        return .create { observer in
            self.base.signIn(withCustomToken: customToken, completion: { user, error in
                switch Result(user, error) {
                case .success(let user):
                    observer(.success(user))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func signInAndRetrieveData(with authCredential: AuthCredential) -> Single<AuthDataResult> {
        return .create { observer in
            self.base.signInAndRetrieveData(with: authCredential, completion: { result, error in
                switch Result(result, error) {
                case .success(let result):
                    observer(.success(result))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func createUser(with email: String, password: String) -> Single<User> {
        return .create { observer in
            self.base.createUser(withEmail: email, password: password, completion: { user, error in
                switch Result(user, error) {
                case .success(let user):
                    observer(.success(user))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func confirmPasswordReset(with code: String, newPassword: String) -> Completable {
        return .create { observer in
            self.base.confirmPasswordReset(withCode: code, newPassword: newPassword, completion: { error in
                switch Result(Void.self, error) {
                case .success:
                    observer(.completed)
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func checkActionCode(_ code: String) -> Single<ActionCodeInfo?> {
        return .create { observer in
            self.base.checkActionCode(code, completion: { actionCodeInfo, error in
                switch Result(actionCodeInfo, error) {
                case .success(let actionCodeInfo):
                    observer(.success(actionCodeInfo))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func verifyPasswordResetCode(_ code: String) -> Single<String> {
        return .create { observer in
            self.base.verifyPasswordResetCode(code, completion: { code, error in
                switch Result(code, error) {
                case .success(let code):
                    observer(.success(code))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func applyActionCode(_ code: String) -> Completable {
        return .create { observer in
            self.base.applyActionCode(code, completion: { error in
                switch Result(Void.self, error) {
                case .success:
                    observer(.completed)
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func sendPasswordReset(with email: String) -> Completable {
        return .create { observer in
            self.base.sendPasswordReset(withEmail: email, completion: { error in
                switch Result(Void.self, error) {
                case .success:
                    observer(.completed)
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func sendPasswordReset(with email: String, actionCodeSettings: ActionCodeSettings) -> Completable {
        return .create { observer in
            self.base.sendPasswordReset(withEmail: email, actionCodeSettings: actionCodeSettings, completion: { error in
                switch Result(Void.self, error) {
                case .success:
                    observer(.completed)
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func signOut() -> Completable {
        return .create { observer in
            do {
                try self.base.signOut()
                observer(.completed)
            } catch {
                observer(.error(error))
            }
            return Disposables.create()
        }
    }

    func addStateDidChangeListener() -> Observable<(Auth, User?)> {
        return .create { observer in
            let handle = self.base.addStateDidChangeListener(observer.onNext)
            return Disposables.create {
                self.base.removeStateDidChangeListener(handle)
            }
        }
    }

    func addIDTokenDidChangeListener() -> Observable<(Auth, User?)> {
        return .create { observer in
            let handle = self.base.addIDTokenDidChangeListener(observer.onNext)
            return Disposables.create {
                self.base.removeIDTokenDidChangeListener(handle)
            }
        }
    }
}
