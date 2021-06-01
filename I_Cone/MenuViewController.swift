//
//  ViewController.swift
//  I_Cone
//
//  Created by Vitor Cheung on 01/06/21.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var butaoJogar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        butaoJogar.addTarget(self, action: #selector(EventClick), for: .touchUpInside)
    }
    
    @objc func EventClick() {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(identifier: "GameViewController") as! GameViewController
        self.present(controller, animated: true, completion: nil)
    }
    
}

