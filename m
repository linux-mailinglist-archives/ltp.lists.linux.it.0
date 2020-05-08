Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E4E1CA3A6
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 08:16:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 44E223C5743
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 08:16:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 98ED13C25FA
 for <ltp@lists.linux.it>; Fri,  8 May 2020 08:15:54 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id E190810016F0
 for <ltp@lists.linux.it>; Fri,  8 May 2020 08:15:48 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,366,1583164800"; d="scan'208";a="91678334"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 May 2020 14:15:38 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id E10FD4BCC896
 for <ltp@lists.linux.it>; Fri,  8 May 2020 14:15:36 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 8 May 2020 14:15:38 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 8 May 2020 14:15:37 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 8 May 2020 14:15:35 +0800
Message-ID: <1588918535-4682-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: E10FD4BCC896.A0F70
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/ioctl_loop05: Ensure do zero offset in
 kernel always
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
this case will broke when using i parameter,
ioctl_loop05.c:62: BROK: ioctl(3,LOOP_SET_DIRECT_IO,...) failed: EINVAL (22)

It seems the last test affected this test, so I think we should use
goto instead of return. Also including a typo, updata->update.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/ioctl/ioctl_loop05.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
index 6cf701f47..a103aaa94 100644
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
@@ -85,13 +85,14 @@ static void verify_ioctl_loop(void)
 	if (TST_RET == 0) {
 		tst_res(TPASS, "LOOP_SET_DIRECT_IO succeeded");
 		SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
-		return;
+		goto zero_offset;
 	}
 	if (TST_ERR == EINVAL)
 		tst_res(TPASS | TTERRNO, "LOOP_SET_DIRECT_IO failed as expected");
 	else
 		tst_res(TFAIL | TTERRNO, "LOOP_SET_DIRECT_IO failed expected EINVAL got");
 
+zero_offset:
 	loopinfo.lo_offset = 0;
 	TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), TST_RETVAL_EQ0);
 }
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
