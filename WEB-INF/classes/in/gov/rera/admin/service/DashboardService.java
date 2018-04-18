package in.gov.rera.admin.service;

import java.util.List;
import java.util.Map;

public interface DashboardService {

	 Map<String,String> getPieChartData();
	
	List<Object> getLineChartData();
	
	List<Object> getBarChartData();
	
	
}
