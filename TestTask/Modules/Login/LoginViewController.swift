//
//  LoginViewController.swift
//  TestTask
//
//  Created by Sergey Starushkin on 13.11.21.
//

import UIKit

class LoginViewController: UIViewController {

    let headerView = HeaderView().configure(isFilterHidden: true, isMenuHidden: true)
    let moyaManager = MoyaManager()
    
    lazy var letMeButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderColor = #colorLiteral(red: 0.9137254902, green: 0.5647058824, blue: 0.9764705882, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 30
        button.setTitle("Let me in", for: .normal)
        button.addTarget(self, action: #selector(tappedLetMeButton), for: .touchDown)
        button.setTitleColor(#colorLiteral(red: 0.9137254902, green: 0.5647058824, blue: 0.9764705882, alpha: 1), for: .normal)
        return button
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(logoImageView)
        view.addSubview(letMeButton)
        
        logoImageView.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-100)
        })
        
        letMeButton.snp.makeConstraints({
            $0.top.equalTo(logoImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(151)
            $0.height.equalTo(60)
        })
        
        return view
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bearFace"))
        imageView.tintColor = #colorLiteral(red: 0.9137254902, green: 0.5647058824, blue: 0.9764705882, alpha: 1)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4941176471, green: 0.8274509804, blue: 0.1294117647, alpha: 1)
        view.addSubview(headerView)
        view.addSubview(contentView)
        
        headerView.snp.makeConstraints({
            $0.top.equalToSuperview().offset(40)
            $0.left.right.equalToSuperview()
            $0.width.equalTo(87)
        })
        
        contentView.snp.makeConstraints({
            $0.top.equalTo(headerView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        })
    }
    
    @objc private func tappedLetMeButton() {
        moyaManager.login(completion: { [weak self]code, model in
            if code == 201 {
                self?.navigationController?.pushViewController(MainViewController(), animated: true)
            }
        })
    }
}
