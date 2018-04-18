package in.gov.rera.common.util;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


import org.springframework.stereotype.Service;

@Service
public class DateUtil {
	
	
	public static int getYearBack(int inp){
		int year=0;
		try{
		year=	Calendar.getInstance().get(Calendar.YEAR)-inp;
		
			
		}catch(Exception E){
			E.printStackTrace();
		}
		
		return year;
		
	}

	public static String getDateString(Calendar cal){
		if(cal!=null){
		SimpleDateFormat dat=new SimpleDateFormat("yyyy-MM-dd");
		return dat.format(cal.getTime());
		}
		
		return " Date Not exist ";
	}
	
	public static String getDateString(Date cal){
		if(cal!=null){
		SimpleDateFormat dat=new SimpleDateFormat("yyyy-MM-dd");
		return dat.format(cal);
		}
		
		return " Date Not exist ";
	}
}
