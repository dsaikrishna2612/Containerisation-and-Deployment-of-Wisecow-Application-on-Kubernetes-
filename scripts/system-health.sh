#!/bin/bash
echo "🔍 System Health Check"

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM=$(free | awk '/Mem/ {printf("%.2f"), $3/$2 * 100.0}')
DISK=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

echo "CPU Usage: $CPU%"
echo "Memory Usage: $MEM%"
echo "Disk Usage: $DISK%"

if (( $(echo "$CPU > 80" | bc -l) )); then echo "⚠️ High CPU usage"; fi
if (( $(echo "$MEM > 80" | bc -l) )); then echo "⚠️ High Memory usage"; fi
if (( $DISK > 80 )); then echo "⚠️ High Disk usage"; fi

echo "✅ System health check completed"
