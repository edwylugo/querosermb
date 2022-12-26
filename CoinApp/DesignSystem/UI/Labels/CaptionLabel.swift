//
//  CaptionLabel.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import UIKit

final class CaptionLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        font = .roboto(type: .regular, size: .caption)
        textColor = .titleLabel()
        numberOfLines = 0
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: Configurable -> Populate Data ViewModel

extension CaptionLabel: Configurable {
    typealias Configuration = CaptionLabelContent
    
    struct CaptionLabelContent {
        let captionText: String
        let textAlignment: NSTextAlignment
        let textColor: UIColor

        init(captionText: String, textAlignment: NSTextAlignment, textColor: UIColor) {
            self.captionText = captionText
            self.textAlignment = textAlignment
            self.textColor = textColor
        }
    }
    
    func configure(content: CaptionLabelContent) {
        text = content.captionText
        textAlignment = content.textAlignment
        textColor = content.textColor
     }
}

