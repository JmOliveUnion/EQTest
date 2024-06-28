////
////  TopTitleTableViewCell.swift
////  EQTest
////
////  Created by 김민종 on 6/28/24.
////
//
//import UIKit
//import SnapKit
//import Then
//
//class TopTitleTableViewCell: UITableViewCell {
//    
//    let titleLabel = UILabel().then {
//        $0.text = "프리셋"
//        $0.font = .boldSystemFont(ofSize: 18)
//    }
//    
//    let underView = UIView().then {
//        $0.backgroundColor = .lightGray
//    }
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        // Initialize and configure the label
//        self.selectionStyle = .none
//        
//        contentView.addSubview(titleLabel)
//        contentView.addSubview(underView)
//        
//        titleLabel.snp.makeConstraints {
//            $0.centerY.equalToSuperview()
//            $0.leading.equalToSuperview().offset(20)
//        }
//        
//        underView.snp.makeConstraints {
//            $0.height.equalTo(1)
//            $0.leading.trailing.equalToSuperview()
//            $0.bottom.equalToSuperview()
////            $0.top.equalTo(titleLabel.snp.bottom).offset(22)
//        }
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
