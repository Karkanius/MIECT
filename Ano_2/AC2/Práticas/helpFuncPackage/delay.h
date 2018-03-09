void delay(int ms) {
	for(; ms>0; ms--) {
		resetCoreTimer();
		while(readCoreTimer() < 20000);
	}
}
