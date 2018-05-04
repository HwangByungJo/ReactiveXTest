//
//  LoginViewController.swift
//  ReactiveXTest
//
//  Created by Pang on 2018. 5. 4..
//  Copyright © 2018년 iDeveloper. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa


class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
     //viewModel is just a member variable here.
    var viewModel = LoginViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.rx.text.bindTo(viewModel.username).addTo(disposeBag)
        passwordTextField.rx.text.bindTo(viewModel.password).addTo(disposeBag)
        
        //from the viewModel
        viewModel.rx.isValid.map{ $0 }
            .bindTo(confirmButton.rx.isEnabled)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
