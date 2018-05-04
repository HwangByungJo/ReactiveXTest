//
//  LoginViewModel.swift
//  ReactiveXTest
//
//  Created by Pang on 2018. 5. 4..
//  Copyright © 2018년 iDeveloper. All rights reserved.
//
import Foundation

import RxSwift
import RxCocoa

struct LoginViewModel {
    
    var username = Variable<String>("")
    var password = Variable<String>("")
    
    var isValid : Observable<Bool>{
        return Observable.combineLatest( self.username,
                                         self.password,
                                         resultSelector:{
            (username, password) in
                return username.characters.count > 0 && password.characters.count > 0
        })
    }
}
