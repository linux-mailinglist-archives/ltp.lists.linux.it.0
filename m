Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C22F33E571A
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 11:35:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34E273C70A8
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 11:35:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6EF413C03FE
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 11:35:46 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5B7B1200051
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 11:35:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 87FB52200D;
 Tue, 10 Aug 2021 09:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628588145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gVr5aqTmSC3JqdmSNtZdbPgPpeVUVDZ0nD+lwXThXoU=;
 b=E/pW89C14nIkdkPqk8m/mq3rIoUwJxPHsMfBM/Vf4u5mKjCJRo0vzDgEtT+0iDZfYilbow
 ezXkqSDsvcvTOyZK8iifsVopHu1a3osbtq+PjqHM+o6AgD8xvaC9dVGOb9lX+CZEjIvfdR
 XShlEQUGQoOndIEpIXpTL4NV05BINUQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628588145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gVr5aqTmSC3JqdmSNtZdbPgPpeVUVDZ0nD+lwXThXoU=;
 b=awZQh+cWXNrs76CaqnAK74TwN3ap1Hs4ADVEOl7JHV7C4NB59kfWl1DCozNTlilvaQdi+c
 B/dJkDYMI3n1cVCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 731BB13ABA;
 Tue, 10 Aug 2021 09:35:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uTTBG3FIEmGNIgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 10 Aug 2021 09:35:45 +0000
Date: Tue, 10 Aug 2021 11:35:56 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YRJIfC59VliHPOOs@yuki>
References: <20210810015235.20965-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210810015235.20965-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3, 2/4] syscalls/chroot02: Convert to new API
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
Pushed with a minor changes, thanks.

Diff:

diff --git a/testcases/kernel/syscalls/chroot/chroot02.c b/testcases/kernel/syscalls/chroot/chroot02.c
index 141604406..ad33abdcc 100644
--- a/testcases/kernel/syscalls/chroot/chroot02.c
+++ b/testcases/kernel/syscalls/chroot/chroot02.c
@@ -9,20 +9,23 @@
 /*\
  * [Description]
  *
- * - Create a file in the temporary directory;
- * - Change the root to this temporary directory;
- * - Check whether this file can be accessed in the new root directory;
+ * Basic chroot() functionality test.
+ *
+ * - Create a file in the temporary directory
+ * - Change the root to this temporary directory
+ * - Check whether this file can be accessed in the new root directory
  */
 
 #include <stdlib.h>
 #include "tst_test.h"
 
 #define TMP_FILENAME	"chroot02_testfile"
-static struct stat buf;
 static char *path;
 
 static void verify_chroot(void)
 {
+	struct stat buf;
+
 	if (!SAFE_FORK()) {
 		TST_EXP_PASS(chroot(path), "chroot(%s)", path);
 		if (!TST_PASS)
@@ -36,7 +39,6 @@ static void setup(void)
 {
 	path = tst_get_tmpdir();
 	SAFE_TOUCH(TMP_FILENAME, 0666, NULL);
-	SAFE_STAT(TMP_FILENAME, &buf);
 }
 
 static void cleanup(void)

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
