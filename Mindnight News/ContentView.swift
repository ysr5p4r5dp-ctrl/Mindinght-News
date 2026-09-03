//
//  ContentView.swift
//  Mindnight News
//
//  Created by Claudio Vicario on 01/09/26.
//

import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        WebView(
            url: URL(string: "https://gratis-5224975.webadorsite.com")!
        )
        .ignoresSafeArea()
    }
}

struct WebView: UIViewRepresentable {

    let url: URL

    func makeUIView(context: Context) -> WKWebView {

        let configuration = WKWebViewConfiguration()

        let webView = WKWebView(
            frame: .zero,
            configuration: configuration
        )

        webView.allowsBackForwardNavigationGestures = true
        webView.allowsLinkPreview = false

        webView.customUserAgent =
            "Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) " +
            "AppleWebKit/605.1.15 (KHTML, like Gecko) " +
            "Version/16.0 Mobile/15E148 Safari/604.1"

        let request = URLRequest(
            url: url,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 30
        )

        webView.load(request)

        return webView
    }

    func updateUIView(
        _ webView: WKWebView,
        context: Context
    ) {
        // Evitiamo di ricaricare il sito
        // ad ogni aggiornamento della View.
    }
}

#Preview {
    ContentView()
}
