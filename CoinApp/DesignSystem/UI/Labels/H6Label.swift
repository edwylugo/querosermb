//
//  H6Label.swift
//  CoinApp
//
//  Created by Edwy Lugo on 26/12/22.
//

import UIKit

final class H6Label: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        font = .roboto(type: .regular, size: .h6)
        textColor = .titleLabel()
        numberOfLines = 0
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: Configurable -> Populate Data ViewModel

extension H6Label: Configurable {
    typealias Configuration = H6LabelContent
    
    struct H6LabelContent {
        let h6Text: String
        let textAlignment: NSTextAlignment
        let textColor: UIColor
        
        init(h6Text: String, textAlignment: NSTextAlignment, textColor: UIColor) {
            self.h6Text = h6Text
            self.textAlignment = textAlignment
            self.textColor = textColor
        }
    }
    
    func configure(content: H6LabelContent) {
        text = content.h6Text
        textAlignment = content.textAlignment
        textColor = content.textColor
     }
}
