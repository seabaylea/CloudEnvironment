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
@testable import Credentials
@testable import CloudEnvironment

class AppIDTests: XCTestCase {

    static var allTests : [(String, (AppIDTests) -> () throws -> Void)] {
        return [
            ("testGetCredentials", testGetCredentials),
        ]
    }

    func testGetCredentials() {

        // Load test mappings.json file
        let manager = AppConfiguration(mappingsFilePath: "Tests/CredentialsTests/resources")

        // Load Cloud Foundry test credentials-- VCAP_SERVICES and VCAP_APPLICATION
        manager.loadCFTestConfigs(path: "Tests/CredentialsTests/resources/config_cf_example.json")

        guard let credentials =  manager.getAppIDCredentials(name: "AppIDKey") else {
            XCTFail("Could not load AppID credentials.")
            return
        }

        XCTAssertEqual(credentials.clientId, "<clientId>", "AppID Service clientId should match.")
        XCTAssertEqual(credentials.oauthServerUrl, "https://appid-oauth.stage1.ng.bluemix.net/oauth/v3/ee971e31-eb19-415b-af84-45172c24895c", "AppID oauthServerUrl should match.")
        XCTAssertEqual(credentials.profilesUrl, "https://appid-profiles.stage1.ng.bluemix.net", "AppID Service profilesUrl should match.")
        XCTAssertEqual(credentials.secret, "<secret>", "AppID Service secret should match.")
        XCTAssertEqual(credentials.tenantId, "ee971e31-eb19-415b-af84-45172c24895c", "AppID Service tenantId should match.")
        XCTAssertEqual(credentials.version, 3, "AppID Service version should match.")

    }

}
