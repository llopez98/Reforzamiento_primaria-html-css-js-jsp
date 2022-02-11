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
public class Grupos {

    /**
     * @return the cod_grupo
     */
    public int getCod_grupo() {
        return cod_grupo;
    }

    /**
     * @param cod_grupo the cod_grupo to set
     */
    public void setCod_grupo(int cod_grupo) {
        this.cod_grupo = cod_grupo;
    }

    /**
     * @return the nivel
     */
    public int getNivel() {
        return nivel;
    }

    /**
     * @param nivel the nivel to set
     */
    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    /**
     * @return the correo_maestro
     */
    public String getCorreo_maestro() {
        return correo_maestro;
    }

    /**
     * @param correo_maestro the correo_maestro to set
     */
    public void setCorreo_maestro(String correo_maestro) {
        this.correo_maestro = correo_maestro;
    }
    private int cod_grupo;
    private int nivel;
    private String correo_maestro;
}
