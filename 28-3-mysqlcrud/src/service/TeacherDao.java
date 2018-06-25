package service;

import service.Teacher;
import java.sql.*;


public class TeacherDao {
	// ��ü�������� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rsSelectForCount = null;
	
	public void teacherInsert(Teacher teacher) throws ClassNotFoundException, SQLException {
		// mysql ����̹� �ε�
		Class.forName("com.mysql.jdbc.Driver");
		
		// DB ���� 
		// �̺κ��� Ŭ������ ���� ��ü�� ���� ���� �� ���� ���� ������ ?
		String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
		String dbUser = "root";
		String dbPw = "java0000";
		conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
		// teacher_no�� �ڵ�������Ű�� ���� ����Ϸ��� ����
		// teacher_no�� �ִ��� ��ȸ
		String sqlSelectForMaxTeacher = "SELECT MAX(teacher_no) as max_teacher FROM teacher";
		pstmt = conn.prepareStatement(sqlSelectForMaxTeacher);
		
		// ���� ���� ����
		rsSelectForCount = pstmt.executeQuery();
		
		// �����͸� �������� ���� Ŀ���� �ѱ�
		rsSelectForCount.next();
		
		// teacher_no�� �ִ񰪿��� +1�� ������ �ڵ����� ����
		// auto_increament�� ���� ����ϱ� �����ؼ� �̷��� �������.
		teacher.setTeacherNo(rsSelectForCount.getInt("max_teacher") + 1);
		
		// teacherNo ���� �� �׽�Ʈ
		System.out.println("teacherNo from teacherDTO: " + teacher.getTeacherNo());
		
		// teacher ���̺� ���ڵ带 �����ϴ� ���� �غ�
		String sqlInsertTeacher = "INSERT INTO teacher(teacher_no,teacher_name,teacher_age) VALUES(?,?,?)";
		pstmt = conn.prepareStatement(sqlInsertTeacher);
		
		// ?�� �� ����
		pstmt.setInt(1, teacher.getTeacherNo());
		pstmt.setString(2, teacher.getTeacherName());
		pstmt.setInt(3, teacher.getTeacherAge());
		
		// ���ڵ� ���� ���� ����
		// ���� �� ��ȯ �Ǵ� ���� �ش� ������ ���� �����Ǵ�(?) ���� ���� (���� ��� ���ԵǴ� ���� ����)
		int resultUpdate = pstmt.executeUpdate();
		
		// ���ԵǴ� ���ڵ��� ���� ���
		System.out.println("teacher ���̺� ���Ե� �� ���� : " + resultUpdate);
	}
}
