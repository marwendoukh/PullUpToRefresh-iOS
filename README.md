[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/PullUpToRefresh.svg)](https://cocoapods.org/pods/PullUpToRefresh)
[![Platform](https://img.shields.io/cocoapods/p/PullUpToRefresh.svg)](https://cocoapods.org/pods/PullUpToRefresh)
[![Downloads](https://img.shields.io/cocoapods/dt/PullUpToRefresh.svg)](https://cocoapods.org/pods/PullUpToRefresh)

# PullUpToRefresh - iOS
Pull up to refresh is a Swift library that adds pull to refresh capability to tableview bottom.

# Install
Add this to your <code>Podfile</code>
<pre><code>pod 'PullUpToRefresh'
</code></pre>

# How to use it ?

* Set your tableview custom Class to <code>PullUpToRefreshTableview</code>

* Implement the <code>PullUpToRefreshTableviewDelegate</code> in your <code>UIViewController</code>

# Customization

* <code>bottomView</code> : the view at the bottom that will be shown when refreshing

* <code>differenceThreshold</code> : set how much you want to scroll in the bottom in order to show the bottom view

* <code>refreshThreshold</code> : set how much you want to scroll in the bottom in order to start refreshing

# Questions or Suggestions ?

Please do not hesitate to email me at **marwen.doukh@protonmail.com**
