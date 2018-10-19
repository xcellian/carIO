package wpk.carIO.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import wpk.carIO.dao.CarIODao;
import wpk.carIO.service.CarIOVO;

@Service
public class CarIOService {
	@Autowired
	CarIODao carIODao;

	public int insertCarIn(CarIOVO vo) throws Exception {
		return this.carIODao.insertCarIn(vo);
	}

	public int updateCarOut(CarIOVO vo) throws Exception {
		return this.carIODao.updateCarOut(vo);
	}

	public List<Map<String, String>> selectCarInfo(CarIOVO vo) throws Exception {
		List<Map<String, String>> ret = this.carIODao.selectCarInfo(vo);
		List<Map<String, String>> retPerm = this.carIODao.selectPerm(vo);
		
		if (retPerm.size() > 0) {
			ret.addAll(retPerm);
		}
		return ret;
	}
	
	public String selectPerm(CarIOVO vo) throws Exception {
		String perm = this.carIODao.selectPerm2(vo);
		return perm;
	}
}