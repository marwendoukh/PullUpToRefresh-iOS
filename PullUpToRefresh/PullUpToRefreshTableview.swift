//
// PullUpToRefreshTableview.swift
//
// Created by Marwen on 17/08/2018.
// Copyright :Marwen Doukh 2018. All rights reserved.
//


// MARK: Delegate
protocol PullUpToRefreshDelegate: class {
  func tableviewDidPullUp()
  func tableviewDidScroll()
}

class PullUpToRefreshTableview: UITableView, UITableViewDelegate {
  
  // MARK: Customization vars
  var differenceThreshold: CGFloat = 10.0
  var refreshThreshold: CGFloat = 100
  var bottomView: UIView = UIView()
  weak var pullUpToRefreshDelegate: PullUpToRefreshDelegate?
  
  // MARK: Private vars
  fileprivate var previousScrollingPosition: CGFloat = 0.0
  fileprivate var isBottomViewAdded = false
  fileprivate var animationDuration: Double = 0.2

  override func awakeFromNib() {
    super.awakeFromNib()
    self.delegate = self
  }
  
  // MARK: Utils functions
  
  // detect how much the user scrolled
  fileprivate func calculateScrollingDistance() -> CGFloat {
    let currentOffset = self.contentOffset.y
    let maximumOffset = self.contentSize.height - self.frame.size.height
    return maximumOffset - currentOffset
  }
  
  // check if the user is scrolling from the tableview bottom
  fileprivate func isLoadingFromBottom() -> Bool {
    return self.previousScrollingPosition < self.contentOffset.y
  }
  
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    let isLoadingFromBottom = self.isLoadingFromBottom()
    let scrollingDistance = calculateScrollingDistance()
    // if the user scrolled from the tabelview bottom and passed the threshold , then save the current position
    if isLoadingFromBottom, scrollingDistance <= differenceThreshold {
      // Save the current position
      previousScrollingPosition = scrollView.contentInset.bottom
    }
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    // delegate scroll
    pullUpToRefreshDelegate?.tableviewDidScroll()
    
    let isLoadingFromBottom = self.isLoadingFromBottom()
    let scrollingDistance = calculateScrollingDistance()
    
    if isLoadingFromBottom, scrollingDistance <= -differenceThreshold {
      // check if the bottomView has already been added
      if !isBottomViewAdded {
        // add bottomView
        self.tableFooterView = bottomView
        isBottomViewAdded = true
        // add space in the tableview bottom
        UIView.animate(withDuration: animationDuration) {
          scrollView.contentInset.bottom = self.previousScrollingPosition
        }
      }
    }
  }
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    
    let isLoadingFromBottom = self.isLoadingFromBottom()
    let scrollingDistance = calculateScrollingDistance()
    
    if  isBottomViewAdded && isLoadingFromBottom && scrollingDistance < -refreshThreshold {
      pullUpToRefreshDelegate?.tableviewDidPullUp()
    }
    
    // remove bottomView
    isBottomViewAdded = false
    DispatchQueue.main.async {
      UIView.animate(withDuration: self.animationDuration) {
        scrollView.contentInset.bottom = self.previousScrollingPosition
        self.tableFooterView = nil
      }
    }
  }
  
  // remove bottomView after finishing scroll
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    // remove bottomView
    UIView.animate(withDuration: animationDuration) {
      scrollView.contentInset.bottom = self.previousScrollingPosition
      self.tableFooterView = nil
    }
    isBottomViewAdded = false
  }
  
}
