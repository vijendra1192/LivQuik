//
//  DashboardVC.swift
//  LivQuik
//
//  Created by Vijendra Yadav on 10/12/2019.
//  Copyright © 2019 Vijendra Yadav. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var tvNews: UITableView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    // MARK: Variables
    var presenter: DashboardPresenterProtocol?
    private var articles: [Articles] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setupIndicatorView()
        presenter?.viewDidLoad()
    }
    
    private func setUpTableView() {
        tvNews.register(UINib(nibName: "DashboardTVCell", bundle: nil), forCellReuseIdentifier: "DashboardTVCell")
        tvNews.delegate = self
        tvNews.dataSource = self
        tvNews.isHidden = false
    }
    
    private func setupIndicatorView() {
        indicatorView.tintColor = UIColor.blue
        indicatorView.startAnimating()
    }
}

extension DashboardVC: DashboardVCProtocol {
    func showNewsData(data: [Articles]) {
        self.articles = data
        showFooterView(isHidden: true)
        tvNews.reloadData()
    }
    
    func showFooterView(isHidden: Bool) {
        indicatorView.stopAnimating()
        footerView.isHidden = isHidden
    }
}

extension DashboardVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter?.willDisplayCell(at: indexPath.row)
    }
}

extension DashboardVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardTVCell", for: indexPath) as? DashboardTVCell
        
        cell?.article = articles[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
