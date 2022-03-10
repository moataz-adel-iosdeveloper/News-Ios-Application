//
//  NewsList+TableView.swift
//  NewsApplication
//
//  Created by ModyMayaAser on 08/03/2022.
//
import UIKit

extension NewsList : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListCell" , for: indexPath) as? NewsListCell else {
            fatalError("Cell not exists Cell")
        }
        let cellViewModel = viewModel.getCellViewModel( at: indexPath )
        cell.setCell(viewModel: cellViewModel)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        self.viewModel.SelectedArticle(at: indexPath)
        self.navigationToArticleDetails()
        return indexPath
    }
    
    func navigationToArticleDetails() {
        let vc = NewsDetails()
        vc.viewModel = viewModel.selectedArticle
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
