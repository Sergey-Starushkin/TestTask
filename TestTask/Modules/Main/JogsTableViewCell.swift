//
//  TableViewCell.swift
//  TestTask
//
//  Created by Sergey Starushkin on 13.11.21.
//

import UIKit

class JogsTableViewCell: UITableViewCell {
    static let identifier: String = "JogsTableViewCell"
    
    lazy var jogsIV: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "icon"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "20.12.2017"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()

    lazy var speedNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Speed:"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    lazy var distanceNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Distance:"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    lazy var timeNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Time:"
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    lazy var speedLabel: UILabel = {
        let label = UILabel()
        label.text = "15"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    lazy var distanceLabel: UILabel = {
        let label = UILabel()
        label.text = "10 km"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "60 min"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    lazy var statisticView: UIView = {
        let view = UIView()
        view.addSubview(dateLabel)
        view.addSubview(speedNameLabel)
        view.addSubview(speedLabel)
        view.addSubview(distanceNameLabel)
        view.addSubview(distanceLabel)
        view.addSubview(timeNameLabel)
        view.addSubview(timeLabel)
        
        dateLabel.snp.makeConstraints({
            $0.left.equalToSuperview().offset(46)
            $0.top.equalToSuperview().offset(40)
        })
        
        speedNameLabel.snp.makeConstraints({
            $0.left.equalToSuperview().offset(46)
            $0.top.equalTo(dateLabel.snp.bottom).offset(10)
        })
        
        distanceNameLabel.snp.makeConstraints({
            $0.left.equalToSuperview().offset(46)
            $0.top.equalTo(speedNameLabel.snp.bottom).offset(10)
        })
        
        timeNameLabel.snp.makeConstraints({
            $0.left.equalToSuperview().offset(46)
            $0.top.equalTo(distanceNameLabel.snp.bottom).offset(10)
        })
        
        speedLabel.snp.makeConstraints({
            $0.centerY.equalTo(speedNameLabel.snp.centerY)
            $0.left.equalTo(speedNameLabel.snp.right).offset(5)
        })

        distanceLabel.snp.makeConstraints({
            $0.centerY.equalTo(distanceNameLabel.snp.centerY)
            $0.left.equalTo(distanceNameLabel.snp.right).offset(5)
        })
        
        timeLabel.snp.makeConstraints({
            $0.centerY.equalTo(timeNameLabel.snp.centerY)
            $0.left.equalTo(timeNameLabel.snp.right).offset(5)
        })
        
        return view
    }()
    
    
    
    func configure(distance: Double, time: Int, date: Int, speed: String) {
        contentView.addSubview(statisticView)
        contentView.addSubview(jogsIV)
        
        distanceLabel.text = "\(distance)"
        timeLabel.text = "\(time)"
        dateLabel.text = "\(Date.init(timeIntervalSince1970: TimeInterval(date)))"
        speedLabel.text = speed
        
        statisticView.snp.makeConstraints({
            $0.top.bottom.right.equalToSuperview()
            $0.width.equalTo(contentView.bounds.width * 0.6)
            $0.height.equalTo(200)
        })
        
        jogsIV.snp.makeConstraints({
            $0.width.height.equalTo(87)
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview().offset(-contentView.bounds.width * 0.25)
        })
        
        
        
    }
    
}
