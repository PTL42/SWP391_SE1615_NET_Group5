/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Department;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Long Thanh Pham
 */
public class DepartmentDAO extends ConnectDB{
    public ArrayList<Department> getDepartments() {
        ArrayList<Department> depts = new ArrayList<>();
        try {
            String sql = "SELECT d.did, d.dname FROM Department d";
            PreparedStatement stm = conn.prepareCall(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Department d = new Department();
                d.setId(rs.getString("did"));
                d.setName(rs.getString("dname"));
                depts.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return depts;
    }
}
