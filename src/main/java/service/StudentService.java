package service;

import model.Student;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.util.Date;
import java.util.List;

public interface StudentService {
    List<Student> selectAll(int page,int size);

    int total();

    int insert(Student student);

    int delete(Integer sno);

    Integer deleteMany(String[] ids);

    void update(Student student);

    Student selectSno(Integer sno);

    List<Student> selectName(String name,int page,int size);

    List<Student> selectName(String dormitory);

    List<Student> selectDorm(String dormitory,int page,int size);

    Student select_sno(Integer sno);

    XSSFWorkbook exportExcelInfo() throws Exception;
}
