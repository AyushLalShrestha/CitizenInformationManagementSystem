package com.leapfrog.citizenIMS.api;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Path(value = "officialviewer")
public class OfficialViewerAPIController {

    @GET
    @Path(value = "index")
    @Produces(value = "text/html")
    public String test() {
        String str = "tokenblahblah1123123";
        return str;
    }

}
