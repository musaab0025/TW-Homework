package pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import io.appium.java_client.AppiumDriver;

public class CreateWalletPage {
    private AppiumDriver driver;

    public CreateWalletPage(AppiumDriver driver) {
        this.driver = driver;
    }

    By getStartedBtn = By.id("com.wallet.crypto.trustapp:id/button_get_started");
    By createWalletOption = By.id("com.wallet.crypto.trustapp:id/create_wallet_button");
    By termsCheckbox = By.id("com.wallet.crypto.trustapp:id/checkbox_terms");
    By continueBtn = By.id("com.wallet.crypto.trustapp:id/button_continue");
    By secureWalletTitle = By.id("com.wallet.crypto.trustapp:id/secure_wallet_title");
    By revealPhraseBtn = By.id("com.wallet.crypto.trustapp:id/reveal_phrase_button");
    By secretPhraseField = By.id("com.wallet.crypto.trustapp:id/secret_phrase_text");

    public void clickGetStarted() {
        driver.findElement(getStartedBtn).click();
    }

    public boolean isCreateWalletOptionDisplayed() {
        return driver.findElement(createWalletOption).isDisplayed();
    }

    public void clickCreateWallet() {
        driver.findElement(createWalletOption).click();
    }

    public void acceptTermsAndContinue() {
        driver.findElement(termsCheckbox).click();
        driver.findElement(continueBtn).click();
    }

    public boolean isSecureWalletScreenDisplayed() {
        return driver.findElement(secureWalletTitle).isDisplayed();
    }

    public void clickRevealSecretPhrase() {
        driver.findElement(revealPhraseBtn).click();
    }

    public boolean isSecretPhraseVisible() {
        return driver.findElement(secretPhraseField).isDisplayed();
    }
}
