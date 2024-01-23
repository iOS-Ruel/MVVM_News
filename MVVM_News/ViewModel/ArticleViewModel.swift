//
//  ArticleViewModel.swift
//  MVVM_News
//
//  Created by Chung Wussup on 1/23/24.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
    
    var numberOfSection: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel {
    private let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
    
    var title: String {
        guard let title = self.article.title else { return "" }
        return title
    }
    var description: String {
        guard let description = self.article.description else { return "" }
        return description
    }
}
