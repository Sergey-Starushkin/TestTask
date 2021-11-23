//
//  InfoViewController.swift
//  TestTask
//
//  Created by Sergey Starushkin on 13.11.21.
//

import UIKit

class InfoViewController: UIViewController {
    
    let headerView = HeaderView().configure(isFilterHidden: true, isMenuHidden: false)
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.4941176471, green: 0.8274509804, blue: 0.1294117647, alpha: 1)
        label.text = "INFO"
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.                                                                                              It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.delegate = self
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(textLabel)
        
        titleLabel.snp.makeConstraints({
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview().offset(20)
        })
        
        textLabel.snp.makeConstraints({
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalTo(view.frame.width - 40)
            $0.bottom.equalToSuperview()
        })
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4941176471, green: 0.8274509804, blue: 0.1294117647, alpha: 1)
        view.addSubview(headerView)
        view.addSubview(scrollView)
        
        headerView.delegate = self
        
        headerView.snp.makeConstraints({
            $0.top.equalToSuperview().offset(40)
            $0.left.right.equalToSuperview()
            $0.width.equalTo(87)
        })
        
        scrollView.snp.makeConstraints({
            $0.top.equalTo(headerView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        })
    }
    
}

extension InfoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != 0 {
            scrollView.contentOffset.x = 0
        }
    }
}

extension InfoViewController: HeaderDelegate {
    func tappedFilterButton() {
    }
    
    func tappedMenuButton() {
        let vc = MenuViewController()
        vc.startVC(vc: "info")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
