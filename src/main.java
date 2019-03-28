import Controller.DoctorController;
import Model.Doctor;
import View.DoctorView;

public class main {
    public static void main(String[] args) {

        //fetch student record based on his roll no from the database
        Doctor model  = Doctor.singleton();

        //Create a view : to write student details on console
        DoctorView view = new DoctorView();

        DoctorController controller = new DoctorController(model, view);

        controller.updateView("Maincra");


        controller.updateView("Maincra");
    }
}
