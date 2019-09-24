import Foundation


public enum CCErrors: Error {
    case invalidAPIKey
    case unkownError
    case badURL
}


public class CryptoControlApi  {
    var apiKey: String
    let host: String = "https://cryptocontrol.io/api/v1/public"
    let userAgent: String = "CryptoControl Java API v1.1.0"


    public init(apiKey: String) {
        self.apiKey = apiKey
    }


    private func _fetch(path: String, _ mainCompletionHandler: @escaping (_ error: CCErrors?, _ json: Any?) -> Void) {
        let url = self.host + path

        if let url = URL(string: url) {
            var request = URLRequest(url: url)
            // Set headers
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue(self.apiKey, forHTTPHeaderField: "x-api-key")

            let completionHandler = {(data: Data?, response: URLResponse?, error: Error?) -> Void in
                if (error != nil) {
                    mainCompletionHandler(CCErrors.unkownError, nil)
                    return
                }

                if let httpResponse = response as? HTTPURLResponse {
                    switch (httpResponse.statusCode) {
                    case 401:
                        mainCompletionHandler(CCErrors.invalidAPIKey, nil)
                        return

                    case 200:
                        let json = try? JSONSerialization.jsonObject(with: data!, options: [])
                        mainCompletionHandler(nil, json)
                        return

                    default:
                        mainCompletionHandler(CCErrors.unkownError, nil)
                        return
                    }
                }
            }

            URLSession.shared.dataTask(with: request, completionHandler: completionHandler).resume()
        } else {
            mainCompletionHandler(CCErrors.badURL, nil)
        }
    }


    public func getTopNews (completion: @escaping (_ error: CCErrors?, _ articles: [CCArticle]?) -> Void) {
        self._fetch(path: "/news") { (error, json) in
            if (error != nil) {
                completion(error, nil)
                return
            }

            let articlesJson = json as! [NSObject]

            var articles: [CCArticle] = []
            for articleJson in articlesJson {
                articles.append(CCArticle(data: articleJson))
            }

            completion(nil, articles)
        }
    }


    public func getLatestNews (completion: @escaping (_ error: CCErrors?, _ articles: [CCArticle]?) -> Void) {
        self._fetch(path: "/news?latest=true") { (error, json) in
            if (error != nil) {
                completion(error, nil)
                return
            }

            let articlesJson = json as! [NSObject]

            var articles: [CCArticle] = []
            for articleJson in articlesJson {
                articles.append(CCArticle(data: articleJson))
            }

            completion(nil, articles)
        }
    }


    public func getTopNewsByCategory (completion: @escaping (_ error: CCErrors?, _ categories: CCCategories?) -> Void) {
        self._fetch(path: "/news/category") { (error, json) in
            if (error != nil) {
                completion(error, nil)
                return
            }

            let categoryJson = json as! NSObject
            completion(nil, CCCategories(data: categoryJson))
        }
    }


    public func getTopNewsByCoin (coin: String, completion: @escaping (_ error: CCErrors?, _ articles: [CCArticle]?) -> Void) {
        self._fetch(path: "/news/coin/\(coin)") { (error, json) in
            if (error != nil) {
                completion(error, nil)
                return
            }

            let articlesJson = json as! [NSObject]

            var articles: [CCArticle] = []
            for articleJson in articlesJson {
                articles.append(CCArticle(data: articleJson))
            }

            completion(nil, articles)
        }
    }


    public func  getLatestNewsByCoin (coin: String, completion: @escaping (_ error: CCErrors?, _ articles: [CCArticle]?) -> Void) {
        self._fetch(path: "/news/coin/\(coin)?latest=true") { (error, json) in
            if (error != nil) {
                completion(error, nil)
                return
            }

            let articlesJson = json as! [NSObject]

            var articles: [CCArticle] = []
            for articleJson in articlesJson {
                articles.append(CCArticle(data: articleJson))
            }

            completion(nil, articles)
        }
    }


    public func getTopNewsByCoinCategory (coin: String, completion: @escaping (_ error: CCErrors?, _ categories: CCCategories?) -> Void) {
        self._fetch(path: "/news/coin/\(coin)/category") { (error, json) in
            if (error != nil) {
                completion(error, nil)
                return
            }

            let categoryJson = json as! NSObject
            completion(nil, CCCategories(data: categoryJson))
        }
    }


    public func  getTopRedditPostsByCoin (coin: String, completion: @escaping (_ error: CCErrors?, _ redditItems: [CCRedditItem]?) -> Void) {
        self._fetch(path: "/reddit/coin/\(coin)") { (error, json) in
            if (error != nil) {
                completion(error, nil)
                return
            }

            let itemsJson = json as! [NSObject]

            var items: [CCRedditItem] = []
            for itemsJson in itemsJson {
                items.append(CCRedditItem(data: itemsJson))
            }

            completion(nil, items)
        }
    }


    public func  getLatestRedditPostsByCoin  (coin: String, completion: @escaping (_ error: CCErrors?, _ redditItems: [CCRedditItem]?) -> Void) {
        self._fetch(path: "/reddit/coin/\(coin)?latest-true") { (error, json) in
            if (error != nil) {
                completion(error, nil)
                return
            }

            let itemsJson = json as! [NSObject]

            var items: [CCRedditItem] = []
            for itemsJson in itemsJson {
                items.append(CCRedditItem(data: itemsJson))
            }

            completion(nil, items)
        }
    }


    public func  getTopTweetsByCoin (coin: String, completion: @escaping (_ error: CCErrors?, _ tweets: [CCTweet]?) -> Void) {
        self._fetch(path: "/tweets/coin/\(coin)") { (error, json) in
            if (error != nil) {
                completion(error, nil)
                return
            }

            let itemsJson = json as! [NSObject]

            var items: [CCTweet] = []
            for itemsJson in itemsJson {
                items.append(CCTweet(data: itemsJson))
            }

            completion(nil, items)
        }
    }


    public func  getLatestTweetsByCoin (coin: String, completion: @escaping (_ error: CCErrors?, _ tweets: [CCTweet]?) -> Void) {
        self._fetch(path: "/tweets/coin/\(coin)?latest=true") { (error, json) in
            if (error != nil) {
                completion(error, nil)
                return
            }

            let itemsJson = json as! [NSObject]

            var items: [CCTweet] = []
            for itemsJson in itemsJson {
                items.append(CCTweet(data: itemsJson))
            }

            completion(nil, items)
        }
    }


    public func  getTopFeedByCoin (coin: String, completion: @escaping (_ error: CCErrors?, _ tweets: [CCFeed]?) -> Void) {
        self._fetch(path: "/feed/coin/\(coin)") { (error, json) in
            if (error != nil) {
                completion(error, nil)
                return
            }

            let itemsJson = json as! [NSObject]

            var items: [CCFeed] = []
            for itemsJson in itemsJson {
                items.append(CCFeed(data: itemsJson))
            }

            completion(nil, items)
        }
    }


    public func  getLatestFeedByCoin (coin: String, completion: @escaping (_ error: CCErrors?, _ tweets: [CCFeed]?) -> Void) {
        self._fetch(path: "/feed/coin/\(coin)?latest=true") { (error, json) in
            if (error != nil) {
                completion(error, nil)
                return
            }

            let itemsJson = json as! [NSObject]

            var items: [CCFeed] = []
            for itemsJson in itemsJson {
                items.append(CCFeed(data: itemsJson))
            }

            completion(nil, items)
        }
    }
}
