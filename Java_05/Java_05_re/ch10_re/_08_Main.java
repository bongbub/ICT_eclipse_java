package ch10_re;

// 2025.6.13	복습

// 제네릭메인
public class _08_Main {
	public static void main(String[] args) {
		
		// Powder
		_08_GenericPrinter<_08_Powder> poPrint = new _08_GenericPrinter<_08_Powder>();
		
		poPrint.setMetarial(new _08_Powder());
		_08_Powder po = poPrint.getMeterial();
		System.out.println(poPrint);
		
		
		// Plastic
		_08_GenericPrinter<_08_Plastic> plPrint = new _08_GenericPrinter<_08_Plastic>();
		
		plPrint.setMetarial(new _08_Plastic());
		_08_Plastic pl = plPrint.getMeterial();
		System.out.println(plPrint);
		
		
	}
}
