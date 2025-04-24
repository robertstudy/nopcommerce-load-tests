package feature

import io.gatling.core.Predef._
import io.gatling.http.Predef._
import scala.concurrent.duration._
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.structure.ScenarioBuilder   

class getProductsSimulation extends Simulation {

  val protocol = karateProtocol()

  val getProducts: ScenarioBuilder = scenario("Get Products")
    .exec(karateFeature("classpath:feature/getProducts.feature"))

  setUp(
    getProducts.inject(
      nothingFor(5.seconds),  
      atOnceUsers(5),         
      rampUsers(20) during(30.seconds),  
      constantUsersPerSec(5) during(2.minutes),  
      rampUsersPerSec(5) to(10) during(1.minute) 
    )
  ).protocols(protocol)
    .assertions(
      global.responseTime.max.lt(3000),    
      global.successfulRequests.percent.gt(95) 
    )
}