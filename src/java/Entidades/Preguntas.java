/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.util.List;

/**
 *
 * @author lueun
 */
public class Preguntas {

    /**
     * @return the image
     */
    public byte[] getImage() {
        return image;
    }

    /**
     * @param image the image to set
     */
    public void setImage(byte[] image) {
        this.image = image;
    }

    
    /**
     * @return the respuestas
     */
    public List<Respuestas> getRespuestas() {
        return respuestas;
    }

    /**
     * @param respuestas the respuestas to set
     */
    public void setRespuestas(List<Respuestas> respuestas) {
        this.respuestas = respuestas;
    }

    /**
     * @return the cod_preg
     */
    public int getCod_preg() {
        return cod_preg;
    }

    /**
     * @param cod_preg the cod_preg to set
     */
    public void setCod_preg(int cod_preg) {
        this.cod_preg = cod_preg;
    }

    /**
     * @return the cod_tema
     */
    public String getCod_tema() {
        return cod_tema;
    }

    /**
     * @param cod_tema the cod_tema to set
     */
    public void setCod_tema(String cod_tema) {
        this.cod_tema = cod_tema;
    }

    /**
     * @return the pregunta
     */
    public String getPregunta() {
        return pregunta;
    }

    /**
     * @param pregunta the pregunta to set
     */
    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
    }
    private int cod_preg;
    private String cod_tema;
    private String pregunta;
    private byte [] image;
    
    
    private List<Respuestas> respuestas;
    
    
}
