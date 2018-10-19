package wpk.carIO.dao;

import java.util.List;
import java.util.Map;

import wpk.carIO.service.CarIOVO;

public interface CarIODao {
	int insertCarIn(CarIOVO arg0) throws Exception;

	int updateCarOut(CarIOVO arg0) throws Exception;

	List<Map<String, String>> selectCarInfo(CarIOVO arg0) throws Exception;
	
	List<Map<String, String>> selectPerm(CarIOVO arg0) throws Exception;
	
	String selectPerm2(CarIOVO arg0) throws Exception;
}