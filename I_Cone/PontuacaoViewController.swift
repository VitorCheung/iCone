//
//  PontuacaoViewController.swift
//  I_Cone
//
//  Created by Vitor Cheung on 02/06/21.
//

import UIKit

class PontuacaoViewController: UIViewController {
    
    var pontuacao : Int = 0 
    @IBOutlet weak var labelPont: UILabel!
    
//    internal init(pontuacao: Int){
//        super.init(nibName: nil, bundle: nil)
//        self.pontuacao=pontuacao
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        labelPont.text="\(pontuacao)"
        // Do any additional setup after loading the view.
    }
    
    func backTwo() {
            let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
            self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
        }
    
    @IBAction func BackToGame(_ sender: Any) {
        navigationController?.popViewController(animated: true)
                dismiss(animated: true, completion: nil)
    }
    
    @IBAction func BackButao(_ sender: Any) {
    backTwo()
    }
    
    


}
