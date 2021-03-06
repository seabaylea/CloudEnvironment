/*
 * Copyright IBM Corporation 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import XCTest
import Configuration
@testable import CloudEnvironment

class LocalFileTests: XCTestCase {

    static var allTests : [(String, (LocalFileTests) -> () throws -> Void)] {
        return [
            ("testGetCredsFromFileWithKey", testGetCredsFromFileWithKey),
            ("testGetCredsFromFileNoKey", testGetCredsFromFileNoKey)
        ]
    }

    func testGetCredsFromFileWithKey() {

        // Load test mappings.json file
        let cloudEnv = CloudEnv(mappingsFilePath: "Tests/CloudEnvironmentTests/resources")

        guard let credentials =  cloudEnv.getAlertNotificationCredentials(name: "AlertNotificationFileWithKey") else {
            XCTFail("Could not load Alert Notification service credentials.")
            return
        }

        XCTAssertEqual(credentials.url, "https://ibmnotifybm.mybluemix.net/api/alerts/v1", "Alert Notification Service URL should match.")
        XCTAssertEqual(credentials.name, "21a084f4-4eb3-4de4-9834-33bdc7be5df9/d2a85740-da7a-4615-aabf-5bdc35c63618", "Alert Notification Service name should match.")
        XCTAssertEqual(credentials.password, "alertnotification-pwd", "Alert Notification Service password should match.")
    }

    func testGetCredsFromFileNoKey () {

        // Load test mappings.json file
        let cloudEnv = CloudEnv(mappingsFilePath: "Tests/CloudEnvironmentTests/resources")

        guard let credentials =  cloudEnv.getAlertNotificationCredentials(name: "AlertNotificationFileNoKey") else {
            XCTFail("Could not load Alert Notification service credentials.")
            return
        }

        XCTAssertEqual(credentials.url, "https://ibmnotifybm.mybluemix.net/api/alerts/v1", "Alert Notification Service URL should match.")
        XCTAssertEqual(credentials.name, "21a084f4-4eb3-4de4-9834-33bdc7be5df9/d2a85740-da7a-4615-aabf-5bdc35c63618", "Alert Notification Service name should match.")
        XCTAssertEqual(credentials.password, "alertnotification-pwd", "Alert Notification Service password should match.")
    }
}
