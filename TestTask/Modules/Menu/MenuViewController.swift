//
//  MenuViewController.swift
//  TestTask
//
//  Created by Sergey Starushkin on 13.11.21.
//

import UIKit

class MenuViewController: UIViewController {

    lazy var logoIV: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.tintColor = #colorLiteral(red: 0.4941176471, green: 0.8274509804, blue: 0.1294117647, alpha: 1)
        return imageView
    }()
    
    lazy var exitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "cancel"), for: .normal)
        button.addTarget(self, action: #selector(tappedExitButton), for: .touchDown)
        button.tintColor = .lightGray
        return button
    }()
    
    lazy var jogsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("JOGS", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(tappedJogsButton), for: .touchDown)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        return button
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("INFO", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(tappedInfoButton), for: .touchDown)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        return button
    }()
    
    lazy var contactButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CONTACT US", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(tappedContactButton), for: .touchDown)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        return button
    }()
    
    func startVC(vc: String){
        if vc == "info"{
            infoButton.setTitleColor(.green, for: .normal)
        } else if vc == "contact" {
            contactButton.setTitleColor(.green, for: .normal)
        } else {
            jogsButton.setTitleColor(.green, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(logoIV)
        view.addSubview(exitButton)
        view.addSubview(jogsButton)
        view.addSubview(infoButton)
        view.addSubview(contactButton)
        
        logoIV.snp.makeConstraints({
            $0.top.equalToSuperview().offset(50)
            $0.left.equalToSuperview().offset(20)
        })
        
        exitButton.snp.makeConstraints({
            $0.right.equalToSuperview().offset(-20)
            $0.centerY.equalTo(logoIV.snp.centerY)
        })
        
        jogsButton.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(250)
        })
        
        infoButton.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.top.equalTo(jogsButton.snp.bottom).offset(10)
        })
        
        contactButton.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.top.equalTo(infoButton.snp.bottom).offset(10)
        })
    }
    
    @objc private func tappedContactButton() {
        selectVC(vc: ContactViewController())
    }

    @objc private func tappedInfoButton() {
        selectVC(vc: InfoViewController())
    }
    
    @objc private func tappedJogsButton() {
        selectVC(vc: MainViewController())
    }
    
    @objc private func tappedExitButton() {
        navigationController?.popViewController(animated: true)
    }
}
