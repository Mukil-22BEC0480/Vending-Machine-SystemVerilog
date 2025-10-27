import os

print("🔧 Compiling vending machine design...")
os.system("iverilog -o vending_sim vending_machine.v tb_vending_machine.sv")

print("▶️ Running simulation...")
os.system("vvp vending_sim")

print("✅ Simulation complete. View waveform using:")
print("   gtkwave vending_wave.vcd")
