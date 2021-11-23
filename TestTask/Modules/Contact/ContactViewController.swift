//
//  ContactViewController.swift
//  TestTask
//
//  Created by Sergey Starushkin on 20.11.21.
//

import UIKit

class ContactViewController: UIViewController {

    let moyaManager = MoyaManager()
    let headerView = HeaderView().configure(isFilterHidden: true, isMenuHidden: false)
    
    lazy var topicLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Topic"
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Text"
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    lazy var topicTF: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var textTV: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 1
        textView.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        textView.layer.cornerRadius = 10
        textView.backgroundColor = .white
        return textView
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 30
        button.setTitle("Send", for: .normal)
        button.addTarget(self, action: #selector(tappedSebdButton), for: .touchDown)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    lazy var windowView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4941176471, green: 0.8274509804, blue: 0.1294117647, alpha: 1)
        view.layer.cornerRadius = 30
        view.addSubview(textTV)
        view.addSubview(textLabel)
        view.addSubview(topicTF)
        view.addSubview(topicLabel)
        view.addSubview(sendButton)
        
        topicLabel.snp.makeConstraints({
            $0.top.equalToSuperview().offset(40)
            $0.left.equalToSuperview().offset(20)
        })
        
        topicTF.snp.makeConstraints({
            $0.top.equalTo(topicLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(35)
            $0.right.equalToSuperview().offset(-35)
            $0.height.equalTo(31)
        })
        
        textLabel.snp.makeConstraints({
            $0.top.equalTo(topicTF.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
        })
        
        textTV.snp.makeConstraints({
            $0.top.equalTo(textLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(35)
            $0.right.equalToSuperview().offset(-35)
            $0.height.equalTo(self.view.frame.height * 0.3)
        })
        
        sendButton.snp.makeConstraints({
            $0.bottom.equalToSuperview().offset(-37)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(251)
            $0.height.equalTo(60)
        })
        
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(windowView)
        windowView.snp.makeConstraints({
            $0.top.equalToSuperview().offset(100)
            $0.bottom.equalToSuperview().offset(-100)
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview().offset(-30)
        })
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4941176471, green: 0.8274509804, blue: 0.1294117647, alpha: 1)
        view.addSubview(headerView)
        view.addSubview(contentView)
        
        
        headerView.delegate = self
        headerView.snp.makeConstraints({
            $0.top.equalToSuperview().offset(40)
            $0.left.right.equalToSuperview()
            $0.width.equalTo(87)
        })
        
        contentView.snp.makeConstraints({
            $0.bottom.left.right.equalToSuperview()
            $0.top.equalTo(headerView.snp.bottom)
        })
        
    }
    
    @objc private func tappedSebdButton() {
        moyaManager.sendFeedback(topic: Int(topicTF.text ?? "") ?? 1, text: textTV.text, completion: { [weak self] code in
            if code == 201 {
                self?.alert(title: "Successfully", message: "Your feedback is important to us.", completion: nil)
            } else {
                self?.alert(title: "Sory", message: "Something went wrong", completion: nil)
            }
        })
    }
}

//MARK: - HeaderDelegate
extension ContactViewController: HeaderDelegate {
    func tappedFilterButton() {
    }
    
    func tappedMenuButton() {
        let vc = MenuViewController()
        vc.startVC(vc: "contact")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
