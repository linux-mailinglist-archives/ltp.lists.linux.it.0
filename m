Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C563052D5
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 07:08:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0704D3C4FA6
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 07:08:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id CD3EE3C01E2
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 07:08:13 +0100 (CET)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.228])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id CFA5720004B
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 07:08:12 +0100 (CET)
HMM_SOURCE_IP: 172.18.0.218:50686.2070198386
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.88.18?logid-81596b9c077b4cd3888a18723b922c7f
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 404622800F4;
 Wed, 27 Jan 2021 14:08:09 +0800 (CST)
X-189-SAVE-TO-SEND: +liuxp11@chinatelecom.cn
Received: from  ([172.18.0.218])
 by App0025 with ESMTP id 357770ff5e294e3bb8c236fb74259578 for
 ltp@lists.linux.it; Wed Jan 27 14:08:11 2021
X-Transaction-ID: 357770ff5e294e3bb8c236fb74259578
X-filter-score: filter<0>
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: Xinpeng Liu <liuxp11@chinatelecom.cn>
To: ltp@lists.linux.it
Date: Mon, 25 Jan 2021 21:18:14 +0800
Message-Id: <1611580694-4000-2-git-send-email-liuxp11@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611580694-4000-1-git-send-email-liuxp11@chinatelecom.cn>
References: <1611580694-4000-1-git-send-email-liuxp11@chinatelecom.cn>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.5 required=7.0 tests=DATE_IN_PAST_24_48,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] syscalls/ioctl: ioctl_sg01.c:TBROK: Test
 killed!
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

>512G RAM is too common,so setting .timeout -1, result is TPASS.
---
 testcases/kernel/syscalls/ioctl/ioctl_sg01.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
index 94b30dc..da0b074 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
@@ -123,6 +123,7 @@ static void run(void)
 }
 
 static struct tst_test test = {
+	.timeout = -1,
 	.test_all = run,
 	.setup = setup,
 	.cleanup = cleanup,
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
