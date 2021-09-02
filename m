Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B683FEC3B
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 12:38:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B356C3C9953
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 12:38:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 00F8C3C2BD6
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 12:37:57 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 56141600F1D
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 12:37:57 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C4FE41FF7B;
 Thu,  2 Sep 2021 10:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630579076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eVHDUIV92QQl7vUtBVR4qiaLsw13tIsGCJPWLdrS1vA=;
 b=uUhBsU9j8kEnr8dMmNIv/BRG84Y3WwUpVrjgj0VjMYlRHhT7n+ZvP84CrFhbpJIGOUaW/5
 thNIP2DJJbd8EdH3RHanA8AHlM3Y/Y0ReNEr2uct3C9C3n6rfxELsI6T15yB9zVtqCYfgc
 f8RafWEoQJSTIz7dftiUwppM+KYF/lM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630579076;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eVHDUIV92QQl7vUtBVR4qiaLsw13tIsGCJPWLdrS1vA=;
 b=5Hr+lxfldLtFXZs8Xp7MpjcWgpd7I2e/FZ9/u7uFYCPSlncdQaJKbQ4fd2BiKsDlF34Yml
 DlVdMVATOD6pUZDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8D72D1371C;
 Thu,  2 Sep 2021 10:37:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id ULMNIYSpMGGmaAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 02 Sep 2021 10:37:56 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  2 Sep 2021 12:37:37 +0200
Message-Id: <20210902103740.19446-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210902103740.19446-1-pvorel@suse.cz>
References: <20210902103740.19446-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/4] doc: Mention make check
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

and our version of checkpatch.pl instead of suggesting to use upstream
on remaining places (just to be consistent).

Fixes: 4c1e61cc7 ("docs: rm explicit reference to checkpatch.pl")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/c-test-tutorial-simple.txt  | 21 ++++++++++-----------
 doc/test-writing-guidelines.txt | 10 +++++-----
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/doc/c-test-tutorial-simple.txt b/doc/c-test-tutorial-simple.txt
index aa6d19f8d..bacf2f1d9 100644
--- a/doc/c-test-tutorial-simple.txt
+++ b/doc/c-test-tutorial-simple.txt
@@ -228,12 +228,12 @@ the lines starting with a +++.
 --------------------------------------------------------------------------------
  statvfs01 statvfs01
  statvfs02 statvfs02
- 
+
 +statx01 statx01
 +
  stime01 stime01
  stime02 stime02
- 
+
 --------------------------------------------------------------------------------
 
 The +runtest+ files are in a two column format. The first column is the test
@@ -306,12 +306,11 @@ Wiki]).
 
 Is your +.gitignore+ correct?
 
-3.3 Run checkpatch.pl on the source file
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+3.3 Run make check
+~~~~~~~~~~~~~~~~~~
 
-The LTP follows the Linux style guidelines where possible. Check what happens
-if you run +kernel/linux/scripts/checkpatch.pl --no-tree -f statx01.c+ and
-correct any style issues.
+Check coding style with `make check`
+ (more in https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#21-c-coding-style[C coding style])
 
 3.4 Install the LTP and run the test with runtest
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -767,7 +766,7 @@ failing due to some faulty logic.
 6.1 What is wrong with the switch statement?
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-Were you paying attention? Also see the output of +checkpatch.pl+.
+Were you paying attention? Also see the output of +make check+.
 
 6.2 Test a feature unique to statx
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -795,9 +794,9 @@ of fallback logic in the build system. We can now get our test ready for
 submission.
 
 The first thing you need to do before considering submitting your test is run
-+scripts/checkpatch.pl --no-tree -f+ on +statx01.c+. Again, we use the kernel
-style guidelines where possible. Next you should create a new branch, this
-will allow you to reshape your commit history without fear.
++make check-statx01+ or + make check+ in the test's directory. Again, we use
+the kernel style guidelines where possible. Next you should create a new
+branch, this will allow you to reshape your commit history without fear.
 
 After that we have the pleasure of doing an interactive 'rebase' to clean up
 our commit history. In its current form the test only really needs a single
diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 12fe4922a..8053f0cb0 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -125,13 +125,13 @@ LTP adopted Linux kernel coding style. If you aren't familiar with its rules
 locate 'linux/Documentation/CodingStyle' in the kernel sources and read it,
 it's a well written introduction.
 
-There is also
+Run `make check` in the test's directory and/or use `make check-$TCID`,
+it uses (among other checks) our vendored version of
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/scripts/checkpatch.pl[checkpatch.pl]
-script from kernel git tree which can be used to check your patches before the
-submission. Please use reasonably recent one.
+script from kernel git tree.
 
-NOTE: If checkpatch.pl does not report any problems, the code still may be wrong
-      as the tool only looks for common mistakes.
+NOTE: If `make check` does not report any problems, the code still may be wrong
+      as all tools used for checking only look for common mistakes.
 
 2.2 Shell coding style
 ^^^^^^^^^^^^^^^^^^^^^^
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
