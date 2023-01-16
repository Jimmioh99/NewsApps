//
//  NewsArticlesTableCell.swift
//  NewsApps
//
//  Created by Jimmi on 13/01/23.
//

import UIKit
import Kingfisher

final class NewsArticlesTableCell: UITableViewCell {
    
    private lazy var iconImg: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var nameView: UIView = UIView()
    
    private lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var contentLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: NewsArticlesMediaModel) {
        if let urlToImage = model.urlToImage, let url = URL(string: urlToImage) {
            iconImg.kf.setImage(with: url)
        } else {
            iconImg.image = UIImage(named: "ic_no_photo")
        }
        
        titleLbl.text = model.title
        contentLbl.text = model.content
    }
    
    func setupCell(image: UIImage?, title: String, content: String) {
        iconImg.image = image
        titleLbl.text = title
        contentLbl.text = content
    }
    
    private func setupConstraints() {
        
        contentView.setupSubviews([iconImg, nameView])
        nameView.setupSubviews([titleLbl, contentLbl])
        
        iconImg.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).offset(-10)
            make.width.height.equalTo(UIScreen.main.bounds.width / 4)
        }
        
        nameView.snp.makeConstraints { make in
            make.leading.equalTo(iconImg.snp.trailing).offset(10)
            make.centerY.equalTo(iconImg)
            make.trailing.equalTo(contentView).offset(-10)
        }
        
        titleLbl.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(nameView)
        }
        
        contentLbl.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalTo(nameView)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
