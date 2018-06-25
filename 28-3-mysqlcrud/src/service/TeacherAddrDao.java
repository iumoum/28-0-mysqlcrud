package service;

import service.TeacherAddr;
import service.Teacher;
import java.sql.*;


public class TeacherAddrDao {
	// ��ü�������� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rsSelectForCount = null;
		
	public void teacherAddressInsert(TeacherAddr teacherAddr) throws ClassNotFoundException, SQLException {
		// mysql ����̹� �ε�
		Class.forName("com.mysql.jdbc.Driver");
		
		// DB ���� 
		// �̺κ��� Ŭ������ ���� ��ü�� ���� ���� �� ���� ���� ������ ?
		String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
		String dbUser = "root";
		String dbPw = "java0000";
		conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
		// teacher_address_no�� �ڵ�������Ű�� ���� ����Ϸ��� ����
		// teacher_address_no�� �ִ��� ��ȸ
		String sqlSelectForMaxTeacherAddress = "SELECT MAX(teacher_address_no) as max_teacher_address FROM teacher_address";
		pstmt = conn.prepareStatement(sqlSelectForMaxTeacherAddress);
		
		// ���� ���� ����
		rsSelectForCount = pstmt.executeQuery();
		
		// �����͸� �������� ���� Ŀ���� �ѱ�
		rsSelectForCount.next();
		
		// teacher_address_no�� �ִ񰪿��� +1�� ������ �ڵ����� ����
		// auto_increament�� ���� ����ϱ� �����ؼ� �̷��� �������.
		teacherAddr.setTeacherAddrNo(rsSelectForCount.getInt("max_teacher_address") + 1);
		
		// teacherAddressNo ���� �� �׽�Ʈ
		System.out.println("teacherAddressNo from teacherAddrDTO : " + teacherAddr.getTeacherAddrNo() );
		
		// teacher_address ���̺� ���ڵ带 �����ϴ� ���� �غ�
		String sqlInsertTeacherAddress = "INSERT INTO teacher_address(teacher_address_no,teacher_no,teacher_address_content) VALUES(?,?,?)";
		pstmt = conn.prepareStatement(sqlInsertTeacherAddress);
		
		// ?�� �� ����
		pstmt.setInt(1, teacherAddr.getTeacherAddrNo());
		pstmt.setInt(2, teacherAddr.getTeacherNo());
		pstmt.setString(3, teacherAddr.getTeacherAddrContent());
		
		// ���ڵ� ���� ���� ����
		// ���� �� ��ȯ �Ǵ� ���� �ش� ������ ���� �����Ǵ�(?) ���� ���� (���� ��� ���ԵǴ� ���� ����)
		int resultUpdate = pstmt.executeUpdate();
		
		// ���ԵǴ� ���ڵ��� ���� ���
		System.out.println("teacher_address ���̺� ���Ե� �� ���� : " + resultUpdate);
	}
}
