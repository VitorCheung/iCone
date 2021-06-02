//
//  PontuacaoViewController.swift
//  I_Cone
//
//  Created by Vitor Cheung on 02/06/21.
//

import UIKit

class PontuacaoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }
    
    func backTwo() {
            let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
            self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
        }
        
    @IBAction func BackButao(_ sender: Any) {
    backTwo()
    }
    
    


}
