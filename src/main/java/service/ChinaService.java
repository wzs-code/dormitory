package service;

import model.China;

import java.util.List;

public interface ChinaService {

    List<China> getProvince();

    List<China> getCity(String province);

    List<China> getArea(String city);
}
