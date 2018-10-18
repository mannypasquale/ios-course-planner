//
//  StartScreenViewController.swift
//  ProjectSkelton2
//
//  Created by Manny Pasquale on 2018-03-02.
//  Copyright © 2018 Manny Pasquale. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    
    
    // MARK: - gobal variable to access courseItems
    
    struct GlobalVariables {
        
        static var items = [CourseItem]()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintAdjustmentMode = .normal
        self.navigationController?.navigationBar.tintAdjustmentMode = .automatic
    }

}
