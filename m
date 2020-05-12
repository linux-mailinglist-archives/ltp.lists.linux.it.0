Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9B41CEC4C
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 07:11:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AACE83C322B
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 07:11:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id EDF713C25A9
 for <ltp@lists.linux.it>; Tue, 12 May 2020 07:11:28 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 6127F6002DE
 for <ltp@lists.linux.it>; Tue, 12 May 2020 07:11:19 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,381,1583164800"; d="scan'208";a="91936736"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 May 2020 13:11:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 396714BCC89B
 for <ltp@lists.linux.it>; Tue, 12 May 2020 13:11:15 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 May 2020 13:11:14 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 12 May 2020 13:11:10 +0800
Message-ID: <1589260270-3636-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 396714BCC89B.ADB46
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/ioctl_loop05: Ensure do zero offset when
 using -i parameter
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Currently, we use return instead of zero_offset. I debug this code
(early return, ext4 filesystem)as below:
---------------------------------------
TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
if (TST_RET == 0) {
        tst_res(TPASS, "LOOP_SET_DIRECT_IO succeeded unexpectedly");
        SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
}
return;
---------------------------------------
this case will be broke when using i parameter,
ioctl_loop05.c:62: BROK: ioctl(3,LOOP_SET_DIRECT_IO,...) failed: EINVAL (22)

It seems the last test affected this test, so I move zero status to the
beginning of the test to avoid unknown error.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/ioctl/ioctl_loop05.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
index 6cf701f47..c9138be95 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
@@ -5,7 +5,7 @@
  *
  * This is a basic ioctl test about loopdevice.
  *
- * It is designed to test LOOP_SET_DIRECT_IO can updata a live
+ * It is designed to test LOOP_SET_DIRECT_IO can update a live
  * loop device dio mode. It needs the backing file also supports
  * dio mode and the lo_offset is aligned with the logical block size.
  *
@@ -57,6 +57,11 @@ static void verify_ioctl_loop(void)
 	struct loop_info loopinfo;
 
 	memset(&loopinfo, 0, sizeof(loopinfo));
+	/*
+	 * Setting loopdevice with zero loop_info struct, so we can avoid unknown
+	 * error when using -i parameter.
+	 */
+	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), TST_RETVAL_EQ0);
 
 	tst_res(TINFO, "Without setting lo_offset or sizelimit");
 	SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 1);
@@ -91,9 +96,6 @@ static void verify_ioctl_loop(void)
 		tst_res(TPASS | TTERRNO, "LOOP_SET_DIRECT_IO failed as expected");
 	else
 		tst_res(TFAIL | TTERRNO, "LOOP_SET_DIRECT_IO failed expected EINVAL got");
-
-	loopinfo.lo_offset = 0;
-	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), TST_RETVAL_EQ0);
 }
 
 static void setup(void)
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
