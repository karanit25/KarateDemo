package com.tutorials.karate;
import com.intuit.karate.junit4.Karate;
import cucumber.api.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@CucumberOptions(features = "src/test/java/com/tutorials/karate/CRUD.feature")
public class TestRunner {
}
