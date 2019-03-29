package Model;

import java.util.Comparator;

public class SicknessComparator implements Comparator<Sickness> {
	
	@Override
	public int compare(Sickness o1, Sickness o2) {
		// TODO Auto-generated method stub
		return o1.getName().compareTo( o2.getName());
	}
}
