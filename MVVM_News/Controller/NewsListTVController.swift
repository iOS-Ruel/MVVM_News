//
//  NewsListTVController.swift
//  MVVM_News
//
//  Created by Chung Wussup on 1/23/24.
//

import UIKit

class NewsListTVController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=545c05faad584dfca30d49bc089dacf5")!
        NewsService().getArticles(url: url) { _ in
            print("newsServicew")
            
        }
    }
}
