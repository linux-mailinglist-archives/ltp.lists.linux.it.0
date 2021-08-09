Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBD93E4786
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 16:28:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 222613C71C6
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 16:28:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D09EC3C5E75
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 16:28:34 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E670D140005A
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 16:28:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2791721F3B;
 Mon,  9 Aug 2021 14:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628519313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bn1YpAglma7vnEw1eq0pSwNae8g0ohF+JdEuZDJYm7o=;
 b=RvRqr4G/e1w3MaF8jTLpbpG3vjn7oHcSDaK0EGMSI+vwoht/7522Gf5jKi+vvc0Q7mhUPq
 ng0d2Dk0YZhVMcCu4998xFJcGOcWrf7OKzX34d2KiKjB3XS4Au+C3VVgUccD/KjcvHXoxf
 kjU1xn+K/sqU2n51Wpactj9LxAT813M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628519313;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bn1YpAglma7vnEw1eq0pSwNae8g0ohF+JdEuZDJYm7o=;
 b=z9+Qj12PKJ0Qhlrf0QlA/O50xZ+dW/y71Y2+q1UQPQqzdfTGkUZfj834xD93bUoODLoecq
 Tt5GAB/tTMKJczAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 13F8813BB1;
 Mon,  9 Aug 2021 14:28:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C2veBJE7EWFtLwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 09 Aug 2021 14:28:33 +0000
Date: Mon, 9 Aug 2021 16:28:38 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YRE7luQRhPpa3TbT@yuki>
References: <20210806040046.18836-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806040046.18836-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [4/4] syscalls/chroot04: Convert to new API
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with similar changes as in chroot01.c, thanks.

Full diff:

diff --git a/testcases/kernel/syscalls/chroot/chroot04.c b/testcases/kernel/syscalls/chroot/chroot04.c
index b65b09d79..ed0f66323 100644
--- a/testcases/kernel/syscalls/chroot/chroot04.c
+++ b/testcases/kernel/syscalls/chroot/chroot04.c
@@ -7,9 +7,13 @@
   */
 
 /*\
- * [DESCRIPTION]
+ * [Description]
  *
- *	Testcase to check that chroot sets errno to EACCES.
+ * Testcase to check that chroot sets errno to EACCES.
+ *
+ * As a non-root user attempt to perform chroot() to a directory that the user
+ * does not have a search permission for. The chroot() call should fail with
+ * EACESS.
  */
 
 #include <stdio.h>
@@ -17,21 +21,19 @@
 #include "tst_test.h"
 
 #define TEST_TMPDIR	"chroot04_tmpdir"
-static char nobody_uid[] = "nobody";
-static struct passwd *ltpuser;
 
 static void verify_chroot(void)
 {
-	TST_EXP_FAIL(chroot(TEST_TMPDIR), EACCES, "got EACCESS as expected");
+	TST_EXP_FAIL(chroot(TEST_TMPDIR), EACCES, "no search permission chroot()");
 }
 
 static void setup(void)
 {
-	/*
-	 * create a temporary directory
-	 */
+	struct passwd *ltpuser;
+
 	SAFE_MKDIR(TEST_TMPDIR, 0222);
-	ltpuser = SAFE_GETPWNAM(nobody_uid);
+
+	ltpuser = SAFE_GETPWNAM("nobody");
 	SAFE_SETEUID(ltpuser->pw_uid);
 }
 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
