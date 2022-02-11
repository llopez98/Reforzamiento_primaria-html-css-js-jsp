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
public class Respuestas {

    /**
     * @return the img
     */
    public String getImg() {
        return img;
    }

    /**
     * @param img the img to set
     */
    public void setImg(String img) {
        this.img = img;
    }



    /**
     * @return the resp
     */
    public char getResp() {
        return resp;
    }

    /**
     * @param resp the resp to set
     */
    public void setResp(char resp) {
        this.resp = resp;
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
     * @return the id_opc
     */
    public char getId_opc() {
        return id_opc;
    }

    /**
     * @param id_opc the id_opc to set
     */
    public void setId_opc(char id_opc) {
        this.id_opc = id_opc;
    }

    /**
     * @return the opc_resp
     */
    public String getOpc_resp() {
        return opc_resp;
    }

    /**
     * @param opc_resp the opc_resp to set
     */
    public void setOpc_resp(String opc_resp) {
        this.opc_resp = opc_resp;
    }

    /**
     * @return the retroali
     */
    public String getRetroali() {
        return retroali;
    }

    /**
     * @param retroali the retroali to set
     */
    public void setRetroali(String retroali) {
        this.retroali = retroali;
    }
    private int cod_preg;
    private char id_opc;
    private String opc_resp;
    private char resp;
    private String retroali;
    private String img;
}
