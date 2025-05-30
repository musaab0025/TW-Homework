package tests;
import org.testng.ITestResult;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import utils.DriverUtils;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.android.AndroidDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.testng.annotations.BeforeClass;

import java.net.URL;

public class BaseTest {
    protected AppiumDriver driver;

    @BeforeClass
    public void setUp() throws Exception {
        DesiredCapabilities caps = new DesiredCapabilities();
        caps.setCapability("platformName", "Android");
        caps.setCapability("deviceName", "Android Emulator");
        caps.setCapability("appPackage", "com.wallet.crypto.trustapp");
        caps.setCapability("appActivity", "com.wallet.crypto.trustapp.ui.start.activity.RootHostActivity");
        caps.setCapability("automationName", "UiAutomator2");

        driver = new AndroidDriver(new URL("http://127.0.0.1:4725/wd/hub"), caps);
        
    }
}

