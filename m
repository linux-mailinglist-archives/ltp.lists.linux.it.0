Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8D5CD998
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Oct 2019 01:21:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 348BE3C22C8
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Oct 2019 01:21:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A10B43C1117
 for <ltp@lists.linux.it>; Mon,  7 Oct 2019 01:20:55 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CD63F200912
 for <ltp@lists.linux.it>; Mon,  7 Oct 2019 01:20:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2115E308421A;
 Sun,  6 Oct 2019 23:20:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E371E5D9CC;
 Sun,  6 Oct 2019 23:20:50 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3FB74E589;
 Sun,  6 Oct 2019 23:20:50 +0000 (UTC)
Date: Sun, 6 Oct 2019 19:20:50 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: linux-arm-kernel@lists.infradead.org, khuong@os.amperecomputing.com
Message-ID: <1507592549.3785589.1570404050459.JavaMail.zimbra@redhat.com>
In-Reply-To: <2122098936.3785405.1570402459950.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.34, 10.4.195.22]
Thread-Topic: hard lockup on read of
 /sys/kernel/debug/regmap/dummy-csw@7e200000/registers
Thread-Index: 4zqvsCdIMf0+/TsUmZ7/GrtQZXc86g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Sun, 06 Oct 2019 23:20:51 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [bug] hard lockup on read of
 /sys/kernel/debug/regmap/dummy-csw@7e200000/registers
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

This started with recent CKI reports of LTP read_all_sys sometimes running into
hard lockups [1] on arm64 system [2].

It comes down to reading /sys/kernel/debug/regmap/dummy-csw@7e200000/registers,
which completely locks up the system. Can be reproduced with 5.3.0, 5.3.4
upstream kernels and also Fedora's 5.0.9-301.fc30.aarch64.

# cat /sys/kernel/debug/regmap/dummy-csw@7e200000/name                                                                              
nodev
# cat /sys/kernel/debug/regmap/dummy-csw@7e200000/range
0-ffc
# cat /sys/kernel/debug/regmap/dummy-csw@7e200000/registers
<hangs>

Adding extra output to regmap_read_debugfs [3] shows [4]: first 3 iterations
of for loop complete OK, but 4th one never returns from regmap_read(),
and system becomes unresponsive (ssh, serial console, ping).

Regards,
Jan

[1]
[17552.810666] LTP: starting read_all_sys (read_all -d /sys -q -r 10 -e /sys/power/wakeup_count) 
[17626.529140] rcu: INFO: rcu_sched detected stalls on CPUs/tasks: 
[17626.535046] rcu: 	1-...0: (0 ticks this GP) idle=05a/1/0x4000000000000000 softirq=746561/746561 fqs=2042  
[17626.544568] 	(detected by 7, t=6003 jiffies, g=1380217, q=747) 
[17626.550372] Task dump for CPU 1: 
[17626.553582] read_all        R  running task        0 12363  12356 0x00000202 
[17626.560598] Call trace: 
[17626.563037]  __switch_to+0x104/0x1f8 
[17626.566596]  kmem_cache_alloc_trace+0x1f0/0x278 
[17626.571104]  debugfs_file_get+0x64/0x108 
[17626.575007]  0x0 

[2]
apm-mustang-b0-03
    description: System
    product: APM X-Gene Mustang board
    vendor: AmpereComputing(R)
    version: 1.0
    serial: 3PCC-A00000
    width: 64 bits
    capabilities: smbios-3.1.1 dmi-3.1.1 smp
    configuration: boot=normal chassis=server family=eMAG sku=EV-883208-X1-MB2-2 uuid=00020003-0004-0005-0006-0001730237A0
  *-core
       description: Motherboard
       product: Mustang
       vendor: AmpereComputing(R)
       physical id: 0
       version: 1.0
       serial: 3PCC-A00000
       slot: Part Component
     *-firmware
          description: BIOS
          vendor: American Megatrends Inc.
          physical id: 0
          version: 0ACDY027
          date: 12/12/2018
          size: 64KiB
          capacity: 13MiB
          capabilities: pci upgrade cdboot bootselect acpi uefi
    *-cpu:0
          description: CPU
          product: ARM (883208X1-SA24T)
          vendor: AmpereComputing(R)
          physical id: 4
          bus info: cpu@0
          version: B0
          serial: 883208X1-SA24T
          slot: eMAG
          size: 2400MHz
          capacity: 2400MHz
          clock: 2400MHz
          capabilities: lm
          configuration: cores=8 enabledcores=8
     *-memory
          description: System Memory
          physical id: 1c
          slot: System board or motherboard
          size: 13GiB
          capabilities: ecc
          configuration: errordetection=multi-bit-ecc

[3]
diff --git a/drivers/base/regmap/regmap-debugfs.c b/drivers/base/regmap/regmap-debugfs.c
index e5e1b3a01b1a..a6e144015406 100644
--- a/drivers/base/regmap/regmap-debugfs.c
+++ b/drivers/base/regmap/regmap-debugfs.c

+       printk("regmap_read_debugfs2\n");
        buf = kmalloc(count, GFP_KERNEL);
        if (!buf)
                return -ENOMEM;
 
        regmap_calc_tot_len(map, buf, count);
 
+       printk("regmap_read_debugfs3\n");
        /* Work out which register we're starting at */
        start_reg = regmap_debugfs_get_dump_start(map, from, *ppos, &p);
 
        for (i = start_reg; i >= 0 && i <= to;
             i = regmap_next_readable_reg(map, i)) {
 
+               printk("regmap_read_debugfs4 %d\n", i);
                /* If we're in the region the user is trying to read */
                if (p >= *ppos) {
                        /* ...but not beyond it */
                        if (buf_pos + map->debugfs_tot_len > count)
                                break;
 
+                       printk("regmap_read_debugfs5 %llu\n", p);
                        /* Format the register */
                        snprintf(buf + buf_pos, count - buf_pos, "%.*x: ",
                                 map->debugfs_reg_len, i - from);
                        buf_pos += map->debugfs_reg_len + 2;
 
                        /* Format the value, write all X if we can't read */
+                       printk("regmap_read_debugfs6 map: %px, i: %d, val: %u\n", map, i, val);
                        ret = regmap_read(map, i, &val);
+                       printk("regmap_read_debugfs6b\n");
                        if (ret == 0)
                                snprintf(buf + buf_pos, count - buf_pos,
                                         "%.*x", map->debugfs_val_len, val);

[4]
[ 1150.122251] regmap_read_debugfs2
[ 1150.125547] regmap_read_debugfs3
[ 1150.128798] regmap_read_debugfs4 0
[ 1150.132291] regmap_read_debugfs5 0
[ 1150.135718] regmap_read_debugfs6 map: ffff80035ad63600, i: 0, val: 1461156912
[ 1150.142951] (NULL device *): map: ffff80035ad63600, map->dev: 0000000000000000, ret: 0, 0 => 7
[ 1150.151647] regmap_read_debugfs6b
[ 1150.161527] regmap_read_debugfs4 4
[ 1150.164947] regmap_read_debugfs5 14
[ 1150.168452] regmap_read_debugfs6 map: ffff80035ad63600, i: 4, val: 7
[ 1150.174886] (NULL device *): map: ffff80035ad63600, map->dev: 0000000000000000, ret: 0, 4 => 50001
[ 1150.183937] regmap_read_debugfs6b
[ 1150.193967] regmap_read_debugfs4 8
[ 1150.197383] regmap_read_debugfs5 28
[ 1150.200944] regmap_read_debugfs6 map: ffff80035ad63600, i: 8, val: 327681
[ 1150.207759] (NULL device *): map: ffff80035ad63600, map->dev: 0000000000000000, ret: 0, 8 => 85000f
[ 1150.216889] regmap_read_debugfs6b
[ 1150.226771] regmap_read_debugfs4 12
[ 1150.230336] regmap_read_debugfs5 42
[ 1150.233846] regmap_read_debugfs6 map: ffff80035ad63600, i: 12, val: 8716303

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
