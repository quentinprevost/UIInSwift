//
//  CustomView.swift
//  ProViewPractice
//
//  Created by Quentin Prevost on 26/06/2018.
//  Copyright © 2018 Quentin Prevost. All rights reserved.
//

import UIKit

@objc protocol CustomViewDelegate {
    @objc func didClick(sender: UIButton)
}

final class CustomView: UIView {
    
    private weak var delegate: CustomViewDelegate?
    
    private lazy var slaveView: UIView = {
        let view = UIView()
        let width = bounds.width / 2
        let height = bounds.height / 2
        view.frame = CGRect(x: 150, y: 150, width: width, height: height)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Bonjour et bienvenue :)"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 20, y: 20, width: 150, height: 25)
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Vous êtes Quentin"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cliquez ici", for: .normal)
        button.setTitle("Clicked", for: .disabled)
        button.titleLabel?.textColor = .black
        button.backgroundColor = .red
        button.layer.borderColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        button.layer.borderWidth = 3
        button.contentHorizontalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(delegate, action: #selector(delegate?.didClick(sender:)), for: .touchUpInside)
        return button
    }()
    
    func configure(delegate: CustomViewDelegate) {
        self.delegate = delegate
    }
    
    func changeNameLabelText(with text: String) {
        nameLabel.text = text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(slaveView)
        slaveView.addSubview(welcomeLabel)
        slaveView.addSubview(nameLabel)
        addSubview(dateButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        addConstraintsToSlaveView()
        addConstraintsToWelcomeLabel()
        addConstraintsToNameLabel()
        addConstraintsToDateButton()
    }
    
    
    private func addConstraintsToWelcomeLabel() {
        guard let superview = welcomeLabel.superview else {
            return
        }
        welcomeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        welcomeLabel.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0).isActive = true
        welcomeLabel.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0).isActive = true
        welcomeLabel.topAnchor.constraint(equalTo: superview.topAnchor, constant: 0).isActive = true
    }
    
    private func addConstraintsToSlaveView() {
        slaveView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        slaveView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        slaveView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        slaveView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90).isActive = true
    }
    
    private func addConstraintsToNameLabel() {
        nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 60).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: slaveView.bottomAnchor, constant: -60).isActive = true
    }
    
    private func addConstraintsToDateButton() {
        dateButton.topAnchor.constraint(equalTo: slaveView.bottomAnchor, constant: 30).isActive = true
        dateButton.leadingAnchor.constraint(equalTo: slaveView.leadingAnchor, constant: 0).isActive = true
        dateButton.trailingAnchor.constraint(equalTo: slaveView.trailingAnchor, constant: 0).isActive = true
        dateButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
