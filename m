Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFF814A0F9
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jan 2020 10:39:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3FB83C239F
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jan 2020 10:39:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id EFE9C3C229C
 for <ltp@lists.linux.it>; Mon, 27 Jan 2020 10:39:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 502CC1400972
 for <ltp@lists.linux.it>; Mon, 27 Jan 2020 10:39:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5991BAD39
 for <ltp@lists.linux.it>; Mon, 27 Jan 2020 09:39:42 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 27 Jan 2020 10:39:35 +0100
Message-Id: <20200127093935.8223-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] Blacklist vhangup() syscall in crash02 test
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

The vhangup() syscall logs the current terminal out which some external
testing tools interpret as a failure. Blacklist the syscall in crash02 test
since there's no combination of arguments that could cause a kernel crash.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/misc/crash/crash02.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/misc/crash/crash02.c b/testcases/misc/crash/crash02.c
index cddedc102..f69edf7e1 100644
--- a/testcases/misc/crash/crash02.c
+++ b/testcases/misc/crash/crash02.c
@@ -470,6 +470,9 @@ int in_blacklist(int sysno)
 #endif /* __ia64__ */
 #if defined(__NR_clone) && __NR_clone
 		SYS_clone,
+#endif
+#if defined(__NR_vhangup) && __NR_vhangup
+		__NR_vhangup,	/* int vhangup(void); - terminal logout */
 #endif
 		-1
 	};
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
