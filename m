Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD243EB5B8
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 14:45:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4115B3C65AF
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 14:45:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DA6C53C57F3
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 14:45:42 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 330F16019AD
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 14:45:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 45DCA1FFBF;
 Fri, 13 Aug 2021 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628858741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=89ej6zsuluNooua72yqoVMJLwxWEJBkM+WBZsBDmJsU=;
 b=dER5bPYHl3aK0YUrDrzgJwVNdkjytAH29BPgJFTMAE5o2OefDNLdfOEBPaBH9+PJgTOyb8
 udnzAEiNYV2S8unavHBF2k3Z603ikY6f4BJz+fyea6f3ikVrwBG3E34pfR6S0nSGJ5OxGT
 YBC1sKeD1RdnmVEpRgqb9JCthmJLRoc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628858741;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=89ej6zsuluNooua72yqoVMJLwxWEJBkM+WBZsBDmJsU=;
 b=02CBAge3dCVYotQaoDuu4MdwcdgawnAe7UpLH4vKTf2lD8sbGA2staWtDC1nZ4qz4vQC6I
 hgONx8QcP8TruyDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8E14913B64;
 Fri, 13 Aug 2021 12:45:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KD1LH3RpFmHKPAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 13 Aug 2021 12:45:40 +0000
Date: Fri, 13 Aug 2021 14:45:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <YRZpgsgh2N2csZ9s@yuki>
References: <20210813033507.18781-1-sujiaxun@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210813033507.18781-1-sujiaxun@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [v4,
 5/6] syscalls/sysfs: Convert sysfs05 to the new API
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
Pushed with a few changes, thanks.

The main change is that we do pass a valid buffer for the cases where
option != 1. That is because the order of checks in kernel is not
guaranteed. So if we pass bad_address as well as invalid index the
kernel can return either one of EINVAL or EFAULT. If we want to get
specific error we have to make sure that all parameters but one are
correct.

Also while strictly not an error LKML coding style prefers curly braces
around multiline blocks even if they are a single function.

Full diff:

diff --git a/testcases/kernel/syscalls/sysfs/sysfs05.c b/testcases/kernel/syscalls/sysfs/sysfs05.c
index 3586453cf..bfcead7db 100644
--- a/testcases/kernel/syscalls/sysfs/sysfs05.c
+++ b/testcases/kernel/syscalls/sysfs/sysfs05.c
@@ -5,6 +5,7 @@
 
 /*\
  * [Description]
+ *
  * This test case checks whether sysfs(2) system call returns appropriate
  * error number for invalid option and for invalid filesystem name and fs index out of bounds.
  */
@@ -12,8 +13,6 @@
 #include "tst_test.h"
 #include "lapi/syscalls.h"
 
-static char *bad_addr;
-
 static struct test_case {
 	int option;
 	char *fsname;
@@ -22,27 +21,29 @@ static struct test_case {
 	int exp_errno;
 } tcases[] = {
 	{1, "ext0", 0, "Invalid filesystem name", EINVAL},
-	{4, "ext4", 0, "Invalid option", EINVAL},
-	{1, (char *)-1, 0, "Address is out of your address space", EFAULT},
+	{4, NULL, 0, "Invalid option", EINVAL},
+	{1, NULL, 0, "Address is out of your address space", EFAULT},
 	{2, NULL, 1000, "fs_index is out of bounds", EINVAL}
 };
 
 static void verify_sysfs05(unsigned int nr)
 {
 	struct test_case *tc = &tcases[nr];
+	char buf[1024];
 
-	if (tc->option == 1)
+	if (tc->option == 1) {
 		TST_EXP_FAIL(tst_syscall(__NR_sysfs, tc->option, tc->fsname),
 					tc->exp_errno, "%s", tc->err_desc);
-	else
-		TST_EXP_FAIL(tst_syscall(__NR_sysfs, tc->option, tc->fsindex, bad_addr),
+	} else {
+		TST_EXP_FAIL(tst_syscall(__NR_sysfs, tc->option, tc->fsindex, buf),
 					tc->exp_errno, "%s", tc->err_desc);
-
+	}
 }
 
 static void setup(void)
 {
 	unsigned int i;
+	char *bad_addr;
 
 	bad_addr = tst_get_bad_addr(NULL);
 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
