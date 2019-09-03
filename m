Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC030A68DE
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 14:48:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 656843C20B3
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 14:48:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 1CFFB3C1347
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 14:48:33 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 6A15B1401A09
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 14:48:30 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,463,1559491200"; d="scan'208";a="74768116"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 03 Sep 2019 20:48:26 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 199EC4CE14E1
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 20:48:26 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.220.73) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 3 Sep 2019 20:48:23 +0800
From: Jinhui huang <huangjh.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 3 Sep 2019 20:48:10 +0800
Message-ID: <1567514890-1216-2-git-send-email-huangjh.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1567514890-1216-1-git-send-email-huangjh.jy@cn.fujitsu.com>
References: <1567514890-1216-1-git-send-email-huangjh.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.73]
X-yoursite-MailScanner-ID: 199EC4CE14E1.AE27D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangjh.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] uevents/uevent03.c: Check if "UI_GET_SYSNAME" is
 supported
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

Signed-off-by: Jinhui huang <huangjh.jy@cn.fujitsu.com>
---
 testcases/kernel/uevents/uevent03.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/uevents/uevent03.c b/testcases/kernel/uevents/uevent03.c
index 9b901dc..f676984 100644
--- a/testcases/kernel/uevents/uevent03.c
+++ b/testcases/kernel/uevents/uevent03.c
@@ -52,7 +52,7 @@ static void get_minor_major(char *device, char *minor, char *major, size_t buf_s
 
 static void verify_uevent(void)
 {
-	int pid, fd;
+	int pid, fd, ret;
 	char sysname[64];
 	char add_msg[1024];
 	char rem_msg[1024];
@@ -167,7 +167,18 @@ static void verify_uevent(void)
 
 	create_uinput_mouse();
 
-	SAFE_IOCTL(mouse_fd, UI_GET_SYSNAME(sizeof(sysname)), sysname);
+	ret = ioctl(mouse_fd, UI_GET_SYSNAME(sizeof(sysname)), sysname);
+	if (ret < 0) {
+		if (errno == EINVAL) {
+			tst_brk(TCONF,
+				"kernel does not support UI_GET_SYSNAME");
+		} else {
+			tst_brk(TBROK,
+				"ioctl(%d, %s,...) failed",
+				mouse_fd, "UI_GET_SYSNAME");
+		}
+	}
+
 	handlers = get_input_handlers();
 
 	tst_res(TINFO, "Sysname: %s", sysname);
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
