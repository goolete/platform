eeg = EEG('COM1');
eeg.mark_device(1);
pause(1)
eeg.mark_device(5);

fnirs = FNIRS('COM2');
fnirs.mark_device(1);
pause(1)
fnirs.mark_device(5);