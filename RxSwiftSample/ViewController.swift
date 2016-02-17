//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by 田中賢治 on 2016/02/14.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import UIKit
import RxSwift
import RxBlocking
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var viewModel = ViewModel()
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Binding
        // Binding textField to label via viewModel.
        textField.rx_text.subscribeNext { [unowned self] text in
            self.viewModel.text.value = text
        }.addDisposableTo(disposeBag)
        viewModel.text.asObservable().bindTo(label.rx_text).addDisposableTo(disposeBag)
        
        button.rx_tap
            .subscribeNext { [unowned self] in print(self.viewModel.text.value) }
            .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

