//
//  MenuController.swift
//  HeroesAssemble
//
//  Created by erick pisco on 14/05/19.
//  Copyright © 2019 erick pisco. All rights reserved.
//

import UIKit
import Foundation

class MenuController: UIViewController {

    @IBOutlet weak var heroNameInput: UITextField!
    @IBOutlet weak var snapButton: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(true, animated: true)
    }
    
    func setupLayout() {
        heroNameInput.border(width: 3, color: #colorLiteral(red: 0.9994260669, green: 0.9856045842, blue: 0.003890435677, alpha: 1), radius: 5)
        snapButton.border(width: 3, color: #colorLiteral(red: 0.9994260669, green: 0.9856045842, blue: 0.003890435677, alpha: 1), radius: 5)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        heroNameInput.resignFirstResponder()
        let view = segue.destination as! HeroesTableView
        view.name = heroNameInput.text
    }
}
