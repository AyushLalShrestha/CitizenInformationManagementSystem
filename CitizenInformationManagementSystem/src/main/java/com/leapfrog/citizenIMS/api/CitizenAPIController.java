
package com.leapfrog.citizenIMS.api;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Path(value = "/citizen")
     public class CitizenAPIController {
   
     @GET
    @Path(value = "/index")
    @Produces(value = "text/HTML")
    public String test2() {
        String str = "<h2><i>Hello, this is from Citizen API</i></h2>";
        return str;

    }

    
}
