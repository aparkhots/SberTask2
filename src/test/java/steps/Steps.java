package steps;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.apache.http.client.utils.URIBuilder;
import io.restassured.response.Response;
import org.junit.jupiter.api.Assertions;
import static io.restassured.RestAssured.get;

public class Steps {

    private final URIBuilder uri = new URIBuilder();
    private Response response;

    @Given("Start link is {string}")
    public void startLinkCreate(String link) {
        uri.setScheme("https");
        uri.setHost(link);
    }

    @And("Add API method {string}")
    public void addAPIMethod(String method) {
        uri.setPath(method);
    }

    @And("Set parameter {string} as {string}")
    public void setParameterInLink(String name, String value) {
        uri.setParameter(name, value);
    }

    @When("I send request")
    public void sendRequest() {
        var url = uri.toString();
        response = get(url);
    }

    @Then("I expect status code {int}")
    public void statusCodeCheck(int expectedStatusCode) {
        Assertions.assertEquals(expectedStatusCode, response.statusCode(), "Status code differ than expected");
    }

    @Then("I expect ContentType of response as {string}")
    public void contentTypeCheck(String expectedType) {
        Assertions.assertEquals(expectedType, response.contentType(), "ContentType differ than expected");
    }

    @Then("I expect value of {string} is {string} in response")
    public void countryCheck(String jsonPath, String expectedValue) {
        var actualValue = response.then().extract().jsonPath().getString(jsonPath);
        Assertions.assertEquals(expectedValue, actualValue, "Actual value differ than expected");
    }
}
