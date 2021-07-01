package service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.utils.ExcelUtil;
import mapper.StudentMapper;
import model.ExcelBean;
import model.Student;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class StudentServiceImpl implements StudentService{
    @Autowired
    private StudentMapper studentMapper;
    @Override
    public List<Student> selectAll(int page,int size) {
        Page pages = PageHelper.startPage(page, size);
        List <Student> students = studentMapper.selectAll();

        return students;
    }

    @Override
    public int total() {
        int number = studentMapper.selectTotal();
        return number;
    }

    @Override
    public int insert(Student student){

//        Integer age = student.getAge();
//        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd");
//        String s=sdf.format(new java.util.Date);

        int i = studentMapper.insert(student);
        System.out.println(i);
        return i;
    }

    @Override
    public int delete(Integer sno) {
       int i = studentMapper.delete(sno);
        return i;
    }


    @Override
    public Integer deleteMany(String[] ids) {
        return studentMapper.deleteMany(ids);
    }



    @Override
    public void update(Student student) {
       studentMapper.update(student);
    }

    @Override
    public   Student selectSno(Integer sno) {
        Student student = studentMapper.selectSno(sno);
        return  student;
    }

    @Override
    public   List<Student> selectName(String name,int page,int size) {
        Page pages = PageHelper.startPage(page, size);
        List <Student> student = studentMapper.selectName(name);
        return  student;
    }

    @Override
    public List<Student> selectName(String dormitory) {
        return studentMapper.selectDormStudent(dormitory);
    }

    @Override
    public   List<Student> selectDorm(String dormitory,int page,int size) {
        Page pages = PageHelper.startPage(page, size);
        List <Student> student = studentMapper.selectDormitory(dormitory);
        return  student;
    }

    @Override
    public Student select_sno(Integer sno) {
        Student student = studentMapper.select_sno(sno);
        return student;
    }

    @Override
    public XSSFWorkbook exportExcelInfo() throws Exception {
        List<Map<String,Object>> list = studentMapper.findStudentObject();
        //System.out.println(list);
        List<ExcelBean> excel = new ArrayList<>();
        Map<Integer,List<ExcelBean>> map = new LinkedHashMap<>();
        //设置标题栏
        excel.add(new ExcelBean("序号","sno",0));
        excel.add(new ExcelBean("用户名","name",0));
        excel.add(new ExcelBean("性别", "sex", 0));
        excel.add(new ExcelBean("公寓","dormitory",0));
        excel.add(new ExcelBean("宿舍","dorm",0));
        excel.add(new ExcelBean("联系电话","telephone", 0));
        excel.add(new ExcelBean("入宿时间","entrance_time",0));
        excel.add(new ExcelBean("离宿时间","graduation_time",0));
        excel.add(new ExcelBean("紧急联系人","emergency_contact_number",0));
        excel.add(new ExcelBean("照片","photo",0));
        map.put(0,excel);
        String sheetName = "学生信息表";
        //调用ExcelUtil方法
        XSSFWorkbook xssfWorkbook = ExcelUtil.createExcelFile(Student.class, list, map, sheetName);
        System.out.println(xssfWorkbook);
        return xssfWorkbook;
    }


}
