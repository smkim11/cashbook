package model;
import java.sql.*;
import java.util.*;

import dto.Cash;
public class CashDao {
	
	// 해당하는 년, 월에 대한 정보
	public ArrayList<HashMap<String,Object>> selectCash(int year, int month) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/cashbook", "root", "java1234");
		String sql = "SELECT c.cash_no cashNO, c.category_no categoryNo, c.cash_date cashDate, "
					+"c.amount, c.memo, c.color, c.createdate, c.updatedate, ct.kind, ct.title "
					+"FROM cash c INNER JOIN category ct ON c.category_no = ct.category_no "
					+"where YEAR(c.cash_date)=? and MONTH(c.cash_date)=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,year);
		stmt.setInt(2,month);
		ResultSet rs = stmt.executeQuery();
		
		ArrayList<HashMap<String,Object>> list = new ArrayList<>();
		while(rs.next()) {
			HashMap<String,Object> m = new HashMap<>();
			m.put("cashNo", rs.getInt("cashNo"));
			m.put("categoryNo", rs.getInt("categoryNo"));
			m.put("cashDate", rs.getString("cashDate"));
			m.put("amount", rs.getInt("amount"));
			m.put("memo", rs.getString("memo"));
			m.put("color", rs.getString("color"));
			m.put("createdate", rs.getString("createdate"));
			m.put("updatedate", rs.getString("updatedate"));
			m.put("kind", rs.getString("kind"));
			m.put("title", rs.getString("title"));
			
			list.add(m);
		}
		
		conn.close();
		
		return list;
		
	}
}
