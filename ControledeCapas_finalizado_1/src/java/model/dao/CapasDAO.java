/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import model.Capas;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import util.ConectaDB;
/**
 *
 * @author alunocmc
 */
public class CapasDAO {
   //Atributos
   // Sem atributos
    
    //Métodos
   public boolean insCapas(Capas p_capa) throws ClassNotFoundException {
        //Connectar
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();
                        //INSERT INTO capas ( codigo, formato,tamanho ,cor ) VALUES (  555 ,'quadrado', 10 ,'azul');           
                        
            String sql = "INSERT INTO capas ( codigo , formato , tamanho , cor ) VALUES ("
                                                                                     + p_capa.getCodigo()+
                                                                                    ", '" + p_capa.getFormato()+ 
                                                                                    "'," + p_capa.getTamanho()+ 
                                                                                    ",'" + p_capa.getCor()+  "')";
                         
            stmt.executeUpdate(sql); // Executa o SQL: Insert / Delete ou Update
                        
            conexao.close();
            return true;
        }catch(SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return false;
        }                 
    } 
     
   public Capas consCapaid(Capas capas) throws ClassNotFoundException{
    //Connectar
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();                                   
                        
            String sql = "SELECT * from capas where pk_id = '" + capas.getId()+ "'";
            ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select
            
            int n_reg = 0;
            while (rs.next()) {                 
                capas.setId(Integer.parseInt(rs.getString("pk_id")));  
                capas.setCodigo( Integer.parseInt(rs.getString("codigo")));  
                capas.setFormato(rs.getString("formato"));                
                capas.setTamanho( Integer.parseInt(rs.getString("tamanho")));                
                capas.setCor(rs.getString("cor"));               
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return capas;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    } 
  
   public List consCapaLista() throws ClassNotFoundException{
    //Connectar
        List lista = new ArrayList(); // Minha Lista
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();                                   
                        
            String sql = "SELECT * from capas ";
            ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select
            
            int n_reg = 0;
            while (rs.next()) {                 
                Capas capas = new Capas();
                capas.setId(Integer.parseInt(rs.getString("pk_id")));  
                capas.setCodigo( Integer.parseInt(rs.getString("codigo")));  
                capas.setFormato(rs.getString("formato"));                
                capas.setTamanho( Integer.parseInt(rs.getString("tamanho")));                
                capas.setCor(rs.getString("cor"));
                lista.add(capas);
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return lista;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
    }   
   
   public boolean exCapaId(Capas capa) throws ClassNotFoundException{
    // Connectar
    Connection conexao = null;
    try {
        conexao = ConectaDB.conectar(); // Abre a conexão
        Statement stmt = conexao.createStatement();                                   

        String sql = "DELETE from capas where pk_id = " + capa.getId();
        int rowsAffected = stmt.executeUpdate(sql); // Execute and capture the number of affected rows

        conexao.close();            

        return rowsAffected > 0; // Return true if any rows were deleted

    } catch(SQLException ex){
        System.out.println("Erro:" + ex);
        return false;
    }
}
   
   public boolean altcapa(Capas p_capa) throws ClassNotFoundException {
        //Connectar
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();
                        //UPDATE capas SET codigo = 555 , formato ='quadrado', tamanho = 5, cor = 'roxo' WHERE pkid = 5                      
            String sql = "UPDATE capas SET codigo = " + p_capa.getCodigo()+
                                       ", formato ='" + p_capa.getFormato()+ "'" +
                                       ", tamanho =" + p_capa.getTamanho()+ 
                                       ", cor     ='" + p_capa.getCor()+ "' WHERE pk_id = " + p_capa.getId();
                                       
            stmt.executeUpdate(sql); // Executa o SQL: Insert / Delete ou Update
                        
            conexao.close();
            return true;
        }catch(SQLException ex){
            System.out.println(" Exception: " + ex.toString());
            return false;
        } 
        
         
        
    } 
   public Capas buscarCapaPorId(int id) throws ClassNotFoundException {
    Connection conexao = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    Capas capa = null;
    try {
        conexao = ConectaDB.conectar();  // Conexão com o banco de dados
        String sql = "SELECT * FROM capas WHERE id = ?";
        stmt = conexao.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();

        if (rs.next()) {
            capa = new Capas();
            capa.setId(rs.getInt("id"));
            capa.setCodigo(rs.getInt("codigo"));
            capa.setFormato(rs.getString("formato"));
            capa.setCor(rs.getString("cor"));
            capa.setTamanho(rs.getInt("tamanho"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conexao != null) conexao.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return capa;
}
   public Capas consPesqRegIdent(Capas capa) throws ClassNotFoundException{
    //Connectar
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); // Abre a conexão
            Statement stmt = conexao.createStatement();                                   
                        
            String sql = "SELECT * from capas where pk_id = '" + capa.getId()+ "'";
            ResultSet rs = stmt.executeQuery(sql); //GO - Executar - Select
            
            int n_reg = 0;
            while (rs.next()) {                 
                capa.setId(Integer.parseInt(rs.getString("pk_id")));  
                capa.setCodigo(Integer.parseInt(rs.getString("codigo")));  
                capa.setFormato (rs.getString("formato"));
                capa.setTamanho(Integer.parseInt(rs.getString("tamanho")));
                capa.setCor(rs.getString("cor"));               
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return capa;
            }
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return null;
        }
 }
 
}

