# Recursive Sync Dispatch
![Platforms](https://img.shields.io/badge/platform-macOS%20|%20iOS%20|%20tvOS%20|%20watchOS%20|%20Linux-lightgrey.svg?style=flat) [![Carthage compatible](https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![SPM compatible](https://img.shields.io/badge/SPM-compatible-E05C43.svg?style=flat)](https://swift.org/package-manager/) [![License](https://img.shields.io/github/license/happn-tech/RecursiveSyncDispatch.svg)](License.txt) [![happn](https://img.shields.io/badge/from-happn-0087B4.svg?style=flat)](https://happn.com)

⚠️ Use for private queues only! All calls to the queue **must** be done via the
`recursiveSync` method to have recursive sync dispatch working.

## Credits
This project is a packaged implementation of https://stackoverflow.com/a/19838227.
