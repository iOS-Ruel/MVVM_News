//
//  NewsService.swift
//  MVVM_News
//
//  Created by Chung Wussup on 1/23/24.
//

import Foundation


class NewsService {
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                
            }
        }.resume()
    }
    
}
