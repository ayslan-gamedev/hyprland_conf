#!/bin/bash

# Obtém o volume do dispositivo de saída (supondo que você tenha um mixer chamado 'Master')
volume_sound=$(amixer get Master | grep -oP '\d+%' | head -1)

# Obtém se o dispositivo de saída está mudo
mute_status_sound=$(amixer get Master | grep '\[off\]' | wc -l)

if [ "$mute_status_sound" -eq 1 ]; then
    volume_sound="MUTE"
else
    volume_sound=$volume_sound
fi

# Obtém o volume do dispositivo de captura (supondo que você tenha um mixer chamado 'Capture')
volume_mic=$(amixer get Capture | grep -oP '\d+%' | head -1)

# Obtém se o dispositivo de captura está mudo
mute_status_mic=$(amixer get Capture | grep '\[off\]' | wc -l)

if [ "$mute_status_mic" -eq 1 ]; then
    volume_mic="MUTE"
else
    volume_mic=$volume_mic
fi

# Exibe as informações no formato desejado
echo " $volume_sound   $volume_mic"
