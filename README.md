# RxFirebase

[![Platform](http://img.shields.io/badge/platform-iOS-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
![Swift](https://img.shields.io/badge/Swift-4.0-orange.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-Compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
)](http://mit-license.org)

## Overview

`RxFirebase` adds `RxSwift` extensions for several Firebase components. Currently `FirebaseAuth`, `FirebaseDatabase`, and `FirebaseStorage` are supported.

## Usage example

Here's a few simple examples.

```swift
import RxFirebase

Database.database().reference(withPath: "users").child(username).rx.updateChildValues(someVaues)
  .subscribe(onNext: { reference in
    // do something
  })
  .disposed(by: disposeBag)
```

```swift
import RxFirebase

Auth.auth().rx.createUser(with: someEmail, password: somePassword)
  .subscribe(onNext: { user in
    // do something
  })
  .disposed(by: disposeBag)

```

## Installation
#### Carthage

You can integrate via [Carthage](https://github.com/carthage/carthage), too.
Add the following line to your `Cartfile` :

```
github "yysskk/RxFirebase"
```

and run `carthage update`

#### Manually
1. Download and drop all the `.swift` files into your project.  
2. There is no step two.  

## Creator
### Yusuke Morishita
- [Github](https://github.com/yysskk)
- [Facebook](https://www.facebook.com/yysskk.mrst)
- [Twitter](https://twitter.com/_yysskk)


## License
`RxFirebase` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.
