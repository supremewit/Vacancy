//
//  MainView_New.swift
//  Vacancy
//
//  Created by Segaon_PC on 2017. 12. 4..
//  Copyright © 2017년 Sungwook Ahn. All rights reserved.
//

import UIKit

protocol MainViewDelegate: class {
    func ListButtonWasClicked(mainView: MainView_New, sender: UIButton!)
}

class MainView_New: UIView {
    
    
    
    
    private var searchBar: UISearchBar!
    private var resultTable: UITableView!
    private var searchButton: UIButton!
    private var listButton: UIButton!
    
    private let searchButtonHeight: CGFloat = 50
    private let searchButtonWidth: CGFloat = 230
    
    
    private let searchButtonStartingAlpha: CGFloat = 1
    private let searchButtonEndingAlpha: CGFloat = 0
    
    private let searchBarStartingAlpha: CGFloat = 0
    private let searchBarEndingAlpha: CGFloat = 1
    private let tableStartingAlpha: CGFloat = 0
    private let tableEndingAlpha: CGFloat = 1
    
    
    private let searchButtonStartingCornerRadius: CGFloat = 5
    private let searchButtonEndingCornerRadius: CGFloat = 0
    
    private var didSetupConstraints = false
    
    private var searchButtonWidthConstraint: NSLayoutConstraint?
    private var searchButtonEdgeConstraint: NSLayoutConstraint?
    
    
    weak var delegate: MainViewDelegate?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    init(searchBarDelegate: UISearchBarDelegate, tableViewDataSource: UITableViewDataSource, tableViewDelegate: UITableViewDelegate, cellIdentifier: String) {
        super.init(frame: CGRect.zero)
        setupViews()
        searchBar.delegate = searchBarDelegate
        resultTable.dataSource = tableViewDataSource
        resultTable.delegate = tableViewDelegate
        resultTable.register(StoreViewCell.self, forCellReuseIdentifier: "storeCell")
    }
    
    //Mark  - initialization
    
    func setupViews() {
        setupSearchButton()
        setupSearchBar()
        setupResultTable()
        //setupGoListButton()
    }
    
    func setupSearchBar() {
        searchBar = UISearchBar.newAutoLayout()
        searchBar.showsCancelButton = true
        searchBar.alpha = searchBarStartingAlpha
        searchBar.delegate = self
        addSubview(searchBar)
        
    }
    
    func setupSearchButton() {
        searchButton = UIButton(type: .custom)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.addTarget(self, action: #selector(searchClicked(_:)), for: .touchUpInside)
        searchButton.setTitle("이름으로 찾기", for: UIControlState.normal)
        searchButton.backgroundColor = UIColor.lightGray
        searchButton.layer.cornerRadius = searchButtonStartingCornerRadius
        addSubview(searchButton)
        
    }
    
    func setupListButton() {
        listButton = UIButton(type: .custom)
        listButton.translatesAutoresizingMaskIntoConstraints = false
        listButton.addTarget(self, action: #selector(listClicked(_:)), for: .touchUpInside)
        listButton.setTitle("리스트에서 찾기", for: UIControlState.normal)
        listButton.layer.cornerRadius = searchButtonStartingCornerRadius
        
        addSubview(listButton)
    }
    
    
    func setupResultTable() {
        resultTable = UITableView.newAutoLayout()
        resultTable.alpha = tableStartingAlpha
        addSubview(resultTable)
    }
    
    // -Mark: Layout
    
    override func updateConstraints() {
        if !didSetupConstraints {
            searchBar.autoAlignAxis(toSuperviewAxis: .vertical)
            searchBar.autoMatch(.width, to: .width, of: self)
            searchBar.autoPinEdge(toSuperviewEdge: .top)
            
            searchButton.autoSetDimension(.height, toSize: searchButtonHeight)
            searchButton.autoAlignAxis(toSuperviewAxis: .vertical)
            
            
            
            
            resultTable.autoAlignAxis(toSuperviewAxis: .vertical)
            resultTable.autoPinEdge(toSuperviewEdge: .leading)
            resultTable.autoPinEdge(toSuperviewEdge: .trailing)
            resultTable.autoPinEdge(toSuperviewEdge: .bottom)
            resultTable.autoPinEdge(.top, to: .bottom, of: searchBar)
           
            
            didSetupConstraints = true
        }
        searchButtonWidthConstraint?.autoRemove()
        searchButtonEdgeConstraint?.autoRemove()
        
        if searchBarTop {
            searchButtonWidthConstraint = searchButton.autoMatch(.width, to: .width, of: self)
            searchButtonEdgeConstraint = searchButton.autoPinEdge(toSuperviewEdge: .top)
        } else {
            searchButtonWidthConstraint = searchButton.autoSetDimension(.width, toSize: searchButtonWidth)
            searchButtonEdgeConstraint = searchButton.autoAlignAxis(toSuperviewAxis: .horizontal)
        }
        
        super.updateConstraints()
    }
    
    // Mark - User Interaction
    
    @objc func searchClicked(_ sender: UIButton!) {
        showSearchBar(searchBar: searchBar)
    }
    
    @objc func listClicked(_ sender: UIButton!) {
        delegate?.ListButtonWasClicked(mainView: self, sender:sender)
    }
    
    
    
    private var searchBarTop = false
    
    func showSearchBar(searchBar: UISearchBar) {
        searchBarTop = true
        
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
        
        UIView.animate(withDuration: 0.3,
                       animations: {
                        searchBar.becomeFirstResponder()
                        self.layoutIfNeeded()
        }, completion: { finished in
            UIView.animate(withDuration: 0.2, animations: {
                searchBar.alpha = self.searchBarEndingAlpha
                self.resultTable.alpha = self.tableEndingAlpha
                self.searchButton.alpha = self.searchButtonEndingAlpha
                self.searchButton.layer.cornerRadius = self.searchButtonEndingCornerRadius
            }
            )
        }
        )
    }
    
    
    
    
    func dismissSearchBar(searchBar: UISearchBar) {
        searchBarTop = false
        
        UIView.animate(withDuration: 0.2, animations: {
            searchBar.alpha = self.searchBarStartingAlpha
            self.resultTable.alpha = self.tableStartingAlpha
            self.searchButton.alpha = self.searchButtonStartingAlpha
            self.searchButton.layer.cornerRadius = self.searchButtonStartingCornerRadius
        }, completion: { finished in
            self.setNeedsUpdateConstraints()
            self.updateConstraintsIfNeeded()
            UIView.animate(withDuration: 0.3, animations: {
                searchBar.resignFirstResponder()
                self.layoutIfNeeded()
            }
            )
        }
        )
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension MainView_New: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        dismissSearchBar(searchBar: searchBar)
    }
}
