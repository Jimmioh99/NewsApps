//
//  CategoryCollectionCell.swift
//  NewsApps
//
//  Created by Jimmi Oh on 15/01/23.
//

import UIKit
import SnapKit

final class CategoryCollectionCell: UICollectionViewCell {
    
    lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(data: CategoryType, isSelected: Bool = false) {
        titleLbl.textColor = isSelected ? .black : .gray
        titleLbl.text = data.rawValue.capitalized
    }
    
    private func setupConstraints() {
        
        contentView.addSubview(titleLbl)
        
        titleLbl.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).offset(-10)
            make.centerX.equalTo(contentView)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
