//
//  ViewController.swift
//  ReactiveXTest
//
//  Created by Pang on 2018. 5. 2..
//  Copyright © 2018년 iDeveloper. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit

class ViewController: UIViewController {

    var disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        checkArrayObservable(items: [4, 3, 0, 5, 2])
            .subscribe{ event in
                switch event {
                    case .next(let value) :
                        print(value)
                    case .error(let error) :
                        print(error)
                    case .completed:
                    print("complete")
                }
        }.disposed(by: self.disposeBag)
    }
    
    func checkArrayObservable(items: [Int]) -> Observable<Int> {
        return Observable<Int>.create { observer -> Disposable in
        
            for item in items{
                if item == 0 {
                    observer.onError(NSError(domain: "ERROR: value is zero", code: 0, userInfo: nil))
                    break
                }
                observer.onNext(item)
                sleep(1)
            }
        observer.onCompleted()
        return Disposables.create()
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

