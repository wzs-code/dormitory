package service;

import mapper.ChinaMapper;
import model.China;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChinaServiceImpi implements ChinaService {

    @Autowired
    private ChinaMapper chinaMapper;

    @Override
    public List<China> getProvince() {
        return chinaMapper.getProvince();
    }

    @Override
    public List<China> getCity(String province) {
        return chinaMapper.getCity(province);
    }

    @Override
    public List<China> getArea(String city) {
        return chinaMapper.getArea(city);
    }
}
