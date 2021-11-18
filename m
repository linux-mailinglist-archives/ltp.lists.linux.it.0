Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABF0455A3E
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Nov 2021 12:29:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D89B3C885B
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Nov 2021 12:29:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 45D313C08C9
 for <ltp@lists.linux.it>; Thu, 18 Nov 2021 12:29:16 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 96269201165
 for <ltp@lists.linux.it>; Thu, 18 Nov 2021 12:29:15 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A7C2C212C8;
 Thu, 18 Nov 2021 11:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1637234954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yrMOyvA/Ryp/MZdqU+jHVZRhiYwmybzmo14Vz2e7az8=;
 b=X2/haRpRMTDU2fJ5d+bYzhDUf3gwd2VgpXNaCobDb0FB15qWc8umrS6Zq3uK9xDNyljlcl
 xK6vcsCvOeEYCtLM9QKPatlRru80OG6qQilJ/lX8W8Z1fXV+1W1flo77ZzxJQ5ayDgmBaW
 +uR4QsNw7BAYJNwnn3QPK+G6BIWuAQ8=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 6103DA3B85;
 Thu, 18 Nov 2021 11:29:14 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 18 Nov 2021 11:29:00 +0000
Message-Id: <20211118112900.15757-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] statx04: Re-add BTRFS version check
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Removing this was a step too far. This causes regressions on products
where there is now no chance of a backport. This is different from the
other version checks which are for much newer kernels. Also there
could be differences in the difficulty of a backport.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Yang Xu <xuyang2018.jy@fujitsu.com>
---

Note that I am still very much against new version checks if there is
a high chance of backports. We should leave long established checks
alone however.

 testcases/kernel/syscalls/statx/statx04.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/kernel/syscalls/statx/statx04.c b/testcases/kernel/syscalls/statx/statx04.c
index 180c61bf9..b5ca0586a 100644
--- a/testcases/kernel/syscalls/statx/statx04.c
+++ b/testcases/kernel/syscalls/statx/statx04.c
@@ -182,6 +182,9 @@ static void caid_flags_setup(void)
 
 static void setup(void)
 {
+	if (!strcmp(tst_device->fs_type, "btrfs") && tst_kvercmp(4, 13, 0) < 0)
+		tst_brk(TCONF, "Btrfs statx() supported since 4.13");
+
 	SAFE_MKDIR(TESTDIR_FLAGGED, 0777);
 	SAFE_MKDIR(TESTDIR_UNFLAGGED, 0777);
 
-- 
2.33.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
