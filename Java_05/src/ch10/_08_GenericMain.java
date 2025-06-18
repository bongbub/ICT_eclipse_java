package ch10;


// 2025.6.13	7교시

public class _08_GenericMain {
	public static void main(String[] args) {
		_08_GenericPrinter<_08_Powder> powderPrinter = new _08_GenericPrinter<_08_Powder>();
		
		powderPrinter.setMaterial(new _08_Powder());
		_08_Powder powder = powderPrinter.getMaterial();
		System.out.println(powderPrinter);
		
		
		_08_GenericPrinter<_08_Plastic> plasticPrinter = new _08_GenericPrinter<_08_Plastic>();
		
		plasticPrinter.setMaterial(new _08_Plastic());
		_08_Plastic plastic = plasticPrinter.getMaterial();
		System.out.println(plasticPrinter);
		
	}

}
