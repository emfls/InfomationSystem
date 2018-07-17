package grade;
import java.util.ArrayList;

import rollbook.RollbookDBBean;


public class GradeHandler {
	GradeDBBean gdb=GradeDBBean.getInstance();
	public ArrayList<GradeData> gradeListHandler(String stuNum)
	{
		String sql="select major, cname, pname, lecture.grade, gradenum from grade join professor join lecture on grade.lcode=lecture.lcode and lecture.pronum=professor.pronum where stunum="+stuNum;
		
		return gdb.getGradeinDB(sql);
	}
	
	public String gradenumToGrade(float gradenum) {
		if(gradenum>4.0)
			return "A+";
		else if(gradenum>3.5)
			return "A0";
		else if(gradenum>3.0)
			return "B+";
		else if(gradenum>2.5)
			return "B0";
		else if(gradenum>2.0)
			return "C+";
		else if(gradenum>1.5)
			return "C0";
		else if(gradenum>1.0)
			return "D+";
		else if(gradenum>0.5)
			return "D0";
		else
			return "F";
	}
	
	public float GradeToGradenum(String gradenum) {
		if(gradenum.equals("A+"))
			return 4.5F;
		else if(gradenum.equals("A0"))
			return 4.0F;
		else if(gradenum.equals("B+"))
			return 3.5F;
		else if(gradenum.equals("B0"))
			return 3.0F;
		else if(gradenum.equals("C+"))
			return 2.5F;
		else if(gradenum.equals("C0"))
			return 2.0F;
		else if(gradenum.equals("D+"))
			return 1.5F;
		else if(gradenum.equals("D0"))
			return 1.0F;
		else
			return 0.0F;
	}
	
	public float ScoreToGradeNumber(int score) {
		if(score>=95)
			return 4.5F;
		else if(score>=90)
			return 4.0F;
		else if(score>=85)
			return 3.5F;
		else if(score>=80)
			return 3.0F;
		else if(score>=75)
			return 2.5F;
		else if(score>=70)
			return 2.0F;
		else if(score>=65)
			return 1.5F;
		else if(score>=60)
			return 1.0F;
		else
			return 0.0F;
	}
	
	public ArrayList<String> ProfessorGradeDataHandler(String className) {
		String sql="select d.dname, g.stunum, s.name, g.score, g.gradenum from grade g join student s join department d join lecture l" + 
				" on g.stunum=s.stunum and s.dcode=d.dcode and l.lcode=g.lcode" + 
				" where l.cname=\""+className+"\"";
		
		return gdb.getGradeProfessorData(sql);
				
	}
	
	public void ProfessorGradeSave(String className, String[] stuNum, String[] score)
	{
		int lcode=gdb.changeCnameToLcode(className);
    	for(int i=0;i<stuNum.length;i++)
    	{
    		String sql="UPDATE grade SET `score`='"+stuNum[i]+"', `score`='"+score[i]+"', `gradeNum`='"+ScoreToGradeNumber(Integer.parseInt(score[i])) + "' WHERE `stunum`='"+ stuNum[i] +"' and lcode="+lcode;
    		gdb.saveGradeInDB(sql);		
    	}
	}
	
}
