//
//  RxFirebaseStorage.swift
//  RxFirebase
//
//  Created by Yusuke Morishia on 2017/12/15.
//  Copyright © 2017年 Yusuke Morishita. All rights reserved.
//

import FirebaseStorage
import RxSwift

public extension Reactive where Base: StorageObservableTask {

    func observe(_ status: StorageTaskStatus) -> Observable<StorageTaskSnapshot> {
        return .create { observer in
            let handle = self.base.observe(status, handler: observer.onNext)
            return Disposables.create {
                self.base.removeObserver(withHandle: handle)
            }
        }
    }
}

public extension Reactive where Base: StorageReference {

    func downloadURL() -> Single<URL?> {
        return .create { observer in
            self.base.downloadURL(completion: { url, error in
                switch Result(url, error) {
                case .success(let url):
                    observer(.success(url))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func getMetadata() -> Single<StorageMetadata?> {
        return .create { observer in
            self.base.getMetadata(completion: { metadata, error in
                switch Result(metadata, error) {
                case .success(let metadata):
                    observer(.success(metadata))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func updateMetadata(_ metadata: StorageMetadata) -> Single<StorageMetadata?> {
        return .create { observer in
            self.base.updateMetadata(metadata, completion: { metadata, error in
                switch Result(metadata, error) {
                case .success(let metadata):
                    observer(.success(metadata))
                case .failure(let error):
                    observer(.error(error))
                }
            })
            return Disposables.create()
        }
    }

    func delete() -> Completable {
        return .create { observer in
            self.base.delete(completion: { error in
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
}
