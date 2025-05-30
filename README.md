# Part 1. Trust Wallet - Create Wallet Functionality Manual Test Cases


| ID  | Test Case Title                                                                               | Priority | Category       | Status            |

| TC1 | [Successful Wallet Creation](#tc1-successful-wallet-creation)                                 | Critical | Functional     | Pass              |

| TC2 | [Create Wallet Without Accepting Terms](#tc2-create-wallet-without-accepting-terms)           | High     | Validation     | Not Executed      |

| TC3 | [Incorrect Recovery Phrase Verification](#tc3-incorrect-recovery-phrase-verification)         | Critical | Security       | Pass              |

| TC4 | [Wallet Name Validation](#tc4-wallet-name-validation)                                         | Medium   | Validation     | Not Executed      |

| TC5 | [Recovery Phrase Security Access](#tc5-recovery-phrase-security-access)                       | Critical | Security       | Not Executed      |

| TC6 | [Rapid Wallet Creation/Deletion Stress](#tc6-rapid-wallet-creationdeletion-stress)            | High     | Performance    | Not Executed      |

| TC7 | [Network Disruption During Creation](#tc7-network-disruption-during-creation)                 | High     | Network        | Not Executed      |

| TC8 | [App Interruption During Phrase Display](#tc8-app-interruption-during-phrase-display)         | High     | Interruption   | Not Executed      |

| TC9 | [Screenshot Prevention](#tc9-screenshot-prevention)                                           | Critical | Security       | Not Executed      |

| TC10| [Biometric Prompt Post-Creation](#tc10-biometric-prompt-post-creation)                        | High     | Security       | Not Executed      |

| TC11| [Create Multiple Wallets](#tc11-create-multiple-wallets)                                      | Medium   | Functional     | Not Executed      |

| TC12| [Localization - Spanish](#tc12-localization---Spanish)                                        | Low      | Localization   | Not Executed      |

| TC13| [Accessibility Verification](#tc13-accessibility-verification)                                | Medium   | Accessibility  | Not Executed      |

| TC14| [Create Wallet Offline](#tc14-create-wallet-offline)                                          | Medium   | Network        | Not Executed      |

| TC15| [Recovery Phrase Backup Reminder](#tc15-recovery-phrase-backup-reminder)                      | High     | Usability      | Not Executed      |

---

## Detailed Test Cases

### TC1: Successful Wallet Creation
**Objective**: Verify users can create a new wallet with valid inputs  
**Preconditions**: 
- Fresh app installation
- Network connection available
- Device language: English

**Test Steps**:
1. Launch Trust Wallet
2. Tap "Create a new wallet"
3. Check "I understand the risks"
4. Tap "Continue"
5. Record 12-word recovery phrase
6. Tap "Continue"
7. Verify phrase in correct order
8. Tap "Continue"
9. Enter "Primary Wallet" as name
10. Tap "Done"

**Expected Results**:
- Wallet dashboard appears
- ETH balance shows "0.00"
- Wallet name visible in header
- Recovery phrase is truly random

---

### TC2: Create Wallet Without Accepting Terms
**Objective**: Verify app prevents creation when terms aren't accepted  
**Preconditions**: 
- App launched to welcome screen
- No existing wallets

**Test Steps**:
1. Tap "Create new wallet"
2. Do not check "I understand the risks"
3. Attempt to tap "Continue"
4. Try to swipe to next screen
5. Press device back button

**Expected Results**:
- "Continue" button disabled
- Toast message: "You must accept the terms to continue"
- Swipe doesn't advance screen
- Back button returns to welcome screen

---

### TC3: Incorrect Recovery Phrase Verification
**Objective**: Verify error handling for incorrect phrase entry  
**Preconditions**: 
- On phrase verification screen
- Valid recovery phrase generated

**Test Steps**:
1. Enter correct word for position 1
2. Enter correct word for position 2
3. Enter incorrect word for position 3
4. Enter correct words for positions 4-6
5. Enter incorrect word for position 7
6. Enter correct words for positions 8-12
7. Tap "Continue"

**Expected Results**:
- Error: "Incorrect words selected. Please try again."
- Incorrect word positions cleared
- User remains on verification screen

---

### TC4: Wallet Name Validation
**Objective**: Validate wallet name input restrictions  
**Preconditions**: 
- On wallet naming screen
- Recovery phrase verified

**Test Steps**:
1. Leave name blank → Tap "Done"
2. Enter "W" (single character) → Tap "Done"
3. Enter 129-character string
4. Enter "MyWallet_2024!$" (special characters)
5. Enter "Savings Account" with space
6. Enter 128-character string

**Expected Results**:
1. Error: "Name must be 2-128 characters"
2. Same error as step 1
3. Error: "Exceeds maximum length of 128 characters"
4. Name accepted with checkmark
5. Name accepted with checkmark
6. Name accepted

---

### TC5: Recovery Phrase Security Access
**Objective**: Verify security measures for phrase access  
**Preconditions**: 
- Wallet "Primary Wallet" created
- Device PIN = "1234"

**Test Steps**:
1. Go to Settings > Security
2. Tap "Show Recovery Phrase"
3. Attempt to bypass PIN prompt
4. Enter incorrect PIN "1111"
5. Enter incorrect PIN "2222"
6. Enter incorrect PIN "3333"
7. Wait 5 minutes
8. Enter correct PIN "1234"

**Expected Results**:
- PIN prompt appears immediately
- Navigation blocked without PIN
- "Try again" after each incorrect attempt
- "Too many attempts. Try in 5 minutes." after 3 failures
- Correct PIN shows recovery phrase
- Phrase auto-hides after 60s

---

### TC6: Rapid Wallet Creation/Deletion Stress
**Objective**: Verify app stability under repeated operations  
**Preconditions**: 
- Clean app installation
- Network available

**Test Steps**:
1. Create new wallet (TC1)
2. Delete wallet: Settings > Wallets > [Wallet] > Delete
3. Repeat steps 1-2 five times
4. Monitor device resources

**Expected Results**:
- Each creation completes within 5s
- Each deletion completes within 3s
- No app crashes/ANRs
- All wallets have unique phrases
- Memory usage stable (<50MB fluctuation)

---

### TC7: Network Disruption During Creation
**Objective**: Verify graceful handling of network loss  
**Preconditions**: 
- On phrase verification screen
- Network stable

**Test Steps**:
1. Enable airplane mode
2. Attempt verification
3. Disable airplane mode
4. Retry verification
5. Complete creation

**Expected Results**:
- Error: "Network unavailable. Please check connection."
- Verification fails
- Phrase fields retain entered words
- Verification succeeds after retry
- Wallet creates successfully

---

### TC8: App Interruption During Phrase Display
**Objective**: Verify session security when backgrounded  
**Preconditions**: 
- Recovery phrase displayed
- No authentication set

**Test Steps**:
1. Press Home button
2. Wait 30 seconds
3. Relaunch app
4. Attempt to continue
5. Check phrase preservation

**Expected Results**:
- App restarts at welcome screen
- Security terms reappear
- Previous phrase invalidated
- Error "Session expired" if continue attempted

---

### TC9: Screenshot Prevention
**Objective**: Verify security against screen capture  
**Preconditions**: 
- Recovery phrase displayed

**Test Steps**:
1. Attempt device screenshot (Power + Vol Down)
2. Start screen recording
3. Connect to computer via USB
4. Enable USB debugging
5. Attempt screen mirroring

**Expected Results**:
- Screenshot appears black
- System toast: "Screenshots not allowed"
- Recording shows blurred phrase
- Mirroring shows obscured phrase

---

### TC10: Biometric Prompt Post-Creation
**Objective**: Verify biometric authentication requirement  
**Preconditions**: 
- Fingerprint sensor enabled
- Wallet created
- App closed

**Test Steps**:
1. Relaunch Trust Wallet
2. Attempt failed fingerprint
3. Repeat failure twice
4. Observe cooldown
5. Relaunch after cooldown
6. Authenticate successfully

**Expected Results**:
- Biometric prompt appears immediately
- "Try again" after first failure
- "2 attempts remaining" after second
- "Too many attempts. Try in 5 minutes." after third
- Successful authentication opens dashboard

---

### TC11: Create Multiple Wallets
**Objective**: Verify multiple wallet management  
**Preconditions**: 
- "Primary Wallet" exists
- App on dashboard

**Test Steps**:
1. Go to Settings > Wallets
2. Tap "+ Add Wallet"
3. Select "Create new wallet"
4. Complete creation flow
5. Name "Secondary Wallet"
6. Switch between wallets
7. Verify balances

**Expected Results**:
- Both wallets visible in selector
- Switching completes within 2s
- Each shows independent 0.00 ETH balance
- Unique recovery phrases per wallet
- Names persist after restart

---

### TC12: Localization - Spanish
**Objective**: Verify creation in Spanish locale  
**Preconditions**: 
- Device language = Spanish
- App freshly installed

**Test Steps**:
1. Launch Trust Wallet
2. Complete creation flow
3. Verify all screen text
4. Check special character rendering (ñ, á, é, í, ó, ú)
5. Verify date/currency formats

**Expected Results**:
- All UI text in Spanish instead of English
- Special characters render correctly
- Date format: DD/MM/YYYY
- Currency format: 0,00 ETH

---

### TC13: Accessibility Verification
**Objective**: Verify accessibility compliance  
**Preconditions**: 
- TalkBack enabled
- Font size = Largest
- Display size = Large

**Test Steps**:
1. Navigate creation flow with swipe gestures
2. Verify TalkBack announcements
3. Check colour contrast ratios
4. Measure touch target sizes
5. Verify phrase accessibility

**Expected Results**:
- Elements have descriptive labels
- Phrase words not read aloud
- Contrast ratio ≥4.5:1 for text
- Touch targets ≥48dp × 48dp
- No time-based content requiring quick response

---

### TC14: Create Wallet Offline
**Objective**: Verify creation without internet  
**Preconditions**: 
- Airplane mode enabled
- Device time/date correct

**Test Steps**:
1. Launch Trust Wallet
2. Complete creation flow
3. Verify dashboard
4. Disable airplane mode
5. Observe balance sync

**Expected Results**:
- Wallet creates successfully
- Dashboard shows "Offline" indicator
- Balances display "Syncing paused"
- Network detected within 15s after disable
- Balance updates to 0.00 ETH

---

### TC15: Recovery Phrase Backup Reminder
**Objective**: Verify persistent backup reminders  
**Preconditions**: 
- Wallet created without backing up phrase
- "Skip" tapped during backup

**Test Steps**:
1. Complete creation without backup
2. Observe dashboard
3. Restart app
4. After 24 hours, launch app
5. Complete backup via Settings

**Expected Results**:
- Persistent banner: "Backup your recovery phrase!"
- Settings icon shows warning badge
- Reminder persists across sessions
- Daily notification after 24 hours
- Badge disappears after backup

---

**Test Environment**:  
- Device: Pixel 7 Pro (Android 15)  
- Trust Wallet Version: 8.46 
- Network: 5G/Wi-Fi  
 
---------------------------------------------------------------------------------------------------------------------------------------------

# Part 2. Automation Testing

This is a sample mobile automation framework built using **Java**, **Appium**, and **TestNG**, designed to automate testing of the "Create Wallet" functionality in the **Trust Wallet** Android app.

## 🧪 Manual Test Cases (Task 1)
For Task 1, manual test cases were written above in this file however additionally there are more tests written in BDD (Gherkin) format and stored in the following file:

sample-mobile-framework/src/test/java/tests/resources/manual-test-cases.feature

These describe the "Create Wallet" journey in human-readable scenarios to facilitate collaboration between QA, developers, and product stakeholders.

## 🔧 Tools & Technologies

- **Java** - Programming language
- **Appium** - Mobile test automation framework
- **TestNG** - Test framework for running test cases
- **UiAutomator2** - Appium automation engine
- **Android Emulator** - Virtual device used for testing

## 🚀 Setup Instructions

### Prerequisites

- Java JDK 8+
- Android Studio + Emulator
- Appium Server running at `http://127.0.0.1:4725/wd/hub`
- Trust Wallet APK placed at: `src/apps/android/androidAPP.apk`
- Maven installed and configured

### Run Tests

1. **Start Appium server** on port `4725`.

2. **Run TestNG Test**:

   ```bash
   mvn test

## 📌 Notes
DriverUtils.java provides a reusable singleton Appium driver utility.

Make sure your emulator is running and Appium server is started before test execution.

You can modify DesiredCapabilities based on your emulator/device settings.
