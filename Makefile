$(EXE): $(OBJS)
	$(CC) -Fe$@ $** setargv.obj /link /DEBUG /PDB:$(EXE:.exe=.pdb)

clean:
	del $(OBJS) $(EXE) *.ilk *.pdb *.csv *.log *.bad *.zip *.csv
