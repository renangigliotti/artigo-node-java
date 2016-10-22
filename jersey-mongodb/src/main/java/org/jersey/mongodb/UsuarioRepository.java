package org.jersey.mongodb;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import static com.mongodb.client.model.Filters.eq;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.bson.Document;

public class UsuarioRepository implements Serializable {

    private final Gson gson;

    public UsuarioRepository() {
        this.gson = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
    }

    public List<Usuario> findAll() {
        MongoClient client = new MongoClient("localhost", 27017);
        MongoDatabase database = client.getDatabase("artigo");
        MongoCollection<Document> collection = database.getCollection("users");
        List<Usuario> usuarios = new ArrayList();
        //usuarios.addAll(collection.find().forEach(user -> {
        //    return gson.fromJson(user.toJson()), Usuario.class);
        //}));

        return usuarios;
    }

    public Usuario findById(Long id) {
        MongoClient client = new MongoClient("localhost", 27017);
        MongoDatabase database = client.getDatabase("artigo");
        MongoCollection<Document> collection = database.getCollection("users");
        Usuario user = gson.fromJson(collection.find(eq("id", id)).first().toJson(), Usuario.class);

        return user;
    }
}
