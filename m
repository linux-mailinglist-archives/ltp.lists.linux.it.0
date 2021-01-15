Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7306F2F76AB
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 11:28:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 376123C6A08
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 11:28:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id F189B3C288F
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 01:54:00 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.228])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 2C14F200766
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 01:53:58 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.48:31679.1580428382
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.88.18?logid-1532089986b64eb0bcf86c9924ff4cb8
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id CC9032800F1;
 Fri, 15 Jan 2021 08:53:53 +0800 (CST)
X-189-SAVE-TO-SEND: +liuxp11@chinatelecom.cn
Received: from  ([172.18.0.48])
 by App0024 with ESMTP id 1532089986b64eb0bcf86c9924ff4cb8 for
 ltp@lists.linux.it; Fri Jan 15 08:53:54 2021
X-Transaction-ID: 1532089986b64eb0bcf86c9924ff4cb8
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: Xinpeng Liu <liuxp11@chinatelecom.cn>
To: ltp@lists.linux.it
Date: Fri, 15 Jan 2021 08:53:51 +0800
Message-Id: <1610672031-5044-1-git-send-email-liuxp11@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 15 Jan 2021 11:28:10 +0100
Subject: [LTP] [PATCH] fs/proc01.c:add known issues
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

Test in ubuntu20.10,there are several failure tests.

proc01      1  TFAIL  :  proc01.c:396: read failed:
/proc/self/task/61595/attr/smack/current: errno=EINVAL(22): Invalid argument
proc01      2  TFAIL  :  proc01.c:396: read failed:
/proc/self/task/61595/attr/apparmor/prev: errno=EINVAL(22): Invalid argument
proc01      3  TFAIL  :  proc01.c:396: read failed:
/proc/self/task/61595/attr/apparmor/exec: errno=EINVAL(22): Invalid argument
proc01      4  TFAIL  :  proc01.c:396: read failed:
/proc/self/attr/smack/current: errno=EINVAL(22): Invalid argument
proc01      5  TFAIL  :  proc01.c:396: read failed:
/proc/self/attr/apparmor/prev: errno=EINVAL(22): Invalid argument
proc01      6  TFAIL  :  proc01.c:396: read failed:
/proc/self/attr/apparmor/exec: errno=EINVAL(22): Invalid argument

Signed-off-by: Xinpeng Liu <liuxp11@chinatelecom.cn>
---
 testcases/kernel/fs/proc/proc01.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/fs/proc/proc01.c b/testcases/kernel/fs/proc/proc01.c
index 9684369..96441d1 100644
--- a/testcases/kernel/fs/proc/proc01.c
+++ b/testcases/kernel/fs/proc/proc01.c
@@ -63,7 +63,7 @@ static char *opt_maxmbytesstr;
 static char *procpath = "/proc";
 static const char selfpath[] = "/proc/self";
 size_t buffsize = 1024;
-static long long maxbytes;
+static unsigned long long maxbytes;
 
 unsigned long long total_read;
 unsigned int total_obj;
@@ -97,7 +97,11 @@ static const struct mapping known_issues[] = {
 	{"read", "/proc/self/mem", EIO},
 	{"read", "/proc/self/task/[0-9]*/mem", EIO},
 	{"read", "/proc/self/attr/*", EINVAL},
+	{"read", "/proc/self/attr/smack/*", EINVAL},
+	{"read", "/proc/self/attr/apparmor/*", EINVAL},
 	{"read", "/proc/self/task/[0-9]*/attr/*", EINVAL},
+	{"read", "/proc/self/task/[0-9]*/attr/smack/*", EINVAL},
+	{"read", "/proc/self/task/[0-9]*/attr/apparmor/*", EINVAL},
 	{"read", "/proc/self/ns/*", EINVAL},
 	{"read", "/proc/self/task/[0-9]*/ns/*", EINVAL},
 	{"read", "/proc/ppc64/rtas/error_log", EINVAL},
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
