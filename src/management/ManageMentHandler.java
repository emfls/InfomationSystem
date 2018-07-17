package management;

import java.util.ArrayList;

public class ManageMentHandler {
	ManagementDBBean mdb=ManagementDBBean.getInstance();
	
	public String DepartmentListHandler() {
		String sql="select dname from department";
		return mdb.getClassList(sql);
	}
	
	public ArrayList<ProfessorListData> ProfessorManagemenlisttHandler(String departName) {
		String sql="select p.pronum, d.dname, pname, lab, tel from professor p join department d on p.dcode=d.dcode where dname='" +departName+"'";
		return mdb.getProfessorManagementList(sql);				
	}
	
	public ArrayList<StudentListData> StudentManagemenlisttHandler(String departName) {
		String sql="select stunum, d.dname, name, birth, tel from student s join department d on d.dcode=s.dcode where dname='" +departName+"'";
		return mdb.getStudentManagementList(sql);				
	}
	
	public boolean professorUpdate(String proname, String dname, String lab, String tel, String pronum)
	{
		int dcode=mdb.getDcode(dname);
		if(dcode==0)
			return false;
		String sql="update professor set pname='"+proname+"', dcode="+dcode+", lab= '" + lab +"', tel='"+tel+"' where pronum="+pronum;
		mdb.registDB(sql);
		return true;
	}
	
	public boolean professorInsert(String pronum, String passwd, String proname, String birth, String address, String dname, String email, String lab, String tel) {
		int dcode=mdb.getDcode(dname);
		if(dcode==0)
			return false;
		String sql="INSERT INTO `dbase`.`professor` (`pronum`, `pname`, `birth`, `address`, `tel`, `email`, `passwd`, `dcode`, `lab`) VALUES ('"+pronum+"', '" + proname + "', '" + birth + "', '"+ address +"', '" + tel + "', '"+ email +"', '"+ passwd +"', '"+ dcode +"', '"+ lab +"')";
		mdb.registDB(sql);
		return true;
	}
	
	public StudentRegistData getStudentData(String stunum) {
		String sql = "SELECT * from student where stunum = " + stunum;
		return mdb.getStudentModifyList(sql);
	}
	
	public boolean studentUpdate(String dname, String name, String address, String birth, String tel, String professor, String status, String email, String stunum) {
		int dcode=mdb.getDcode(dname);
		if(dcode==0)
			return false;
		String sql="update student set name = '"+name+"', address='"+address+"', birth='"+birth+"', tel='" + tel +"', professor='"+professor+"', staus='"+status+"', email='"+email+"', dcode='"+ dcode +"' where stunum = " +stunum;
		mdb.registDB(sql);
		return true;
	}
	
	public boolean studentInsert(String stunum, String name, String address, String birth, String professor, String year, String passwd, String tel, String status, String email, String dname) {
		int dcode=mdb.getDcode(dname);
		if(dcode==0)
			return false;
		String sql="INSERT INTO `dbase`.`student` (`stunum`, `name`, `address`, `birth`, `professor`, `year`, `passwd`, `tel`, `staus`, `email`, `dcode`) VALUES ('"+stunum+"', '"+name+"', '"+address+"', '"+birth+"', '"+professor+"', '"+year+"', '"+passwd+"', '"+tel+"', '"+status+"', '"+email+"', '"+dcode+"')";
		mdb.registDB(sql);
		return true;
	}
	
	public void studentDelete(String stunum) {
		String sql="delete from student where stunum =" + stunum;
		mdb.registDB(sql);
	}
	
	public void professortDelete(String pronum) {
		String sql="delete from professor where pronum =" + pronum;
		mdb.registDB(sql);
	}
	
	public void lectureDelete(String lcode) {
		String sql="delete from lecture where lcode =" + lcode;
		mdb.registDB(sql);
	}
	
	public void departmentDelete(String dcode) {
		String sql="delete from department where dcode =" + dcode;
		mdb.registDB(sql);
	}
	
	public boolean lectureUpdate(String campus, String major, String department, String classname, String grade, String pname, String classroom, String classsize, String time, String lcode) {
		int dcode=mdb.getDcode(department);
		int pronum=mdb.getPronum(pname);
		if(pronum==0 || dcode==0)
			return false;
		String sql="update lecture set campus = '"+campus+"', major='"+major+"', dcode='"+dcode+"', cname='" + classname +"', grade='"+grade+"', pronum='"+pronum+"', classroom='"+classroom+"', classsize='"+ classsize+ "', time='"+ time +"' where lcode = " +lcode;
		mdb.registDB(sql);
		return true;
	}
	
	public boolean lectureInsert(String campus, String major, String department, String classname, String grade, String pname, String classroom, String classsize, String time, String lcode) {
		int dcode=mdb.getDcode(department);
		int pronum=mdb.getPronum(pname);
		if(pronum==0 || dcode==0)
			return false;
		String sql="INSERT INTO `dbase`.`lecture` (`lcode`, `cname`, `major`, `classsize`, `grade`, `time`, `dcode`, `open`, `classroom`, `pronum`, `campus`) VALUES ('"+ lcode +"', '"+ classname +"', '"+ major +"', '"+ classsize +"', '"+ grade +"', '"+time+"', '"+ dcode +"', '1', '"+ classroom +"', '"+ pronum+"', '"+campus+"')";
		mdb.registDB(sql);
		return true;
	}
	
	public ArrayList<DepartmentData> DepartmentDataListHandler(){
		String sql="select * from department";
		return mdb.getDepartmentData(sql);
	}
	
	public boolean departmentUpdate(String dcode, String dname) {

		String sql="update department set dname='"+dname+"' where dcode = " +dcode;
		mdb.registDB(sql);
		return true;
	}
	
	public boolean departmentInsert(String dcode, String dname) {

		String sql="INSERT INTO `dbase`.`department` (`dcode`, `dname`) VALUES ('"+ dcode +"', '"+dname+"')";
		mdb.registDB(sql);
		return true;
	}
}
