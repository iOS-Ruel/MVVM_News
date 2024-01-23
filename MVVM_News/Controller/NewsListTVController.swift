//
//  NewsListTVController.swift
//  MVVM_News
//
//  Created by Chung Wussup on 1/23/24.
//

import UIKit

class NewsListTVController: UITableViewController {
    
    private var aritcleListViewModel: ArticleListViewModel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        tableView.delegate = self
        
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=545c05faad584dfca30d49bc089dacf5")!
        NewsService().getArticles(url: url) { articles in
            
            if let articles = articles {
                self.aritcleListViewModel = ArticleListViewModel(articles: articles)
            
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.aritcleListViewModel == nil ? 0 : self.aritcleListViewModel.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.aritcleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTVCell", for: indexPath) as? ArticleTVCell else {
            fatalError("ArticleTVCell not found")
        }
        
        let articleViewModel = self.aritcleListViewModel.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleViewModel.title
        cell.descriptionLabel.text = articleViewModel.description
        
        return cell
                
    }
    
}
