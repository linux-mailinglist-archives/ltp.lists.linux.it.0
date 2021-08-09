Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 090AF3E46D2
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 15:41:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4EA763C7186
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 15:41:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 110283C5EA9
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 15:41:11 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 714AE14001E9
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 15:41:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8273421E75;
 Mon,  9 Aug 2021 13:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628516469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lEyYZ1qAfAKw0wmTa8mXPLGycuTfbY+llTUd8FwTFA8=;
 b=TAJfa1sVysIsQVYvLlCpAsz6UQstBA7SMSmshLj+2RUIzabKGVAzgIVZkWiU77wGLbts7E
 0j/y59uBZStM23DEAp02VeqEHtoJS6axzfcvHAJFsPKJDyyegL6mvHD/m3lcKbE8N0+xmL
 eeH9iy2SE/KsU19GzzVKKGc+1gX5UJw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628516469;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lEyYZ1qAfAKw0wmTa8mXPLGycuTfbY+llTUd8FwTFA8=;
 b=caHXQeGg8+khBuQ5UxyzdomJg9hoiR9DFcjnlqiluzbOXPBxplBXr6D8mZxNYC4RTSrVnM
 xAAwpZZHwrTscNAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D1E013BAD;
 Mon,  9 Aug 2021 13:41:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KPlqGXUwEWHeIgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 09 Aug 2021 13:41:09 +0000
Date: Mon, 9 Aug 2021 15:41:19 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YREwf0nD/azWBuiy@yuki>
References: <20210806035952.18150-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806035952.18150-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [v2,1/4] syscalls/chroot01: Convert to new API
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
Pushed with a minor changes.

Most important is that the description comment section should be called
[Description] not [DESCRIPTION].

Full diff:

diff --git a/testcases/kernel/syscalls/chroot/chroot01.c b/testcases/kernel/syscalls/chroot/chroot01.c
index bddbf0db5..581bd54ac 100644
--- a/testcases/kernel/syscalls/chroot/chroot01.c
+++ b/testcases/kernel/syscalls/chroot/chroot01.c
@@ -4,9 +4,10 @@
  */
 
 /*\
- * [DESCRIPTION]
+ * [Description]
  *
  * Testcase to check the whether chroot sets errno to EPERM.
+ *
  * As a non-root user attempt to perform chroot() to a directory. The
  * chroot() call should fail with EPERM
  */
@@ -16,18 +17,18 @@
 #include "tst_test.h"
 
 static char *path;
-static char nobody_uid[] = "nobody";
-static struct passwd *ltpuser;
 
 static void verify_chroot(void)
 {
-	TST_EXP_FAIL(chroot(path), EPERM, "chroot set errno to EPERM.");
+	TST_EXP_FAIL(chroot(path), EPERM, "unprivileged chroot()");
 }
 
 static void setup(void)
 {
+	struct passwd *ltpuser;
+
 	path = tst_get_tmpdir();
-	ltpuser = SAFE_GETPWNAM(nobody_uid);
+	ltpuser = SAFE_GETPWNAM("nobody");
 	SAFE_SETEUID(ltpuser->pw_uid);
 }
 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
