Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7591DCB8F
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 13:01:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB9E23C4D39
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 13:01:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 423C43C2532
 for <ltp@lists.linux.it>; Thu, 21 May 2020 13:01:12 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 66DEC1A01539
 for <ltp@lists.linux.it>; Thu, 21 May 2020 13:01:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1BBBFAFF5
 for <ltp@lists.linux.it>; Thu, 21 May 2020 11:01:14 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 21 May 2020 13:01:10 +0200
Message-Id: <20200521110110.11381-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] crash02: Blacklist the pause() syscall
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

pause() causes the calling process/thread to sleep indefinitely until waken up
by a signal. This will cause test timeouts.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/misc/crash/crash02.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/misc/crash/crash02.c b/testcases/misc/crash/crash02.c
index f69edf7e1..e46c2aa66 100644
--- a/testcases/misc/crash/crash02.c
+++ b/testcases/misc/crash/crash02.c
@@ -473,6 +473,9 @@ int in_blacklist(int sysno)
 #endif
 #if defined(__NR_vhangup) && __NR_vhangup
 		__NR_vhangup,	/* int vhangup(void); - terminal logout */
+#endif
+#if defined(__NR_pause) && __NR_pause
+		__NR_pause,	/* int pause(void); - sleep indefinitely */
 #endif
 		-1
 	};
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
