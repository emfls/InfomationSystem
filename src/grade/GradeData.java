package grade;

public class GradeData {
	private String major;	//전공구분
	private String cname;	//강의이름
	private String pname;	//교수이름
	private int grade;	//학점
	private float gradenum;	//점수
	
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public float getGradenum() {
		return gradenum;
	}
	public void setGradenum(float gradenum) {
		this.gradenum = gradenum;
	}

	
}
