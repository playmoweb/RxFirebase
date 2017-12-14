//
//  RxFirebaseDatabase.swift
//  RxFirebase
//
//  Created by Yusuke Morishia on 2017/12/14.
//  Copyright © 2017年 Yusuke Morishita. All rights reserved.
//

import FirebaseDatabase
import RxSwift

public extension Reactive where Base: DatabaseQuery {

    func observe(_ eventType: DataEventType) -> Single<DataSnapshot> {
        return .create { observer in
            let handle = self.base.observe(eventType, with: { snapshot in
                observer(.success(snapshot))
            }, withCancel: { error in
                observer(.error(error))
            })
            return Disposables.create {
                self.base.removeObserver(withHandle: handle)
            }
        }
    }

    func observe(_ eventType: DataEventType) -> Single<(DataSnapshot, String?)> {
        return .create { observer in
            let handle = self.base.observe(eventType, andPreviousSiblingKeyWith: { snapshot, key in
                observer(.success((snapshot, key)))
            }, withCancel: {error in
                observer(.error(error))
            })
            return Disposables.create {
                self.base.removeObserver(withHandle: handle)
            }
        }
    }

    func observeSingleEvent(of eventType: DataEventType) -> Single<DataSnapshot> {
        return .create { observer in
            self.base.observeSingleEvent(of: eventType, with: { snapshot in
                observer(.success(snapshot))
            }, withCancel: { error in
                observer(.error(error))
            })
            return Disposables.create {
                self.base.removeAllObservers()
            }
        }
    }

    func observeSingleEvent(of eventType: DataEventType) -> Single<(DataSnapshot, String?)> {
        return .create { observer in
            self.base.observeSingleEvent(of: eventType, andPreviousSiblingKeyWith: { snapshot, key in
                observer(.success((snapshot, key)))
            }, withCancel: {error in
                observer(.error(error))
            })

            return Disposables.create {
                self.base.removeAllObservers()
            }
        }
    }
}

public extension Reactive where Base: DatabaseReference {

    func setValue(_ value: Any) -> Single<DatabaseReference> {
        return .create { observer in
            self.base.setValue(value, withCompletionBlock: { error, reference in
                switch Result(reference, error) {
                case .success(let reference):
                    observer(.success(reference))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func setValue(_ value: Any?, andPriority priority: Any?) -> Single<DatabaseReference> {
        return .create { observer in
            self.base.setValue(value, andPriority: priority, withCompletionBlock: { error, reference in
                switch Result(reference, error) {
                case .success(let reference):
                    observer(.success(reference))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func removeValue() -> Single<DatabaseReference> {
        return .create { observer in
            self.base.removeValue(completionBlock: { error, reference in
                switch Result(reference, error) {
                case .success(let reference):
                    observer(.success(reference))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func setPriority(_ priority: Any?) -> Single<DatabaseReference> {
        return .create { observer in
            self.base.setPriority(priority, withCompletionBlock:  { error, reference in
                switch Result(reference, error) {
                case .success(let reference):
                    observer(.success(reference))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func updateChildValues(_ values: [AnyHashable : Any]) -> Single<DatabaseReference> {
        return .create { observer in
            self.base.updateChildValues(values, withCompletionBlock:  { error, reference in
                switch Result(reference, error) {
                case .success(let reference):
                    observer(.success(reference))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func observe(_ eventType: DataEventType) -> Single<DataSnapshot> {
        return .create { observer in
            let handle = self.base.observe(eventType, with: { snapshot in
                observer(.success(snapshot))
            }, withCancel: { error in
                observer(.error(error))
            })
            return Disposables.create {
                self.base.removeObserver(withHandle: handle)
            }
        }
    }

    func observe(_ eventType: DataEventType) -> Single<(DataSnapshot, String?)> {
        return .create { observer in
            let handle = self.base.observe(eventType, andPreviousSiblingKeyWith: { snapshot, key in
                observer(.success((snapshot, key)))
            }, withCancel: {error in
                observer(.error(error))
            })
            return Disposables.create {
                self.base.removeObserver(withHandle: handle)
            }
        }
    }

    func observeSingleEvent(of eventType: DataEventType) -> Single<DataSnapshot> {
        return .create { observer in
            self.base.observeSingleEvent(of: eventType, with: { snapshot in
                observer(.success(snapshot))
            }, withCancel: { error in
                observer(.error(error))
            })
            return Disposables.create {
                self.base.removeAllObservers()
            }
        }
    }

    func observeSingleEvent(of eventType: DataEventType) -> Single<(DataSnapshot, String?)> {
        return .create { observer in
            self.base.observeSingleEvent(of: eventType, andPreviousSiblingKeyWith: { snapshot, key in
                observer(.success((snapshot, key)))
            }, withCancel: {error in
                observer(.error(error))
            })

            return Disposables.create {
                self.base.removeAllObservers()
            }
        }
    }

    func onDisconnectSetValue(_ value: Any?) -> Single<DatabaseReference> {
        return .create { observer in
            self.base.onDisconnectSetValue(value, withCompletionBlock: { error, reference in
                switch Result(reference, error) {
                case .success(let reference):
                    observer(.success(reference))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func onDisconnectSetValue(_ value: Any?, andPriority priority: Any?) -> Single<DatabaseReference> {
        return .create { observer in
            self.base.onDisconnectSetValue(value, andPriority: priority, withCompletionBlock: { error, reference in
                switch Result(reference, error) {
                case .success(let reference):
                    observer(.success(reference))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func onDisconnectRemoveValue() -> Single<DatabaseReference> {
        return .create { observer in
            self.base.onDisconnectRemoveValue(completionBlock: { error, reference in
                switch Result(reference, error) {
                case .success(let reference):
                    observer(.success(reference))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func onDisconnectUpdateChildValues(_ values: [AnyHashable : Any]) -> Single<DatabaseReference> {
        return .create { observer in
            self.base.onDisconnectUpdateChildValues(values, withCompletionBlock: { error, reference in
                switch Result(reference, error) {
                case .success(let reference):
                    observer(.success(reference))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func cancelDisconnectOperations() -> Single<DatabaseReference> {
        return .create { observer in
            self.base.cancelDisconnectOperations(completionBlock: { error, reference in
                switch Result(reference, error) {
                case .success(let reference):
                    observer(.success(reference))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func runTransactionBlock(_ block: @escaping (MutableData) -> TransactionResult) -> Single<(Bool, DataSnapshot?)> {
        return .create { observer in
            self.base.runTransactionBlock(block, andCompletionBlock: { error, isSuccess, snapshot in
                switch Result((isSuccess, snapshot), error) {
                case .success(let success):
                    observer(.success(success))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func runTransactionBlock(_ block: @escaping (MutableData) -> TransactionResult, withLocalEvents localEvents: Bool) -> Single<(Bool, DataSnapshot?)> {
        return .create { observer in
            self.base.runTransactionBlock(block, andCompletionBlock: { error, isSuccess, snapshot in
                switch Result((isSuccess, snapshot), error) {
                case .success(let success):
                    observer(.success(success))
                case .failure(let error):
                    observer(.error(error))
                }
            }, withLocalEvents: localEvents)
            return Disposables.create()
        }
    }
}
