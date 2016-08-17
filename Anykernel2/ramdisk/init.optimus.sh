#!/system/bin/sh

# custom busybox installation shortcut
bb=/sbin/bb/busybox;

# Set TCP westwood
echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control

# Set IOSched
echo "bfq" > /sys/block/mmcblk0/queue/scheduler
echo "512" > /sys/block/mmcblk0/bdi/read_ahead_kb

# Interactive Gov
echo "1" > /sys/devices/system/cpu/cpufreq/interactive/use_sched_load
echo "1" > /sys/devices/system/cpu/cpufreq/interactive/use_migration_notif
echo "1" > /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
echo "1" > /sys/devices/system/cpu/cpufreq/interactive/ignore_hispeed_on_notif
echo "40000" > /sys/devices/system/cpu/cpufreq/interactive/max_freq_hysteresis

# CPU BOOST
echo "40" > /sys/module/cpu_boost/parameters/input_boost_ms
echo "1094400" > /sys/module/cpu_boost/parameters/input_boost_freq
echo "20" > /sys/module/cpu_boost/parameters/boost_ms
echo "998400" > /sys/module/cpu_boost/parameters/sync_threshold
