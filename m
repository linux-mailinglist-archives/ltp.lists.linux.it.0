Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3D8113BB3
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 07:30:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7EFD73C2564
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 07:30:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id BA02E3C23B6
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 07:30:32 +0100 (CET)
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C8C021002034
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 07:30:29 +0100 (CET)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xB56UOpg004807
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Wed, 4 Dec 2019 22:30:25 -0800
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0; Wed, 4 Dec
 2019 22:30:24 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <ltp@lists.linux.it>
Date: Thu, 5 Dec 2019 14:30:21 +0800
Message-ID: <20191205063021.9564-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] pidfd_send_signal03: fix compile error with
 -Werror=format-security flag
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

Fixed when compile with "-Wformat -Wformat-security -Werror=format-security":

In file included from ../../../../include/tst_test.h:85,
                 from pidfd_send_signal.h:10,
                 from pidfd_send_signal03.c:21:
pidfd_send_signal03.c: In function 'verify_pidfd_send_signal':
../../../../include/tst_safe_file_ops.h:53:27: error: format not a string literal and no format arguments [-Werror=format-security]
   53 |                   (path), (fmt), ## __VA_ARGS__)
      |                           ^~~~~
pidfd_send_signal03.c:62:3: note: in expansion of macro 'SAFE_FILE_PRINTF'
   62 |   SAFE_FILE_PRINTF(last_pid_file, pid_str);
      |   ^~~~~~~~~~~~~~~~

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
index 27dbc6626..19d943d06 100644
--- a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
+++ b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
@@ -59,7 +59,7 @@ static void verify_pidfd_send_signal(void)
 
 		/* Manipulate PID for next process */
 		sprintf(pid_str, "%d", pid - 1);
-		SAFE_FILE_PRINTF(last_pid_file, pid_str);
+		SAFE_FILE_PRINTF(last_pid_file, "%s", pid_str);
 
 		new_pid = SAFE_FORK();
 		if (new_pid == 0) {
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
