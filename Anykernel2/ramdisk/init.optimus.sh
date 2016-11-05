#!/system/bin/sh

# custom busybox installation shortcut
bb=/sbin/bb/busybox;

# Set TCP westwood
echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control

# Set IOSched
echo "bfq" > /sys/block/mmcblk0/queue/scheduler
echo "512" > /sys/block/mmcblk0/bdi/read_ahead_kb

# Cpufreq tuning
echo "800000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo "20000" > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
echo "60000" > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
echo "998400" > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
echo "80" > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
echo "20000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
echo "60000" > /sys/devices/system/cpu/cpufreq/interactive/boostpulse_duration
echo "80" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
