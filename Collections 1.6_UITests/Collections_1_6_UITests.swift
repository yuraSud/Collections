
@testable import Collections_1_6
import XCTest

final class Collections_1_6_UITests: XCTestCase {
    
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
  
    func testArrayBehavior() {
            let app = XCUIApplication()
           app.launch()
           let tablesQuery = app.tables
           let collectionViewsQuery = app.collectionViews
           tablesQuery.staticTexts["Array"].tap()
           
           app.staticTexts["Generate an array of integers with 10_000_000 elements"].tap()
           _ = app.wait(for: XCUIApplication.State.notRunning, timeout:12)
           
           collectionViewsQuery.staticTexts["Insert at the beginning of an array 1000 elements one-by-one"].tap()
           _ = app.wait(for: XCUIApplication.State.notRunning, timeout:10)
           
           collectionViewsQuery.staticTexts["Append to the end of an array 1000 elements at once"].tap()
           _ = app.wait(for: XCUIApplication.State.notRunning, timeout:10)
           
           collectionViewsQuery.staticTexts["Remove at the beginning 1000 elements one-by-one"].tap()
           _ = app.wait(for: XCUIApplication.State.notRunning, timeout:10)
           
           collectionViewsQuery.staticTexts["Remove in the middle 1000 elements at once"].tap()
           _ = app.wait(for: XCUIApplication.State.notRunning, timeout:10)
           
           collectionViewsQuery.staticTexts["Insert in the middle of an array 1000 elements one-by-one"].tap()
           _ = app.wait(for: XCUIApplication.State.notRunning, timeout:10)
     
       }
    func testSetView() {
        let app = XCUIApplication()
        app.launch()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Set"]/*[[".cells.staticTexts[\"Set\"]",".staticTexts[\"Set\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields["FirstTF"].tap()
        app.textFields["FirstTF"].typeText("Home")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields["SecondTF"].typeText("oeg")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app/*@START_MENU_TOKEN@*/.staticTexts["All matching letters"]/*[[".buttons[\"All matching letters\"].staticTexts[\"All matching letters\"]",".staticTexts[\"All matching letters\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(app.staticTexts["eo"].waitForExistence(timeout: 1.0))
        
        app/*@START_MENU_TOKEN@*/.staticTexts["All characters that do not match"]/*[[".buttons[\"All characters that do not match\"].staticTexts[\"All characters that do not match\"]",".staticTexts[\"All characters that do not match\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(app.staticTexts["Hgm"].waitForExistence(timeout: 1.0))
        
        app/*@START_MENU_TOKEN@*/.staticTexts["All unique characters from the first text field that do not match in text fields"]/*[[".buttons[\"All unique characters from the first text field that do not match in text fields\"].staticTexts[\"All unique characters from the first text field that do not match in text fields\"]",".staticTexts[\"All unique characters from the first text field that do not match in text fields\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(app.staticTexts["Hm"].waitForExistence(timeout: 1.0))
    }
  
       func testArrayAndDictionaryBehavior() {
           let app = XCUIApplication()
           app.launch()
           let tablesQuery = app.tables
           let collectionViewsQuery = app.collectionViews
           tablesQuery.staticTexts["Dictionary"].tap()
           _ = app.wait(for: XCUIApplication.State.notRunning, timeout:50)
           
           collectionViewsQuery.children(matching: .cell).element(boundBy: 0).staticTexts["Find the first contact"].tap()
           _ = app.wait(for: XCUIApplication.State.notRunning, timeout:5)
           
           collectionViewsQuery.children(matching: .cell).element(boundBy: 2).staticTexts["Find the last contact"].tap()
           _ = app.wait(for: XCUIApplication.State.notRunning, timeout:5)
           
           collectionViewsQuery.children(matching: .cell).element(boundBy: 4).staticTexts["Search for a non-existing element"].tap()
           _ = app.wait(for: XCUIApplication.State.notRunning, timeout:10)
           
           collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Find the first contact"]/*[[".cells.staticTexts[\"Find the first contact\"]",".staticTexts[\"Find the first contact\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
           _ = app.wait(for: XCUIApplication.State.notRunning, timeout:5)
           
           collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Find the last contact"]/*[[".cells.staticTexts[\"Find the last contact\"]",".staticTexts[\"Find the last contact\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
           _ = app.wait(for: XCUIApplication.State.notRunning, timeout:5)
           
           collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Search for a non-existing element"]/*[[".cells.staticTexts[\"Search for a non-existing element\"]",".staticTexts[\"Search for a non-existing element\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
           _ = app.wait(for: XCUIApplication.State.notRunning, timeout:5)
       }
}

