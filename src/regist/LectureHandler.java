package regist;

import java.util.ArrayList;

public class LectureHandler {
	
	LectureDBBean ldb=LectureDBBean.getInstance();

	
	public ArrayList<LectureData> LectureListHandler(String sql)	//수강신청 리스트를 만든다
	{
		//LectureDBBean ldb=LectureDBBean.getInstance();	//강좌관련 DB작업을 하는 객체를 가져온다.	관련 페이지 applylist.jsp, regitlist.jsp
    	
    	ArrayList<LectureData> data=ldb.getLectureinDB(sql);
    	return data;
	}
	
	public int RegistHandler(String[] id, String stuNum) {	//수강신청결과를 DB에 등록한다.		관련페이지 regist.jsp
    	//LectureDBBean ldb=LectureDBBean.getInstance();
    	//boolean[] timeIndex=ldb.makeIndexTable(stuNum);
    	int size=id.length;
    	int result=0;
    	for(int i=0;i<size;i++)
    	{
    		boolean[] timeIndex=ldb.makeIndexTable(stuNum);
    		if(overlapHandler(timeIndex, ldb.getTimeIndex(id[i])) && overRegistCheck(id[i])) {
    			ldb.registDB("INSERT INTO registation (`lcode`, `stunum`, `year`, `quarter`) VALUES ('" + id[i] + "', '" + stuNum + "', '2017', '2')");
        		ldb.updataRegistCount(id[i],true);
        		ldb.registDB("INSERT INTO rollbook (`lcode`, `stunum`, `year`, `quarter`) VALUES ('" + id[i] + "', '" + stuNum + "', '2017', '2')");
        		ldb.registDB("INSERT INTO grade (`lcode`, `stunum`, `year`, `quarter`) VALUES ('" + id[i] + "', '" + stuNum + "', '2017', '2')");
        		result++;
    		}
    		else {
    			
    		}
    	}
    	return result;
	}
	
	private boolean overRegistCheck(String lcode) {
		return ldb.getMaxRegistCount(lcode)>ldb.getRegistCount(lcode);
	}
	

	
	public void CancelHandler(String id[], String stuNum) {	//수강신청 취소된 내용을 DB에서 삭제한다	관련페이지 applycancel.jsp
    	int size=id.length;	//배열길이를 가져온다.
    	//LectureDBBean ldb=LectureDBBean.getInstance();	//강좌관련 DB작업을하는 객체를 생성한다.
    	for(int i=0; i<size;i++)
    	{
    		//String sql="delete from registation where stunum="+stuNum+" and lcode="+id[i];	//학번과 강좌코드를 통해서 레코드 삭제관련 sql문을 만든다.
    		ldb.registDB("delete from registation where stunum="+stuNum+" and lcode="+id[i]);	//sql을 실행한다.
    		ldb.updataRegistCount(id[i],false);
    		ldb.registDB("delete from rollbook where stunum="+stuNum+" and lcode="+id[i]);
    		ldb.registDB("delete from grade where stunum="+stuNum+" and lcode="+id[i]);
    	}
	}
	
	public boolean overlapHandler(boolean[] index, String time ) {
		String[] splitIndex=new Schedule().splitIndexforSchedule(time);
		
		for(int i =0 ; i<splitIndex.length;i++) {
			if(index[Integer.parseInt(splitIndex[i])]==true)
				return false;
		}
		return true;
		
	}

}
