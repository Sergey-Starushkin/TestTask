//
//  HeaderView.swift
//  TestTask
//
//  Created by Sergey Starushkin on 13.11.21.
//

import UIKit
import SnapKit

class HeaderView: UIView {

    weak var delegate: HeaderDelegate?

    lazy var logoIV: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.tintColor = .white
        return imageView
    }()
    
    lazy var menuButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "menu"), for: .normal)
        button.addTarget(self, action: #selector(tappedMenuButton), for: .touchDown)
        button.tintColor = .white
        return button
    }()
    
    lazy var filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedFilterButton), for: .touchDown)
        button.setImage(UIImage(named: "filter"), for: .normal)
        return button
    }()

    lazy var view: HeaderView = {
        let view = HeaderView()
        view.backgroundColor = #colorLiteral(red: 0.4941176471, green: 0.8274509804, blue: 0.1294117647, alpha: 1)
        view.addSubview(logoIV)
        view.addSubview(menuButton)
        view.addSubview(filterButton)
        
        logoIV.snp.makeConstraints({
            $0.left.equalToSuperview().offset(10)
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
        })
        
        menuButton.snp.makeConstraints({
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.right.equalToSuperview().offset(-20)
        })
        
        filterButton.snp.makeConstraints({
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.right.equalTo(menuButton.snp.left).offset(-20)
        })
        
        return view
    }()
    
    func configure(isFilterHidden: Bool, isMenuHidden: Bool) -> HeaderView {
        filterButton.isHidden = isFilterHidden
        menuButton.isHidden = isMenuHidden
        return view
    }
    
    @objc private func tappedFilterButton() {
        delegate?.tappedFilterButton()
    }
    
    @objc private func tappedMenuButton() {
        delegate?.tappedMenuButton()
    }
}
