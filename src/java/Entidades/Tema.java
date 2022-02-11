/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

/**
 *
 * @author lueun
 */
public class Tema {

    /**
     * @return the size
     */
    public int getSize() {
        return size;
    }

    /**
     * @param size the size to set
     */
    public void setSize(int size) {
        this.size = size;
    }



    /**
     * @return the image_in
     */
    public InputStream getImage_in() {
        return image_in;
    }

    /**
     * @param image_in the image_in to set
     */
    public void setImage_in(InputStream image_in) {
        this.image_in = image_in;
    }


    private String cod;
    private String nombre;   
    private String image;
    private String content;
    private InputStream image_in;
    private int size;

    public String getCod() {
        return cod;
    }

    public void setCod(String cod) {
        this.cod = cod;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }        
}
