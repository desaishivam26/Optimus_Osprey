#!/system/bin/sh

# custom busybox installation shortcut
bb=/sbin/bb/busybox;

# Set TCP westwood
echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control

# Set IOSched
echo "bfq" > /sys/block/mmcblk0/queue/scheduler
echo "512" > /sys/block/mmcblk0/bdi/read_ahead_kb

# Process Reclaim
echo "1" > /sys/module/process_reclaim/parameters/enable_process_reclaim
echo "50" > /sys/module/process_reclaim/parameters/pressure_min
echo "70" > /sys/module/process_reclaim/parameters/pressure_max
echo "512" > /sys/module/process_reclaim/parameters/per_swap_size
echo "30" > /sys/module/process_reclaim/parameters/swap_opt_eff

# Misc
echo "0" > /sys/module/wakeup/parameters/enable_wlan_rx_wake_ws
echo "0" > /sys/module/wakeup/parameters/enable_wlan_ctrl_wake_ws
echo "0" > /sys/module/wakeup/parameters/enable_wlan_wake_ws
echo "20" > /sys/kernel/mm/uksm/max_cpu_percentage
echo "0" > /sys/kernel/mm/uksm/run
echo "50000" >  /sys/devices/system/cpu/cpufreq/optimus/sampling_rate
