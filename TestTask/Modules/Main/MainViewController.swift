//
//  ViewController.swift
//  TestTask
//
//  Created by Sergey Starushkin on 13.11.21.
//

import UIKit

class MainViewController: UIViewController {
    let headerView = HeaderView().configure(isFilterHidden: false, isMenuHidden: false)
    let moyaManager = MoyaManager()
    var jogsModel = JogsResponseModel()
    let vc = AddJogsViewController()
    var index = 0
    
    lazy var createButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderColor = #colorLiteral(red: 0.9137254902, green: 0.5647058824, blue: 0.9764705882, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 30
        button.setTitle("Create your jog first", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.9137254902, green: 0.5647058824, blue: 0.9764705882, alpha: 1), for: .normal)
        return button
    }()
    
    lazy var dateFromLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .darkGray
        label.text = "Date from"
        return label
    }()
    
    lazy var dateToLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .darkGray
        label.text = "Date to"
        return label
    }()
    
    lazy var dateFromTF: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        return textField
    }()

    lazy var dateToTF: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var findView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
        view.addSubview(dateFromLabel)
        view.addSubview(dateToLabel)
        view.addSubview(dateFromTF)
        view.addSubview(dateToTF)
        
        dateFromLabel.snp.makeConstraints({
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
        })
        
        dateFromTF.snp.makeConstraints({
            $0.centerY.equalToSuperview()
            $0.left.equalTo(dateFromLabel.snp.right).offset(10)
            $0.width.equalTo(72)
            $0.height.equalTo(31)
        })
        
        dateToLabel.snp.makeConstraints({
            $0.centerY.equalToSuperview()
            $0.left.equalTo(dateFromTF.snp.right).offset(50)
        })

        dateToTF.snp.makeConstraints({
            $0.centerY.equalToSuperview()
            $0.left.equalTo(dateToLabel.snp.right).offset(10)
            $0.width.equalTo(72)
            $0.height.equalTo(31)
        })

        
        return view
    }()
    
    lazy var noTraningIV: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "sadRoundedSquareEmoticon"))
        return imageView
    }()
    
    lazy var noTraningLabel: UILabel = {
        let label = UILabel()
        label.text = "Nothing is there"
        label.textColor = .lightGray
        return label
    }()
    
    lazy var noTraningView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(noTraningIV)
        view.addSubview(noTraningLabel)
        view.addSubview(createButton)
        dateToTF.delegate = self
        dateFromTF.delegate = self
        noTraningIV.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-100)
        })
        
        noTraningLabel.snp.makeConstraints({
            $0.centerX.equalToSuperview()
            $0.top.equalTo(noTraningIV.snp.bottom).offset(20)
        })
        
        createButton.snp.makeConstraints({
            $0.bottom.equalToSuperview().offset(-40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(251)
            $0.height.equalTo(60)
        })
        
        return view
    }()
    
    lazy var jogsTV: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.allowsSelection.toggle()
        table.backgroundColor = .clear
        table.register(JogsTableViewCell.self, forCellReuseIdentifier: JogsTableViewCell.identifier)
        table.backgroundColor = .clear
        table.allowsSelection = true
        return table
    }()
    
    lazy var floatButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "add"), for: .normal)
        button.addTarget(self, action: #selector(tappedAddButton), for: .touchDown)
        button.tintColor = #colorLiteral(red: 0.4941176471, green: 0.8274509804, blue: 0.1294117647, alpha: 1)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(noTraningView)
        view.addSubview(jogsTV)
        
        
        noTraningView.snp.makeConstraints({
            $0.left.right.top.bottom.equalToSuperview()
        })
        
        jogsTV.snp.makeConstraints({
            $0.left.right.top.bottom.equalToSuperview()
        })
        
        return view
    }()
    
    lazy var mainSV: UIStackView = {
        let stackView = UIStackView()
        stackView.addSubview(contentView)
        stackView.addSubview(noTraningView)
        stackView.addSubview(findView)
        stackView.axis = .vertical

        contentView.snp.makeConstraints({
            $0.width.equalToSuperview()
            $0.height.equalToSuperview().offset(70)
        })
        
        findView.snp.makeConstraints({
            $0.width.equalToSuperview()
            $0.height.equalTo(70)
        })
        
        noTraningView.snp.makeConstraints({
            $0.width.equalToSuperview()
            $0.height.equalToSuperview().offset(70)
        })
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4941176471, green: 0.8274509804, blue: 0.1294117647, alpha: 1)
        view.addSubview(headerView)
        view.addSubview(mainSV)
        view.addSubview(floatButton)
        
        vc.delegate = self
        findView.isHidden = true
        noTraningView.isHidden = true
        headerView.delegate = self
        
        headerView.snp.makeConstraints({
            $0.top.equalToSuperview().offset(40)
            $0.left.right.equalToSuperview()
            $0.width.equalTo(87)
        })
        
        mainSV.snp.makeConstraints({
            $0.top.equalTo(headerView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        })
        
        floatButton.snp.makeConstraints({
            $0.bottom.equalToSuperview().offset(-20)
            $0.right.equalToSuperview().offset(-20)
        })
        configure()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configure()
    }
    
    @objc private func tappedAddButton() {
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
    func configure() {
        moyaManager.sync(completion: { [weak self] statusCode, model in
            if statusCode == 200 {
                self?.jogsModel = model ?? JogsResponseModel()
                self?.jogsTV.reloadData()
            }
        })
    }

    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }

    func startFilterData() {
        if (dateFromTF.text ?? "") != "" && (dateToTF.text ?? "") == "" {
            index = 1
            jogsTV.reloadData()
        } else if (dateFromTF.text ?? "") == "" && (dateToTF.text ?? "") != "" {
            index = 2
            jogsTV.reloadData()
        } else if (dateFromTF.text ?? "") != "" && (dateToTF.text ?? "") != "" {
            index = 3
            jogsTV.reloadData()
        } else {
            index = 0
            jogsTV.reloadData()
        }
    }
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jogsModel.response.jogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        let cell = tableView.dequeueReusableCell(withIdentifier: JogsTableViewCell.identifier, for: indexPath) as! JogsTableViewCell
        if index == 0 {
            print("i \(1)")
            cell.configure(distance: jogsModel.response.jogs[indexPath.row].distance, time: jogsModel.response.jogs[indexPath.row].time, date: jogsModel.response.jogs[indexPath.row].date, speed: "15")
        } else if index == 1 {
            print("i \(2)")
            let date = dateFormatter.date(from: dateFromTF.text ?? "") ?? Date()
            if Int(Date().timeIntervalSince(date)) <= jogsModel.response.jogs[indexPath.row].date {
                cell.configure(distance: jogsModel.response.jogs[indexPath.row].distance, time: jogsModel.response.jogs[indexPath.row].time, date: jogsModel.response.jogs[indexPath.row].date, speed: "15")
            }
        } else if index == 2 {
            print("i \(3)")
            let date = dateFormatter.date(from: dateToTF.text ?? "") ?? Date()
            if Int(Date().timeIntervalSince(date)) >= jogsModel.response.jogs[indexPath.row].date {
                cell.configure(distance: jogsModel.response.jogs[indexPath.row].distance, time: jogsModel.response.jogs[indexPath.row].time, date: jogsModel.response.jogs[indexPath.row].date, speed: "15")
            }
        } else if index == 3 {
            print("i \(4)")
            let date = dateFormatter.date(from: dateFromTF.text ?? "") ?? Date()
            let dateTo = dateFormatter.date(from: dateToTF.text ?? "") ?? Date()
            if Int(Date().timeIntervalSince(date)) <= jogsModel.response.jogs[indexPath.row].date && Int(Date().timeIntervalSince(dateTo)) >= jogsModel.response.jogs[indexPath.row].date {
                cell.configure(distance: jogsModel.response.jogs[indexPath.row].distance, time: jogsModel.response.jogs[indexPath.row].time, date: jogsModel.response.jogs[indexPath.row].date, speed: "15")
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vc.configureJogs(id: jogsModel.response.jogs[indexPath.row].id, userId: jogsModel.response.jogs[indexPath.row].user_id, distanse: jogsModel.response.jogs[indexPath.row].distance, time: jogsModel.response.jogs[indexPath.row].time, date: jogsModel.response.jogs[indexPath.row].date)
        navigationController?.present(vc, animated: true, completion: nil)
    }
}

extension MainViewController: HeaderDelegate {
    func tappedFilterButton() {
        if findView.isHidden == true {
            findView.isHidden = false
        } else {
            findView.isHidden = true
        }
    }
    
    func tappedMenuButton() {
        let vc = MenuViewController()
        vc.startVC(vc: "jogs")
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainViewController: ModalDelegate {
    func closeModal() {
        configure()
    }
}

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        startFilterData()
        return true
    }
}
