package org.jersey.postgres;

import java.util.List;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author renan
 */
@Path("users")
public class UsuarioResource {

    private static EntityManager entityManager;

    private static EntityManager getEntityManager() throws NamingException {
        if (UsuarioResource.entityManager == null) {
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("jersey-postgresPU");
            UsuarioResource.entityManager = emf.createEntityManager();
        }

        return UsuarioResource.entityManager;
    }

    @GET
    @Path("/")
    @Produces(MediaType.APPLICATION_JSON)
    public Response all() throws NamingException {
        List<Usuario> usuarios = getEntityManager().createNativeQuery("SELECT * FROM usuario").getResultList();
        return Response.ok(usuarios).build();
    }

    @GET
    @Path("{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response id(@PathParam(value = "id") Long id) throws NamingException {
        Object usuario = getEntityManager().createNativeQuery("SELECT * FROM usuario WHERE id = ?").setParameter(1, id).getSingleResult();
        return Response.ok(usuario).build();
    }

}
