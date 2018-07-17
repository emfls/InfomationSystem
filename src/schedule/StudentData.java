package schedule;

public class StudentData {
	private int stunum;	//학번
	private String pname;//교수이름
	private String cname;//강좌이름
	private String classroom;//강의실
	private String time;//강의시간
	private int year;//년도
	private int quarter;//학기
	private String name;//이름
	
	
	//교수이름
	public String getPName() {
		return pname;
	}
	public void setPName(String pname) {
		this.pname = pname;
	}
	
	//강좌이름
	public String getCName() {
		return cname;
	}
	public void setCName(String cname) {
		this.cname = cname;
	}
	
	//강의실
	public String getClassroom() {
		return classroom;
	}
	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}
	
	//강의시간
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	//년도
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	
	//학기
	public int getQuarter() {
		return quarter;
	}
	public void setQuarter(int quarter) {
		this.quarter = quarter;
	}
	//이름
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
