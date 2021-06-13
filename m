Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF933A59B1
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 18:54:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 285403C734A
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 18:54:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 074393C2819
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 18:54:27 +0200 (CEST)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 84A1F1A0043E
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 18:54:27 +0200 (CEST)
Received: by mail-io1-xd33.google.com with SMTP id a6so37162563ioe.0
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 09:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lO1URh5/l6gemguJACLIUMJaCJTljLnvCddpxuY1fDs=;
 b=K1STrehGzsLZV53fgfDtGKN1s6+1ycX8PP0A/UNYKlyqZgmkeo5JhmapfDmfX+EG7D
 79vZnsE7ko4Fqb4hLBF1DTkVpkGN51gvU0hruMkx+tkCXue1dONXu6ouCpQGXxazJc2P
 HKK+0ty6IQtc6wWKndXkpIVEYLUEnvB8G68I18MSqcmQ4n4adshKuBuejjH+9P8zAM1S
 RQiL2DZISeiEbEUyzqZ73DW6oLDor88BR0mSncXoJrUVZ7CbzHOL7fTVN967PIx9KD4C
 1gIvBoqP1XPDOVTxPRa+GJg3HkL6UQjoderRP4XbzTqcXao3bxMnoxS3HW4Fm6OJChqX
 NPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lO1URh5/l6gemguJACLIUMJaCJTljLnvCddpxuY1fDs=;
 b=t0h1Jmk5OKcEl8nI31AfDm3r5EM83qOgQaj+BTdK49pp4y8a6y46Xw203CKCH+2HkX
 WCQY6SpTqAKhPG1sHdDNM239vFOSGjiu4eomd1qabvlrhiZztp7bSokdElc4es1H+hYL
 8JfQLSHpFubI0o7uPjqYmOFhCDSbDaOP0thukDYZSwQg85YuDPmEoe7HnBWuMxIaeEOr
 GHSSmaWfGXLGbqVeMxFHcSSF0DD83JtE3KxrGS9j2JrqX0AvYigX7s+/UM5LP+Iw89ep
 T1BO9MFzzI11mTp+vXry6AHvdGbY1bBbuMEfadrPOVXggHcBEsMvTAPdDgXv+bpqzBYS
 ZhEQ==
X-Gm-Message-State: AOAM532RXnH/nA68HjQQR9lB73bkVvmt8GXknDp4xarMpiyxAd9kn7St
 BuaC7bGpuJrPHuUjpdCyq2Y=
X-Google-Smtp-Source: ABdhPJy8Br1qnhqlLkBG5nuoE4s7J7WpJsg3RjZBqLqTPS9t1P4+wLDYMXcRf0UFLm0Yi0OoON5S/w==
X-Received: by 2002:a02:838c:: with SMTP id z12mr13380219jag.89.1623603266271; 
 Sun, 13 Jun 2021 09:54:26 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.78])
 by smtp.gmail.com with ESMTPSA id g6sm7092197ilb.56.2021.06.13.09.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 09:54:25 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Sun, 13 Jun 2021 22:24:15 +0530
Message-Id: <20210613165415.6432-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YMNoeLR3J9Ah1eAZ@yuki>
References: <YMNoeLR3J9Ah1eAZ@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3] getitimer02: Skipped EFAULT tests for libc variant.
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
Cc: umesh.kalappa0@gmail.com, metan@ucw.cz, rwmacleod@gmail.com,
 vinay.kumar@blackfigtech.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Tested EFAULT cases only for "__NR_getitimer" syscall.

Tests for bad addresses in LTP cases trigger segment
fault in libc on a 32bit system.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 testcases/kernel/syscalls/getitimer/getitimer02.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/getitimer/getitimer02.c b/testcases/kernel/syscalls/getitimer/getitimer02.c
index 2eb3f3a94..6039be6f9 100644
--- a/testcases/kernel/syscalls/getitimer/getitimer02.c
+++ b/testcases/kernel/syscalls/getitimer/getitimer02.c
@@ -14,12 +14,20 @@
 #include <errno.h>
 #include <sys/time.h>
 #include "tst_test.h"
+#include "lapi/syscalls.h"
+
+static int sys_getitimer(int which, void *curr_value)
+{
+	return tst_syscall(__NR_getitimer, which, curr_value);
+}
 
 static void verify_getitimer(void)
 {
 	/* call with a bad address */
-	TST_EXP_FAIL(getitimer(ITIMER_REAL, (struct itimerval *)-1),
+	TST_EXP_FAIL(sys_getitimer(ITIMER_REAL, (struct itimerval *)-1),
 		EFAULT, "expected failure - errno = %d - %s", TST_ERR, strerror(TST_ERR));
+
+	tst_res(TCONF, "EFAULT is skipped for libc variant");
 }
 
 static struct tst_test test = {
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
