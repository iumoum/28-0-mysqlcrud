//������ ������
package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;
import service.Student;
// ����Ʈ�Ѵ�.
public class StudentDao {
	
	public Student insertStudent(Student stu){
	//student ���� Ÿ������ insertStudent �޼��带 ������ �Ŀ� student Ŭ���� ������ Ÿ�� ���� ������� ���� stu�� �����Ѵ�.	
	//student==Student.java ���� ��Ʈ�� ���� name�� ��Ʈ ���� age�� set, geter �Ǿ��ִ� Ŭ����.
		int countNo = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		//�ʱⰪ ����.
		
			try {
				Class.forName("com.mysql.jdbc.Driver");
				//����̹� �ε�
			} catch (ClassNotFoundException e) {
				//����ó�� ������.
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			// TODO Auto-generated catch block
			
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
		String dbUser = "sqlidkjy";
		String dbPass = "sqlpwkjy";
		
		//db������ �ϱ����� ������ ������ ������ �����Ѵ�.
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("SELECT COUNT(*) as countNo  FROM student");
			
			rs = pstmt.executeQuery();
			//Connection ��ü�� ������ ���� conn�� db���� �����͵��� �����ϰ� PreparedStatement ��ü�� ������ pstmt�� �������� �Է�.(executeQuery�� ���̺��� �ҷ��´�)
			if(rs.next()) {
				countNo = rs.getInt("countNo") +1;
			}
			//���� ����. �ʱⰪ�� �����ص� countNo ������ student ���̺� �Էµ� coumtNo ���� ����(+1) �� ���� ����
			pstmt2 = conn.prepareStatement("INSERT INTO student VALUES (?, ?, ?)");
			pstmt2.setInt(1, countNo);
			pstmt2.setString(2, stu.getName());
			pstmt2.setInt(3, stu.getAge());
			
			System.out.println(pstmt2);
			pstmt2.executeUpdate();
			//pstmt2������ ���õ� name�� age�� �Է��ϰ� ���� countNo�� ���� �� ���� ����.
			
		}catch (SQLException e1) {//*����. ���� ��ȯ�� throw.
			System.out.println("sql�� ������");
			e1.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException e1) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e1) {}
			if (pstmt2 != null) try { pstmt2.close(); } catch(SQLException e1) {}
			if (conn != null) try { conn.close(); } catch(SQLException e1) {}
		
		//��ü ����.
		}
		return stu;
		//finally �ȿ� return�� �ְԵǸ� ��� �߹Ƿ� try-catch-finally�� ��� ������ return.
	}

}
