package Controller;

import Model.Doctor;
import View.DoctorView;

public class DoctorController {
    private Doctor model;
    private DoctorView view;

    public DoctorController(Doctor model, DoctorView view){
        this.model = model;
        this.view = view;
    }

    public void updateView(String Phrase){
        view.printDoctorMessage(model.getPhrase(Phrase));
    }
}
