/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

/**
 *
 * @author lueun
 */
public class EstudiantePregunta {

    /**
     * @return the opcion
     */
    public char getOpcion() {
        return opcion;
    }

    /**
     * @param opcion the opcion to set
     */
    public void setOpcion(char opcion) {
        this.opcion = opcion;
    }

    /**
     * @return the correo
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * @param correo the correo to set
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * @return the cod_pregunta
     */
    public int getCod_pregunta() {
        return cod_pregunta;
    }

    /**
     * @param cod_pregunta the cod_pregunta to set
     */
    public void setCod_pregunta(int cod_pregunta) {
        this.cod_pregunta = cod_pregunta;
    }

    private String correo;
    private int cod_pregunta;
    private char opcion;
}
