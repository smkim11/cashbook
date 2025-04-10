package model;
import java.sql.*;
import dto.*;
import java.util.*;
public class CategoryDao {
	
	// 지출, 수입 전체 출력
	public ArrayList<Category> selectCategory(Paging p) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/cashbook", "root", "java1234");
		String sql = "select category_no categoryNo, kind, title, createdate from category order by createdate desc limit ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, p.getStartIdx());
		stmt.setInt(2, p.getRowPerPage());
		ResultSet rs = stmt.executeQuery();
		
		ArrayList<Category> list = new ArrayList<>();
		while(rs.next()) {
			Category c = new Category();
			c.setCategoryNo(rs.getInt("categoryNo"));
			c.setKind(rs.getString("kind"));
			c.setTitle(rs.getString("title"));
			c.setCreatedate(rs.getString("createdate"));
			
			list.add(c);
		}
		
		conn.close();
		
		return list;
	}
	
	// 번호에 해당하는 category정보
	public Category selectCategoryOne(int cnum) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/cashbook", "root", "java1234");
		String sql = "select category_no categoryNo, kind, title from category where category_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, cnum);
		ResultSet rs = stmt.executeQuery();
	
		Category c = new Category();
		if(rs.next()) {
			c.setCategoryNo(rs.getInt("categoryNo"));
			c.setKind(rs.getString("kind"));
			c.setTitle(rs.getString("title"));
		}
		
		conn.close();
		
		return c;
	}
	
	// 전체 개수
	public int totalCategory() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/cashbook", "root", "java1234");
		String sql = "select count(*) cnt from category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		
		int total = rs.getInt("cnt");
		
		conn.close();
		
		return total;
	}
	
	// 수입,지출 목록 추가
	public void insertCategory(Category c) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/cashbook", "root", "java1234");
		String sql = "insert into category(kind, title) values(?,?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, c.getKind());
		stmt.setString(2, c.getTitle());
		
		stmt.executeUpdate();
		
		conn.close();
	}
	
	// 수입 지출 리스트 제목 수정
	public void updateCategoryTitle(Category c) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/cashbook", "root", "java1234");
		String sql = "update category set title=? where category_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, c.getTitle());
		stmt.setInt(2, c.getCategoryNo());
		
		stmt.executeUpdate();
		
		conn.close();
	}
	
	// cash에 값이 없으면 category 삭제
	public void deleteCategory(int cnum) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/cashbook", "root", "java1234");
		conn.setAutoCommit(false);
		
		String sql ="SELECT COUNT(*) cnt from cash where category_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, cnum);
		ResultSet rs = stmt.executeQuery();
		rs.next();
		int row = rs.getInt("cnt");
		
		if(row==0) {
			String sql2 = "delete from category where category_no = ?";
			PreparedStatement stmt2 = conn.prepareStatement(sql2);
			stmt2.setInt(1, cnum);
			stmt2.executeUpdate();
			System.out.println("삭제 성공.");
		}
		else {
			System.out.println("cash테이블에 값이 있습니다.");
		}
		
		conn.commit();
		conn.close();
	}
}
