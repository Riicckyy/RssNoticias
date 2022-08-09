//
//  FeedDetailView.swift
//  RssNoticias
//
//  Created by Henrique Rossi on 03/08/22.
//

import UIKit
import WebKit

class FeedDetailView: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    //MARK:- Properties
    var webView: WKWebView!
    var currentFeed: RSSItem?
    
    //MARK:- Methods
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = currentFeed?.title
        loadView()
        let myURL = URL(string: currentFeed?.link ?? "https://g1.globo.com/rss/g1/carros")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        webView.allowsBackForwardNavigationGestures = true
    }
    
    // MARK: - Table view data source
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Spinner.stop()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        Spinner.start(from: self.view)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        Spinner.stop()
    }
}
