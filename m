Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F833052D6
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 07:08:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 815563C5E98
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 07:08:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 18D513C5E84
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 07:08:16 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.228])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id E65DD200B33
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 07:08:14 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.218:50686.2070198386
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.88.18?logid-81596b9c077b4cd3888a18723b922c7f
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id C5A5E2800F2;
 Wed, 27 Jan 2021 14:08:08 +0800 (CST)
X-189-SAVE-TO-SEND: +liuxp11@chinatelecom.cn
Received: from  ([172.18.0.218])
 by App0025 with ESMTP id 81596b9c077b4cd3888a18723b922c7f for
 ltp@lists.linux.it; Wed Jan 27 14:08:08 2021
X-Transaction-ID: 81596b9c077b4cd3888a18723b922c7f
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: Xinpeng Liu <liuxp11@chinatelecom.cn>
To: ltp@lists.linux.it
Date: Mon, 25 Jan 2021 21:18:13 +0800
Message-Id: <1611580694-4000-1-git-send-email-liuxp11@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.5 required=7.0 tests=DATE_IN_PAST_24_48,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01
 invoked oom-killer
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
Cc: Xinpeng Liu <liuxp11@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Kernel version is 5.4.81+,the available RAM is less than free,as follow:
[root@liuxp mywork]# head /proc/meminfo
MemTotal:       198101744 kB
MemFree:        189303148 kB
MemAvailable:   188566732 kB

So use available RAM to avoid OOM killer.
---
 lib/tst_memutils.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
index dd09db4..8596005 100644
--- a/lib/tst_memutils.c
+++ b/lib/tst_memutils.c
@@ -18,6 +18,7 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
 	size_t i, map_count = 0, safety = 0, blocksize = BLOCKSIZE;
 	void **map_blocks;
 	struct sysinfo info;
+	unsigned long available_ram = SAFE_READ_MEMINFO("MemAvailable:");
 
 	SAFE_SYSINFO(&info);
 	safety = MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 128 * 1024 * 1024);
@@ -26,15 +27,19 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
 	if (info.freeswap > safety)
 		safety = 0;
 
+	/*"MemAvailable" field maybe not exist, or freeram less than available_ram*/
+	if(available_ram == 0 || info.freeram < available_ram)
+		available_ram = info.freeram;
+
 	/* Not enough free memory to avoid invoking OOM killer */
-	if (info.freeram <= safety)
+	if (available_ram <= safety)
 		return;
 
 	if (!maxsize)
 		maxsize = SIZE_MAX;
 
-	if (info.freeram - safety < maxsize / info.mem_unit)
-		maxsize = (info.freeram - safety) * info.mem_unit;
+	if (available_ram - safety < maxsize / info.mem_unit)
+		maxsize = (available_ram - safety) * info.mem_unit;
 
 	blocksize = MIN(maxsize, blocksize);
 	map_count = maxsize / blocksize;
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
