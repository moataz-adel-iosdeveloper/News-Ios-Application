//
//  NewsListCell.swift
//  NewsApplication
//
//  Created by ModyMayaAser on 07/03/2022.
//

import UIKit

class NewsListCell: UITableViewCell {
    
    @IBOutlet weak var imgNews: UIImageView!
    
    @IBOutlet weak var lblTittle: UILabel!
    
    @IBOutlet weak var lblShortDescription: UILabel!
    
    var viewModel: NewsListCellViewModel?
    
    func setCell(viewModel : NewsListCellViewModel) {
        self.viewModel = viewModel
        self.updateUI()
    }

    private func updateUI() {
        self.lblTittle.text = viewModel?.titleText
        self.lblShortDescription.text = viewModel?.shortDescription
        self.imgNews.DownloadImage(viewModel!.imageUrl,placeHolder: "placeholder", cornerRadius: 15)
    }

}
