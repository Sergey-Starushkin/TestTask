//
//  AddJogsViewController.swift
//  TestTask
//
//  Created by Sergey Starushkin on 13.11.21.
//

import UIKit

class AddJogsViewController: UIViewController {

    var isUpdate = false
    let moyaManager = MoyaManager()
    var id = 0
    var userId = ""
    var delegate: ModalDelegate?
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "cancel"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedExitButton), for: .touchDown)
        return button
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 30
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(tappedSaveButton), for: .touchDown)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    lazy var dateNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.font = .systemFont(ofSize: 13)
        label.textColor = .black
        return label
    }()

    lazy var speedNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Speed"
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    lazy var distanceNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Distance"
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    lazy var timeNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Time"
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    lazy var dateTF: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var distanceTF: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var timeTF: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        return textField
    }()

    lazy var speedTF: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4941176471, green: 0.8274509804, blue: 0.1294117647, alpha: 1)
        view.layer.cornerRadius = 30
        view.addSubview(cancelButton)
        view.addSubview(distanceNameLabel)
        view.addSubview(distanceTF)
        view.addSubview(timeNameLabel)
        view.addSubview(timeTF)
        view.addSubview(speedNameLabel)
        view.addSubview(speedTF)
        view.addSubview(dateNameLabel)
        view.addSubview(dateTF)
        view.addSubview(saveButton)
        
        cancelButton.snp.makeConstraints({
            $0.top.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
        })
        
        distanceNameLabel.snp.makeConstraints({
            $0.left.equalToSuperview().offset(36)
            $0.right.equalToSuperview().offset(-36)
            $0.top.equalToSuperview().offset(100)
        })
        
        distanceTF.snp.makeConstraints({
            $0.top.equalTo(distanceNameLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(35)
            $0.right.equalToSuperview().offset(-35)
            $0.height.equalTo(31)
        })
        
        timeNameLabel.snp.makeConstraints({
            $0.top.equalTo(distanceTF.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(36)
            $0.right.equalToSuperview().offset(-36)
        })
        
        timeTF.snp.makeConstraints({
            $0.top.equalTo(timeNameLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(35)
            $0.right.equalToSuperview().offset(-35)
            $0.height.equalTo(31)
        })
        
        speedNameLabel.snp.makeConstraints({
            $0.top.equalTo(timeTF.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(36)
            $0.right.equalToSuperview().offset(-36)
        })
        
        speedTF.snp.makeConstraints({
            $0.top.equalTo(speedNameLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(35)
            $0.right.equalToSuperview().offset(-35)
            $0.height.equalTo(31)
        })
        
        dateNameLabel.snp.makeConstraints({
            $0.top.equalTo(speedTF.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(36)
            $0.right.equalToSuperview().offset(-36)
        })

        dateTF.snp.makeConstraints({
            $0.top.equalTo(dateNameLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(35)
            $0.right.equalToSuperview().offset(-35)
            $0.height.equalTo(31)
        })
        
        saveButton.snp.makeConstraints({
            $0.bottom.equalToSuperview().offset(-37)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(251)
            $0.height.equalTo(60)
        })
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contentView)
        
        contentView.snp.makeConstraints({
            $0.top.equalToSuperview().offset(100)
            $0.bottom.equalToSuperview().offset(-100)
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview().offset(-30)
        })
    }
    
    func configureJogs(id: Int, userId: String, distanse: Double, time: Int, date: Int) {
        dateTF.text = "\(Date.init(timeIntervalSince1970: TimeInterval(date)))"
        speedTF.text = "15"
        distanceTF.text = "\(distanse)"
        timeTF.text = "\(time)"
        self.id  = id
        self.userId = userId
        isUpdate = true
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    @objc private func tappedExitButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func tappedSaveButton() {
        if isUpdate {
            moyaManager.updateData(id: id, userId: userId, distance: Int(distanceTF.text ?? "") ?? 0, time: Int(timeTF.text ?? "") ?? 0, date: dateTF.text ?? "", completion: { [weak self] code in
                if code == 200 {
                    self?.dismiss(animated: true, completion: nil)
                } else {
                    self?.alert(title: "Error", message: "Something went wrong", completion: nil)
                }
            })
        } else {
            moyaManager.addData(distance: Int(distanceTF.text ?? "") ?? 0, time: Int(timeTF.text ?? "") ?? 0, date: dateTF.text ?? "", completion: { [weak self] code in
                if code == 201 {
                    self?.dismiss(animated: true, completion: nil)
                } else {
                    self?.alert(title: "Error", message: "Something went wrong", completion: nil)
                }
            })
        }
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: completion)
        delegate?.closeModal()
    }
}


