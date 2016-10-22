package org.jersey.mongodb.producer;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.Serializable;
import javax.ws.rs.Produces;

/**
 *
 * @author renan
 */
public class GsonProducer implements Serializable{
    
    @Produces
    public Gson create(){
        return new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
    }
    
}
