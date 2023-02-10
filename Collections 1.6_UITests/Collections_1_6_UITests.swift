//
//@testable import Collections_1_6
//import XCTest
//
//final class Collections_1_6_UITests: XCTestCase {
//    
//    
//    override func setUpWithError() throws {
//        continueAfterFailure = false
//    }
//
//    func testSetView() {
//        let app = XCUIApplication()
//        app.launch()
//        let tablesQuery = app.tables
//        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Set"]/*[[".cells.staticTexts[\"Set\"]",".staticTexts[\"Set\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.textFields["FirstTF"].tap()
//        app.textFields["FirstTF"].typeText("Home")
//        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.textFields["SecondTF"].typeText("oeg")
//        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
//        
//        app/*@START_MENU_TOKEN@*/.staticTexts["All matching letters"]/*[[".buttons[\"All matching letters\"].staticTexts[\"All matching letters\"]",".staticTexts[\"All matching letters\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        XCTAssert(app.staticTexts["eo"].waitForExistence(timeout: 1.0))
//        
//        app/*@START_MENU_TOKEN@*/.staticTexts["All characters that do not match"]/*[[".buttons[\"All characters that do not match\"].staticTexts[\"All characters that do not match\"]",".staticTexts[\"All characters that do not match\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        XCTAssert(app.staticTexts["Hgm"].waitForExistence(timeout: 1.0))
//        
//        app/*@START_MENU_TOKEN@*/.staticTexts["All unique characters from the first text field that do not match in text fields"]/*[[".buttons[\"All unique characters from the first text field that do not match in text fields\"].staticTexts[\"All unique characters from the first text field that do not match in text fields\"]",".staticTexts[\"All unique characters from the first text field that do not match in text fields\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        XCTAssert(app.staticTexts["Hm"].waitForExistence(timeout: 1.0))
//    }
//    func testArrayView() {
//        let app = XCUIApplication()
//        app.launch()
//        let tablesQuery = app.tables
//        tablesQuery.staticTexts["Array"].tap()
//        
//        let collectionViewsQuery = app.collectionViews
//        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Generate an array of integers with 10_000_000 elements"]/*[[".cells.staticTexts[\"Generate an array of integers with 10_000_000 elements\"]",".staticTexts[\"Generate an array of integers with 10_000_000 elements\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        XCTAssert(app.staticTexts["Remove at the beginning 1000 elements at once"].waitForExistence(timeout: 10.0))
//        
//        collectionViewsQuery.staticTexts["Remove at the beginning 1000 elements at once"].tap()
//        let countCellsMustBe = 13
//        let countCells = collectionViewsQuery.cells.count
//        XCTAssertEqual(countCells, countCellsMustBe)
//    }
//    
//    func testArrayAndDictionaryView() {
//        let app = XCUIApplication()
//        app.launch()
//                        
//        let tablesQuery = app.tables
//        tablesQuery.staticTexts["Dictionary"].tap()
//        let collectionViewsQuery = app.collectionViews
//      
//        let countCellsMustBe = 6
//        let countCells = collectionViewsQuery.cells.count
//        let activity = app.activityIndicators
//        XCTAssertEqual(countCells, countCellsMustBe)
//        XCTAssert(activity.element.exists)
//        let resultOne = app.staticTexts["Find the first contact"]
//        let existsOne = resultOne.waitForExistence(timeout: 33.0)
//        XCTAssertTrue(existsOne,"Missing Start Find")
//        
//        
//        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).staticTexts["Find the first contact"].tap()
//        XCTAssert(app.staticTexts["Name1"].exists)
//       
//    }
//}
//
