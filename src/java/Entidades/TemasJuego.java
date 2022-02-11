/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.util.List;
import org.json.JSONObject;

/**
 *
 * @author lueun
 */
public class TemasJuego {

    /**
     * @return the cod
     */
    public String getCod() {
        return cod;
    }

    /**
     * @param cod the cod to set
     */
    public void setCod(String cod) {
        this.cod = cod;
    }

    /**
     * @return the imag
     */
    public String getImag() {
        return imag;
    }

    /**
     * @param imag the imag to set
     */
    public void setImag(String imag) {
        this.imag = imag;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the preguntas
     */
    public List<Preguntas> getPreguntas() {
        return preguntas;
    }

    /**
     * @param preguntas the preguntas to set
     */
    public void setPreguntas(List<Preguntas> preguntas) {
        this.preguntas = preguntas;
    }
    
    private String cod;
    private String nombre;
    
    private String imag;
    private String content;
    
    private List<Preguntas> preguntas;
    
    public JSONObject toJson(){
        JSONObject json = new JSONObject();
        try{
            json.put("nombre", getNombre());
            json.put("preguntas", getPreguntas());
        }catch(Exception e){
            
        }
        return json;
    }
}
