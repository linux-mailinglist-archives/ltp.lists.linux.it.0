Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D803946F9
	for <lists+linux-ltp@lfdr.de>; Fri, 28 May 2021 20:26:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22D893C935A
	for <lists+linux-ltp@lfdr.de>; Fri, 28 May 2021 20:26:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 47F8D3C2A33
 for <ltp@lists.linux.it>; Fri, 28 May 2021 20:26:39 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 990E81001374
 for <ltp@lists.linux.it>; Fri, 28 May 2021 20:26:38 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 606521FD2E
 for <ltp@lists.linux.it>; Fri, 28 May 2021 18:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622226397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4TyKjleTb6+sPvy2TF191eLjJiEaxdIKilJpz7ECKTQ=;
 b=xd2wJQsLX3PGjgjLLWsfNhFudAqWTUq6CYO9v0Lomz4zTz+lk0IiS54ymXHM7g7RnYeU0S
 ekMieCaFX5lwHb9ETmkSIpKH84EPZwu7PH9l7zNVy+4IjZbZx9XuVlyC2Yfa2RuLDhGRzQ
 micFnMrFa8vRexwsOGb9EQ8ZGxKRZOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622226397;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4TyKjleTb6+sPvy2TF191eLjJiEaxdIKilJpz7ECKTQ=;
 b=iTuk9F2jRBbfE4VLcjf6NowM4rBcXkdUhfZ2Ng1OstcmDoepnExaXaCJeSDABJzSZo37WV
 O23tlibiWaG+SWBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id CD6ED118DD
 for <ltp@lists.linux.it>; Fri, 28 May 2021 18:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622226396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4TyKjleTb6+sPvy2TF191eLjJiEaxdIKilJpz7ECKTQ=;
 b=O+E4NIJlhDhl6mWfm4VR2/VTSaPF32zDso2wHYHuLgASTkrfAFg8iHmqZyZK0sN0+uZkrQ
 lQvyr9HqiS5rghV5ylN0lTgNI6KVBAO2tMZw4r0kKSHdV1qhDZw+p6r1gAktu2bpn65zHI
 bk2ccT1sTuReKpr6Mw4rF6RnYtJsT9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622226396;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4TyKjleTb6+sPvy2TF191eLjJiEaxdIKilJpz7ECKTQ=;
 b=kMMa96h3M6B/UHVXRVmO51vruuKtWItZ82DZNqVLejAmtXOqpscTgT5VXZ0xmN2jiLBooL
 5i12g2ylTp+qJVBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 1X/TMNw1sWArYwAALh3uQQ (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 28 May 2021 18:26:36 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 28 May 2021 20:25:49 +0200
Message-Id: <20210528182549.14347-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: imap.suse.de;
	none
X-Spam-Score: 5.00
X-Spamd-Result: default: False [5.00 / 100.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; R_MISSING_CHARSET(2.50)[];
 MIME_GOOD(-0.10)[text/plain]; TO_DN_NONE(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 PREVIOUSLY_DELIVERED(0.00)[ltp@lists.linux.it];
 RCPT_COUNT_ONE(0.00)[1];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] doc: Modernize test-writing-guidelines
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 doc/test-writing-guidelines.txt | 80 ++++++++++++++++++++++-----------
 1 file changed, 53 insertions(+), 27 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 437239b97..e29ee4f6d 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1,9 +1,9 @@
 LTP Test Writing Guidelines
 ===========================
 
-This document describes LTP guidelines and LTP test interface and is intended
-for anybody who want to write or modify a LTP testcase. It's not a definitive
-guide and it's not, by any means, a substitute for common sense.
+This document describes LTP guidelines and is intended for anybody who want to
+write or modify a LTP testcase. It's not a definitive guide and it's not, by
+any means, a substitute for common sense.
 
 NOTE: See also
       https://github.com/linux-test-project/ltp/wiki/C-Test-API[C Test API],
@@ -105,14 +105,33 @@ were drifting slowly apart which yielded into API misuses and hard to find
 bugs. Remember there is only one thing worse than no documentation, wrong
 documentation.
 
-Generally everybody should write code that is obvious (which unfortunately
-isn't always possible). If there is a code that needs to be commented keep it
-short and to the point. Never ever comment the obvious.
+Ideally everybody should write code that is obvious, which unfortunately
+isn't always possible. But here are some tips:
 
-In case of LTP testcases it's customary to add a paragraph with highlevel test
-description somewhere at the beginning of the file (usually right under the GPL
-header). This helps other people to understand the overall goal of the test
-before they dive into the technical details.
+* First of all I will repeat *Keep things simple*
+
+* Keep function and variable names short but descriptive, choosing a good name
+  for an API function is very difficuilt task; do not underestimate it
+
+* Keep functions reasonably short and focused on a single task
+
+* Be consistent
+
+* Avoid deep nesting
+
+* DRY
+
+If there is a code that requires to be commented keep it short and to the
+point. These comments should explain *why* and not *how* thigs are done.
+
+Never ever comment the obvious.
+
+In case of LTP testcases it's customary to add a comment with an asciidoc
+formatted paragraph with highlevel test description at the beginning of the
+file right under the GPL SPDX header. This helps other people to understand
+the overall goal of the test before they dive into the technical details. It's
+also exported into generated documentation hence it should mostly explain what
+is tested and why.
 
 1.5 Backwards compatibility
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -124,20 +143,27 @@ toolchain supplied by the manufacturer.
 
 Therefore LTP test for more current features should be able to cope with older
 systems. It should at least compile fine and if it's not appropriate for the
-configuration it should return 'TCONF' (see test interface description below).
+configuration it should return 'TCONF'.
 
 There are several types of checks we use:
 
 The *configure script* is usually used to detect availability of a function
-declarations in system headers. It's used to disable tests at compile time.
-
-We also have runtime kernel version detection that can be used to disable
-tests at runtime.
+declarations in system headers. It's used to disable tests at compile time or
+to enable fallback definitions.
 
 Checking the *errno* value is another type of runtime check. Most of the
 syscalls returns either 'EINVAL' or 'ENOSYS' when syscall was not implemented
 or was disabled upon kernel compilation.
 
+LTP has kernel version detection that can be used to disable tests at runtime,
+unfortunatelly kernel version does not always corresponds to a well defined
+feature set as distributions tend to backport hundreds of patches while the
+kernel version stays the same. Use with caution.
+
+Lately we added kernel '.config' parser, a test can define a boolean
+expression of kernel config variables that has to be satisfied in order for a
+test to run. This is mostly used for kernel namespaces at the moment.
+
 Sometimes it also makes sense to define a few macros instead of creating
 configure test. One example are Linux specific POSIX clock ids in
 'include/lapi/posix_clocks.h'.
@@ -145,15 +171,14 @@ configure test. One example are Linux specific POSIX clock ids in
 1.6 Dealing with messed up legacy code
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-LTP contains a lot of old and messy code and we are cleaning it up as fast as
-we can but despite the efforts there is still a lot. If you start modifying
-old or a messed up testcase and your changes are more complicated than simple
-typo fixes you should do a cleanup first (in a separate patch). It's easier to
-review the changes if you separate the formatting fixes from the changes that
-affects the test behavior.
+LTP still contains a lot of old and messy code and we are cleaning it up as
+fast as we can but despite the decade of efforts there is still a lot. If you
+start modifying old or a messy testcase and your changes are more complicated
+than simple typo fixes you should convert the test into a new library first.
 
-The same goes for moving files. If you need a rename or move file do it in a
-separate patch.
+It's also much easier to review the changes if you split them into a smaller
+logical groups. The same goes for moving files. If you need a rename or move
+file do it in a separate patch.
 
 1.7 License
 ~~~~~~~~~~~
@@ -176,10 +201,11 @@ stdout and reports overall success/failure via the exit value.
 
 Tests are generally placed under the 'testcases/' directory. Everything that
 is a syscall or (slightly confusingly) libc syscall wrapper goes under
-'testcases/kernel/syscalls/'. Then there is 'testcases/open_posix_testsuite'
-which is a well maintained fork of the upstream project that has been dead
-since 2005 and also a number of directories with tests for more specific
-features.
+'testcases/kernel/syscalls/'.
+
+Then there is 'testcases/open_posix_testsuite' which is a well maintained fork
+of the upstream project that has been dead since 2005 and also a number of
+directories with tests for more specific features.
 
 2.1.1 Runtest Files
 ^^^^^^^^^^^^^^^^^^^
-- 
2.26.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
