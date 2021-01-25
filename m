Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D39304FC2
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 04:28:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D58AA3C01E2
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 04:28:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 7DB063C009D
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 04:28:01 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.228])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 399B1100037D
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 04:27:58 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.218:16136.1631851923
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.88.18?logid-ee86868a97754c36bef16b8bd7411a0c
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id BDAA32800DD;
 Wed, 27 Jan 2021 11:27:53 +0800 (CST)
X-189-SAVE-TO-SEND: +liuxp11@chinatelecom.cn
Received: from  ([172.18.0.218])
 by App0025 with ESMTP id ee86868a97754c36bef16b8bd7411a0c for
 ltp@lists.linux.it; Wed Jan 27 11:27:56 2021
X-Transaction-ID: ee86868a97754c36bef16b8bd7411a0c
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: Xinpeng Liu <liuxp11@chinatelecom.cn>
To: ltp@lists.linux.it
Date: Mon, 25 Jan 2021 18:24:47 +0800
Message-Id: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.5 required=7.0 tests=DATE_IN_PAST_24_48,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01 invoked
 oom-killer
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

Signed-off-by: Xinpeng Liu <liuxp11@chinatelecom.cn>
---
 lib/tst_memutils.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
index dd09db4..21df9a8 100644
--- a/lib/tst_memutils.c
+++ b/lib/tst_memutils.c
@@ -10,14 +10,33 @@
 
 #define TST_NO_DEFAULT_MAIN
 #include "tst_test.h"
+#include "tst_safe_stdio.h"
 
 #define BLOCKSIZE (16 * 1024 * 1024)
 
+static unsigned long get_available_ram(void)
+{
+	char buf[60]; /* actual lines we expect are ~30 chars or less */
+	unsigned long available_kb = 0;
+	FILE *fp;
+
+	fp = SAFE_FOPEN("/proc/meminfo","r");
+	while (fgets(buf, sizeof(buf), fp)) {
+		if (sscanf(buf, "MemAvailable: %lu %*s\n", &available_kb) == 1){
+			break;
+		}
+	}
+	SAFE_FCLOSE(fp);
+
+	return 1024 * available_kb;
+}
+
 void tst_pollute_memory(size_t maxsize, int fillchar)
 {
 	size_t i, map_count = 0, safety = 0, blocksize = BLOCKSIZE;
 	void **map_blocks;
 	struct sysinfo info;
+	unsigned long available_ram = get_available_ram();
 
 	SAFE_SYSINFO(&info);
 	safety = MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 128 * 1024 * 1024);
@@ -26,15 +45,19 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
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
