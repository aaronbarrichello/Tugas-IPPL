/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hp
 */
public class Spesification {
    private String sistemOperasi;
    private String processor;
    private String grafis;
    private String tampilan;
    private String memori;
    private String penyimpanan;
    private String baterai;

    public Spesification(String sistemOperasi, String processor, String grafis, String tampilan, String memori, String penyimpanan, String baterai) {
        this.sistemOperasi = sistemOperasi;
        this.processor = processor;
        this.grafis = grafis;
        this.tampilan = tampilan;
        this.memori = memori;
        this.penyimpanan = penyimpanan;
        this.baterai = baterai;
    }

    public void setSistemOperasi(String sistemOperasi) {
        this.sistemOperasi = sistemOperasi;
    }

    public void setProcessor(String processor) {
        this.processor = processor;
    }

    public void setGrafis(String grafis) {
        this.grafis = grafis;
    }

    public void setTampilan(String tampilan) {
        this.tampilan = tampilan;
    }

    public void setMemori(String memori) {
        this.memori = memori;
    }

    public void setPenyimpanan(String penyimpanan) {
        this.penyimpanan = penyimpanan;
    }

    public void setBaterai(String baterai) {
        this.baterai = baterai;
    }

    public String getSistemOperasi() {
        return sistemOperasi;
    }

    public String getProcessor() {
        return processor;
    }

    public String getGrafis() {
        return grafis;
    }

    public String getTampilan() {
        return tampilan;
    }

    public String getMemori() {
        return memori;
    }

    public String getPenyimpanan() {
        return penyimpanan;
    }

    public String getBaterai() {
        return baterai;
    } 
}
