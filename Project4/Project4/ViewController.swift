//
//  ViewController.swift
//  Project4
//
//  Created by erika.talberga on 01/02/2024.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var progressView: UIProgressView!
    var websites = ["apple.com", "hackingwithswift.com", "lsm.lv"]
    var selectedWebsite: String?
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let websiteToLoad = selectedWebsite ?? websites[0]
        let url = URL(string: "https://" + websiteToLoad)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        
        let progressButton = UIBarButtonItem(customView: progressView)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        let back = UIBarButtonItem(title: "Back", style: .plain, target: webView, action: #selector(webView.goBack))
        let forward = UIBarButtonItem(title: "Forward", style: .plain, target: webView, action: #selector(webView.goForward))
        
        toolbarItems = [back, progressButton, spacer, refresh, forward]
        navigationController?.isToolbarHidden = false
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    @objc func openTapped() {
        let tableViewController = TableTableViewController()
        tableViewController.websites = websites
        navigationController?.pushViewController(tableViewController, animated: true)
    }
    
    func openPage(urlString: String) {
        if let url = URL(string: "https://" + urlString), let webView = webView {
            webView.load(URLRequest(url: url))
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url {
            if let host = url.host {
            for website in websites {
                if host.contains(website) {
                    decisionHandler(.allow)
                    return
                }
            }
        }
            decisionHandler(.cancel)
            let alertController = UIAlertController(title: "This website is blocked", message: nil, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alertController, animated: true)
        }
    }


}

