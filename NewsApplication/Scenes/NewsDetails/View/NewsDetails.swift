//
//  NewsDetails.swift
//  NewsApplication
//
//  Created by ModyMayaAser on 07/03/2022.
//

import UIKit

class NewsDetails: UIViewController {

    var viewModel : NewsDetailsViewModel?
    
    @IBOutlet weak var imgNews: UIImageView!
    
    @IBOutlet weak var lblNewsDate: UILabel!
    
    @IBOutlet weak var lblNewsTittle: UILabel!
    
    @IBOutlet weak var lblNewsAuthor: UILabel!
    
    @IBOutlet weak var ldlFullDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //updateUI
        updateUI()
    }

    func updateUI()  {
        guard viewModel != nil else {return}
        imgNews.DownloadImage(viewModel!.imageUrl, placeHolder: "placeholder", cornerRadius: nil)
        self.navigationItem.title = viewModel?.subSection
        self.lblNewsTittle.text = viewModel?.titleText
        self.ldlFullDescription.text = viewModel?.detailsText
        self.lblNewsAuthor.text = viewModel?.authorText
        self.lblNewsDate.text = viewModel?.dateText
    }
    

}
