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
    
    func setupBgColor(to view : UIView, color: UIColor){
        view.backgroundColor = color
       
    }
    
    func setupTableview(to view: UIView, listName: UITableView, cellName: String){
        view.addSubview(listName)
        listName.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        listName.pinToView(to: view)
    }
   

 
}
extension ListReposoryViewController {
    func loadImages(dataImage: String) {
        let url = URL(string: dataImage)
            DispatchQueue.global().async { [weak self] in
                if let imageData = try? Data(contentsOf: url!) {
                    if let image = UIImage(data: imageData) {
                       self?.img = image
                    }
                }
            }
    }
}
