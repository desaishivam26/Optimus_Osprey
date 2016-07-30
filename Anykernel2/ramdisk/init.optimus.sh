#!/system/bin/sh

# custom busybox installation shortcut
bb=/sbin/bb/busybox;

# Set TCP westwood
echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control

# Set IOSched
echo "bfq" > /sys/block/mmcblk0/queue/scheduler
echo "512" > /sys/block/mmcblk0/bdi/read_ahead_kb

#Interactive setup
write /sys/devices/system/cpu/cpufreq/interactive/max_freq_hysteresis 40000
write /sys/devices/system/cpu/cpufreq/interactive/io_is_busy 1
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load 1
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif 1
write /sys/devices/system/cpu/cpu0/cpufreq/interactive/ignore_hispeed_on_notif 1
replace_line init.target.rc "write /sys/devices/system/cpu/cpufreq/interactive/min_sample_time 60000" "write /sys/devices/system/cpu/cpufreq/interactive/min_sample_time 40000"
replace_line init.target.rc "write /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load 80" "write /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load 85"

# CPU BOOST
echo "40" > /sys/module/cpu_boost/parameters/input_boost_ms
echo "1094400" > /sys/module/cpu_boost/parameters/input_boost_freq
echo "20" > /sys/module/cpu_boost/parameters/boost_ms
echo "998400" > /sys/module/cpu_boost/parameters/sync_threshold
