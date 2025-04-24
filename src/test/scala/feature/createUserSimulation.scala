package feature

import io.gatling.core.Predef._
import io.gatling.http.Predef._
import scala.concurrent.duration._
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.structure.ScenarioBuilder   

class createUserSimulation extends Simulation {

  val protocol = karateProtocol()

  val createUser: ScenarioBuilder = scenario("Create User Accounts")
    .exec(karateFeature("classpath:feature/createUser.feature"))

  setUp(
    createUser.inject(
      nothingFor(5.seconds),                 
      constantUsersPerSec(2) during(10.seconds),  
      rampUsersPerSec(2) to(10) during(5.minutes),  
      constantUsersPerSec(10) during(10.minutes),    
      rampUsersPerSec(10) to(2) during(5.minutes)   
    )
  ).protocols(protocol)
    .assertions(
      global.responseTime.max.lt(5000),    
      global.successfulRequests.percent.gt(95)  
    )
}
