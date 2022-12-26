//
//  BodyOneLabel.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import UIKit

final class BodyOneLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        font = .roboto(type: .regular, size: .body1)
        textColor = .bodyOneLabel()
        numberOfLines = 0
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: Configurable -> Populate Data ViewModel

extension BodyOneLabel: Configurable {
    typealias Configuration = BodyOneLabelContent
    
    struct BodyOneLabelContent {
        let bodyOneText: String
        let textAlignment: NSTextAlignment
        let textColor: UIColor
        let font: UIFont?
        
        init(bodyOneText: String, textAlignment: NSTextAlignment, textColor: UIColor, font: UIFont? = nil) {
            self.bodyOneText = bodyOneText
            self.textAlignment = textAlignment
            self.textColor = textColor
            self.font = font
        }
    }
    
    func configure(content: BodyOneLabelContent) {
        text = content.bodyOneText
        textAlignment = content.textAlignment
        textColor = content.textColor
        font = content.font
     }
}

