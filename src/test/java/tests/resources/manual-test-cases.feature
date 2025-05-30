Feature: Create Wallet Functionality in Trust Wallet
  As a cryptocurrency user
  I want to securely create a new wallet
  So I can safely store and manage digital assets using Trust Wallet

  @happy-path @critical
  Scenario: Successfully create wallet with valid details
    Given the user has installed and opened the Trust Wallet app
    And I have no existing wallets
    When the user selects "Create a new wallet"
    And the user accepts the Terms of Usage
    And the user saves the recovery phrase
    And the user correctly verifies the recovery phrase order
    And I name the wallet "Primary Wallet"
    Then the wallet should be successfully created
    And I should see the wallet dashboard
    And my ETH balance should be "0.00"

  @validation @high
  Scenario: Attempt wallet creation without accepting Terms of Usage
    Given the user has opened the Trust Wallet app
    When the user selects "Create Wallet"
    And the user does not accept the Terms of Usage
    Then navigation should be blocked
    And I should see toast message "You must accept the terms to continue"

  @security @critical
  Scenario: Verify error when entering incorrect recovery phrase order
    Given the user initiates the wallet creation process
    And the user saves the recovery phrase
    When the user enters the recovery phrase in the wrong order during verification
    Then I should see error "Incorrect words selected. Please try again."
    And the incorrect words should be cleared

  @validation @medium
  Scenario: Creating wallet with very long name
    Given I am on the wallet naming screen
    When the user enters a wallet name exceeding 128 characters
    Then I should see error "Exceeds maximum length"
    When the user enters a 128-character name
    Then the name should be accepted and stored

  @security @critical
  Scenario: Security check – recovery phrase accessibility
    Given I have created a wallet successfully
    When the user tries to retrieve their recovery phrase without authentication
    Then access should be denied with security prompt
    When the user authenticates with device PIN
    Then the app should display the recovery phrase
    And it should auto-hide after 60 seconds of inactivity

  @performance @high
  Scenario: Rapid wallet creation and deletion test
    Given I have a clean app installation
    When the user creates and deletes wallets 5 times consecutively
    Then the app should remain stable
    And average creation time should be under 5 seconds
    And no residual wallet data remains after deletion

  @ux @medium
  Scenario: Wallet creation follows seamless flow
    Given the user is starting the wallet creation process
    When the user follows all required steps
    Then the process should complete within 7 screens
    And the user should see confirmation animation
    And be redirected to the wallet dashboard

  @network @high
  Scenario: Wallet creation under poor network conditions
    Given the user is on a weak or unstable network connection
    When the user attempts to create a new wallet
    Then local operations should complete successfully
    And any network-dependent features should show loading state
    When network connection improves
    Then wallet balance should sync automatically

  @security @critical
  Scenario: Screen capture prevention during recovery phrase display
    Given I am viewing my recovery phrase
    When I attempt to take a screenshot
    Then the screenshot should appear blank/black
    When I attempt screen recording
    Then the recovery phrase should be obscured

  @multi-wallet @medium
  Scenario: Create multiple wallets
    Given I have an existing wallet named "Primary Wallet"
    When I navigate to Settings > Wallets
    And I select "Create new wallet"
    And I complete the wallet creation flow
    And I name the wallet "Secondary Wallet"
    Then both wallets should appear in the wallet selector
    And each wallet should have independent balances

  @interruption @high
  Scenario: App backgrounding during recovery phrase display
    Given I am viewing my recovery phrase
    When I background the app for 30 seconds
    And I relaunch the app
    Then I should see the security warning screen
    And my previously generated recovery phrase should be invalidated

  @security @high
  Scenario: Biometric authentication prompt after creation
    Given I have device biometrics enabled
    And I complete wallet creation
    When I force close and relaunch the app
    Then I should see a biometric authentication prompt
    When I fail authentication 3 times
    Then I should see a security cooldown period