//
//  testSwiftViewController.swift
//  oc->swift
//
//  Created by 刘文强 on 2017/7/3.
//  Copyright © 2017年 inborn. All rights reserved.
//

import UIKit

/**
 代理 要使用objc oc中才能获取到
 */
@objc(editTextFiledDelegate)
protocol editTextFiledDelegate: NSObjectProtocol {
    
    func editTextfiledDele( str: String) -> Void
}

class testSwiftViewController: UIViewController {

    /**
     参数设置成public 可以在oc中传递参数
     */
    public var proId:String = ""
    public var model:String = ""
    
    /**
      声明代理
     */
    var textfileddelegate:editTextFiledDelegate?
    
    /**
     定义block
     */
    typealias edittextfileBlock = ( _ str: String) -> Void
    var myeditBlock:edittextfileBlock?
    
    override  func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.brown
        
        print("-----testSwiftviewController---")
        
        print("------proId:\(proId)------modle:\(model))")
        
        self.view.addSubview(testTextfiled)
        self.view.addSubview(testbtn)
    }

    override  func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func backbtn() {
        
        testTextfiled.resignFirstResponder()
        
        if textfileddelegate != nil {
            
            textfileddelegate?.editTextfiledDele(str: testTextfiled.text!)
        }
        
        if self.myeditBlock != nil {
            
            self.myeditBlock?(testTextfiled.text!)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    /**
     使用方法传递参数
     */
    public func modele(modele:String) -> () {
        
        model = modele
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        testTextfiled.resignFirstResponder()
    }
    
    
    
    /**
     懒加载
     */
    lazy var testTextfiled: UITextField = {
        let testTextfiled = UITextField.init(frame: CGRect(x:100,y:100,width:100,height:50))
        testTextfiled.placeholder = "输入..."
        return testTextfiled
    }()
    
    lazy var testbtn: UIButton = {
        let testbtn = UIButton.init(frame: CGRect(x:100,y:100,width:100,height:100))
        testbtn.setTitle("返回", for: .normal)
        testbtn.addTarget(self, action: #selector(backbtn), for: .touchUpInside)
        testbtn.center = self.view.center
        return testbtn
    }()
}
