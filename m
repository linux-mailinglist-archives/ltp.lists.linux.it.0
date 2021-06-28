Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AD43B568F
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 03:16:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 37DB33C8DBA
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 03:16:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 139CC3C291C
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 03:15:55 +0200 (CEST)
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.203])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2F1DD1000678
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 03:15:49 +0200 (CEST)
Received: from localhost (unknown [192.168.167.69])
 by regular1.263xmail.com (Postfix) with ESMTP id 1878E855
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 09:15:44 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [113.200.76.118])
 by smtp.263.net (postfix) whith ESMTP id
 P12341T139823924897536S1624842942811459_; 
 Mon, 28 Jun 2021 09:15:43 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <c60eaf61bd2158b127f7e3112c1198c1>
X-RL-SENDER: gouhao@uniontech.com
X-SENDER: gouhao@uniontech.com
X-LOGIN-NAME: gouhao@uniontech.com
X-FST-TO: ltp@lists.linux.it
X-RCPT-COUNT: 4
X-SENDER-IP: 113.200.76.118
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Gou Hao <gouhao@uniontech.com>
To: ltp@lists.linux.it
Date: Mon, 28 Jun 2021 09:15:38 +0800
Message-Id: <20210628011538.10060-1-gouhao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] fix cpuhotplug04 check last cpu error
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
Cc: weidong@uniontech.com, jiaofenfang@uniontech.com
Content-Type: multipart/mixed; boundary="===============1467349465=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1467349465==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: gouhao <gouhao@uniontech.com>

Cpuhotplug04 uses get_hotplug_cpus when traversing, 
get_hotplug_cpus will filter out cpu without online files, 
and $cpus_num will be used to determine the last cpu num。 
If some cpu do not have an online file, 
it will lead to an error in the judgment of the last cpu.

Signed-off-by: gouhao <gouhao@uniontech.com>
---
 .../kernel/hotplug/cpu_hotplug/functional/cpuhotplug04.sh    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug04.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug04.sh
index 72bd98037..64a2b8dc5 100755
--- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug04.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug04.sh
@@ -57,7 +57,8 @@ if [ $cpus_num -lt 2 ]; then
 	tst_brkm TCONF "system doesn't have required CPU hotplug support"
 fi
 
-if [ $(get_hotplug_cpus_num) -lt 1 ]; then
+hotplug_cpus_num=$(get_hotplug_cpus_num)
+if [ $hotplug_cpus_num -lt 1 ]; then
 	tst_brkm TCONF "system doesn't have at least one hotpluggable CPU"
 fi
 
@@ -85,7 +86,7 @@ until [ $LOOP_COUNT -gt $HOTPLUG04_LOOPS ]; do
 		# that the kernel will refuse to offline the last CPU.
 		# If only some of the CPUs are hotpluggable,
 		# they all can be offlined.
-		if [ $cpu -eq $cpus_num ]; then
+		if [ $cpu -eq $hotplug_cpus_num ]; then
 			if offline_cpu $i 2> /dev/null; then
 				tst_brkm TFAIL "Have we just offlined the last CPU?"
 			else
-- 
2.20.1




--===============1467349465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1467349465==--
