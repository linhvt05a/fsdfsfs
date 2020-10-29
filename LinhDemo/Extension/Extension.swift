//
//  Extension.swift
//  LinhDemo
//
//  Created by admin on 10/29/20.
//  Copyright © 2020 Hahalolo. All rights reserved.
//

import UIKit

extension UIView {
    func pinToView(to view: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
   
}

extension UIViewController {
    func setupNav(){
        navigationController?.navigationBar.isHidden = false
    }
    
    func navigateVC(controller: UIViewController){
        let vc = controller
         navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
