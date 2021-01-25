Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB64D304FC3
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 04:28:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51B503C0383
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 04:28:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id DBC8B3C009D
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 04:28:01 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.228])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 2E9BD60087F
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 04:27:59 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.218:16136.1631851923
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.88.18?logid-ee86868a97754c36bef16b8bd7411a0c
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 48E712800DA;
 Wed, 27 Jan 2021 11:27:57 +0800 (CST)
X-189-SAVE-TO-SEND: +liuxp11@chinatelecom.cn
Received: from  ([172.18.0.218])
 by App0025 with ESMTP id d497384ad40e41aaae8e0f59e775589e for
 ltp@lists.linux.it; Wed Jan 27 11:27:58 2021
X-Transaction-ID: d497384ad40e41aaae8e0f59e775589e
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: Xinpeng Liu <liuxp11@chinatelecom.cn>
To: ltp@lists.linux.it
Date: Mon, 25 Jan 2021 18:24:48 +0800
Message-Id: <1611570288-23040-2-git-send-email-liuxp11@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.5 required=7.0 tests=DATE_IN_PAST_24_48,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/ioctl: ioctl_sg01.c:TBROK: Test killed!
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

[root@test ioctl]# ./ioctl_sg01
tst_test.c:1263: TINFO: Timeout per run is 0h 05m 00s
ioctl_sg01.c:81: TINFO: Found SCSI device /dev/sg2
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
Test timeouted, sending SIGKILL!
tst_test.c:1308: TINFO: If you are running on slow machine, try exporting
LTP_TIMEOUT_MUL > 1
tst_test.c:1309: TBROK: Test killed! (timeout?)

[root@test ioctl]# lscpu |grep Model
Model:                 85
Model name:            Intel(R) Xeon(R) Gold 5218 CPU @ 2.30GHz

[root@test ioctl]# free -h
      total   used    free   shared  buff/cache   available
Mem:   502G    2.7G    499G    82M      820M        497G
Swap:  0B      0B      0B

512G RAM is too common,so add timeout 600 seconds,result is TPASS.

Signed-off-by: Xinpeng Liu <liuxp11@chinatelecom.cn>
---
 testcases/kernel/syscalls/ioctl/ioctl_sg01.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
index 94b30dc..d1f2d3c 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
@@ -123,6 +123,7 @@ static void run(void)
 }
 
 static struct tst_test test = {
+	.timeout = 600,
 	.test_all = run,
 	.setup = setup,
 	.cleanup = cleanup,
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
