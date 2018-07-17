package rollbook;

import java.util.ArrayList;

public class RollbookHandler {
	RollbookDBBean rdb=RollbookDBBean.getInstance();
	public ArrayList<RollbookData> RollbookListHandler(String stuNum)	//학생별 출석부를 조회하기 위한 메소드
	{
		String sql="select cname, dname, rollbook.stunum, student.name, s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15 from rollbook join department join student join lecture on student.dcode=department.dcode and rollbook.stunum=student.stunum and lecture.lcode=rollbook.lcode where rollbook.stunum="+stuNum;
		//RollbookDBBean rdb=RollbookDBBean.getInstance();
		
		return rdb.getRollbookinDB(sql);
	}
	
	public String LectureListHandler(String proNum) {
		String sql="select cname from lecture where pronum=" + proNum;
		//RollbookDBBean rdb=RollbookDBBean.getInstance();
		return rdb.getLectureList(sql);
	}
	
	public ArrayList<String> ProfessorCheckDataHandler(String proNum, String className) {
		String sql="select dname, rollbook.stunum, name, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15 "
				+ "from rollbook join student join department join lecture "
				+ "on rollbook.stunum=student.stunum and student.dcode=department.dcode and lecture.lcode=rollbook.lcode "
				+ "where pronum=" + proNum + " and lecture.cname="+ "'" +className + "'";
		
		return rdb.getRollbookProfessorData(sql);
				
	}
	
	public void ProfessorCheckingSave(String className, String[] stuNum, String[] s1, String[] s2, String[] s3, String[] s4, String[] s5, String[] s6, String[] s7, String[] s8, String[] s9, String[] s10, String[] s11, String[] s12, String[] s13, String[] s14, String[] s15)
	{
		int lcode=rdb.changeCnameToLcode(className);
    	for(int i=0;i<s1.length;i++)
    	{
    		String sql="UPDATE rollbook SET `s1`='"+s1[i]+"', `s2`='"+s2[i]+"', `s3`='"+s3[i]+"', `s4`='"+s4[i]+"',`s5`='"+s5[i]+"',`s6`='"+s6[i]+"',`s7`='"+s7[i]+"',`s8`='"+s8[i]+"',`s9`='"+s9[i]+"',`s10`='"+s10[i]+"',`s11`='"+s11[i]+"',`s12`='"+s12[i]+"',`s13`='"+s13[i]+"',`s14`='"+s14[i]+"',`s15`='"+s15[i]+"' WHERE `stunum`='"+ stuNum[i] +"' and lcode="+lcode;
    		rdb.saveCheckingInDB(sql);
		
    	}
	}
}
