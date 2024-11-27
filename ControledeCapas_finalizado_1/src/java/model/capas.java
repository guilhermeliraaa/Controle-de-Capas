/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
/**
 *
 * @author alunocmc
 */
public class Capas {
    // Atrib
    private int id;
    private int codigo;
    private String formato;
    private int tamanho;
    private String cor ;
    
    //Métodos

    public void setId(int id) {
        this.id = id;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setFormato(String formato) {
        this.formato = formato;
    }

    public void setTamanho(int tamanho) {
        this.tamanho = tamanho;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public int getId() {
        return id;
    }

    public int getCodigo() {
        return codigo;
    }

    public String getFormato() {
        return formato;
    }

    public int getTamanho() {
        return tamanho;
    }

    public String getCor() {
        return cor;
    }

   
        
}
