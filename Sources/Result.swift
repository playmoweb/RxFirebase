//
//  Result.swift
//  RxFirebase
//
//  Created by 森下 侑亮 on 2017/12/12.
//  Copyright © 2017年 Yusuke Morishita. All rights reserved.
//

import Foundation

public enum ResultError<T>: Error {
    case illegalCombination(T?, Error?)
}

public enum Result<T> {
    case success(T)
    case failure(Error)

    init(_ value: T?, _ error: Error?) {
        switch (value, error) {
        case (let value?, nil):
            self = .success(value)
        case (nil, let error?):
            self = .failure(error)
        default:
            self = .failure(ResultError.illegalCombination(value, error))
        }
    }
}
