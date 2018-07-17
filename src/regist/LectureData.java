package regist;
//강좌관련 데이터를 저장하는 클래스
public class LectureData {
	private String cname;	//과목명
	private String major;	//전공구분
	private int classSize;	//제한인원
	private int grade;	//학점
	private String time;	//강의시간
	private int like;	//좋아요
	private String classroom;	//강의실
	private int lcode;	//강좌코드
	private int open;	//개설여부
	private String campus;	//캠퍼스
	private String pname;	//교수이름
	private String dname;	//학과이름
	private int regist;	//신청수
	
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public int getClassSize() {
		return classSize;
	}
	public void setClassSize(int classSize) {
		this.classSize = classSize;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public String getClassroom() {
		return classroom;
	}
	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}
	public int getLcode() {
		return lcode;
	}
	public void setLcode(int lcode) {
		this.lcode = lcode;
	}
	public int getOpen() {
		return open;
	}
	public void setOpen(int open) {
		this.open = open;
	}
	public String getCampus() {
		return campus;
	}
	public void setCampus(String campus) {
		this.campus = campus;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public int getRegist() {
		return regist;
	}
	public void setRegist(int regist) {
		this.regist = regist;
	}

}
