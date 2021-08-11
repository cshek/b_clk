// test sdcc for z80 trainer
// mm1
__sfr __at 0x40 GPIO1;

void delay(int j)
{
	int i;
	for(i=0; i<j; i++)
	continue;
}

main()
{
	int n=0;
	while(1)
	{
		GPIO1=n++;
		delay(500);
	}
}
