import XCTest
@testable import SwiftVer

class IntraVersionTests: XCTestCase {

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testGoodBundleVersion() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let bundle = MockBundle(version: "1.2.3", build: 4)
    let version = Version(bundle: bundle, dictionary: MockBundle.intraBuildNumberDictionary, buildNumberCumulative: false, versionControl: versionControlInfo)

    XCTAssertEqual(version?.semver.major, 1)
    XCTAssertEqual(version?.semver.minor, 2)
    XCTAssertEqual(version?.semver.patch, 3)
    XCTAssertEqual(version?.build, 4)

    XCTAssertEqual(version?.versionControl?.TYPE, versionControlInfo.TYPE)
    XCTAssertEqual(version?.versionControl?.BASENAME, versionControlInfo.BASENAME)
    XCTAssertEqual(version?.versionControl?.UUID, versionControlInfo.UUID)
    XCTAssertEqual(version?.versionControl?.NUM, versionControlInfo.NUM)
    XCTAssertEqual(version?.versionControl?.DATE, versionControlInfo.DATE)
    XCTAssertEqual(version?.versionControl?.BRANCH, versionControlInfo.BRANCH)
    XCTAssertEqual(version?.versionControl?.TAG, versionControlInfo.TAG)
    XCTAssertEqual(version?.versionControl?.TICK, versionControlInfo.TICK)
    XCTAssertEqual(version?.versionControl?.EXTRA, versionControlInfo.EXTRA)
    XCTAssertEqual(version?.versionControl?.FULLHASH, versionControlInfo.FULLHASH)
    XCTAssertEqual(version?.versionControl?.SHORTHASH, versionControlInfo.SHORTHASH)
    XCTAssertEqual(version?.versionControl?.MODIFIED, versionControlInfo.MODIFIED)
  }

  func testMissingBundleVersion() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: nil, build: 4)
    let version = Version(bundle: bundle, dictionary: MockBundle.intraBuildNumberDictionary, buildNumberCumulative: false, versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  func testMissingInvalidVersion() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: "dfasdfs", build: 4)
    let version = Version(bundle: bundle, dictionary: MockBundle.intraBuildNumberDictionary, buildNumberCumulative: false, versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  func testMissingBundleBuild() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: "1.2.3", build: nil)
    let version = Version(bundle: bundle, dictionary: MockBundle.intraBuildNumberDictionary, buildNumberCumulative: false, versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  func testInvalidBundleBuild() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: "1.2.3", build: "asdfdsaf")
    let version = Version(bundle: bundle, dictionary: MockBundle.intraBuildNumberDictionary, buildNumberCumulative: false, versionControl: versionControlInfo)

    XCTAssertNil(version)
  }
}