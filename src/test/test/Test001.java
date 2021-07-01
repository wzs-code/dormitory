import model.Dorm;

public class Test001 {
    public static void main(String []args) throws ClassNotFoundException, IllegalAccessException, InstantiationException {
        Class<?> aClass=  Class.forName("model.Dorm");
        Dorm dorm = (Dorm) aClass.newInstance();
        System.out.println(dorm);
    }
}
