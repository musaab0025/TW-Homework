package tests;

import org.testng.annotations.Test;
import pages.CreateWalletPage;

public class SampleTest extends BaseTest {

    @Test
    public void testCreateWalletFlow() {
        CreateWalletPage walletPage = new CreateWalletPage(driver);
        walletPage.clickGetStarted();
        assert walletPage.isCreateWalletOptionDisplayed();
        walletPage.clickCreateWallet();
        walletPage.acceptTermsAndContinue();
        assert walletPage.isSecureWalletScreenDisplayed();
        walletPage.clickRevealSecretPhrase();
        assert walletPage.isSecretPhraseVisible();
    }
}
