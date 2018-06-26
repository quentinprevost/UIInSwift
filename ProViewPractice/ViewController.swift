//
//  ViewController.swift
//  ProViewPractice
//
//  Created by Quentin Prevost on 26/06/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var customView: CustomView = {
        let customView = CustomView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        return customView
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customView)
        customView.configure(delegate: self)
    }
    
    private func setConstraints() {
        customView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        customView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
}

extension ViewController: CustomViewDelegate {
    @objc func didClick(sender: UIButton) {
        sender.backgroundColor = .gray
        sender.isEnabled = false
        let text = "Vous êtes quentin" + ", nous sommes le \(Date())"
        customView.changeNameLabelText(with: text)
    }
}
