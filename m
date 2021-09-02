Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 201D83FEC40
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 12:38:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78D1B3C535D
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 12:38:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9B2313C939B
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 12:37:59 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 125DB1401202
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 12:37:58 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B692320335;
 Thu,  2 Sep 2021 10:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630579077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+oZvKFUntww7vn1lJVAH9C8rdPp2VBZAgImbTVU/Y7w=;
 b=OclNxIEQG+qRCIkwyUSQ+7+MkYG//Cr7QYPABU/3hxnonyH6x695Rc2XcfOAyHa+tAyG9S
 MHfc1zZ0FBgCFhz9T2rgZ5L4+cQfM2ZcmpaBRyzl4YG+xQSdFmCDHNi9tWALYHG0Fg2GFy
 jgERSFiLR/mWqnCFd9lO49pfQjHFNfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630579077;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+oZvKFUntww7vn1lJVAH9C8rdPp2VBZAgImbTVU/Y7w=;
 b=UGcW760E8ltcinBNed+QupQNvd/uYegy98cPFMzLRICrkK/XB8ntChiTZLG9tsIcpDD2eb
 paoAFx5eZKXaQ+Ag==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 76AEF13424;
 Thu,  2 Sep 2021 10:37:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id QCiVG4WpMGGmaAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 02 Sep 2021 10:37:57 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  2 Sep 2021 12:37:40 +0200
Message-Id: <20210902103740.19446-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210902103740.19446-1-pvorel@suse.cz>
References: <20210902103740.19446-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 4/4] doc: Update for vendored checkbashisms.pl
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

in previous commit.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/maintainer-patch-review-checklist.txt | 3 +--
 doc/test-writing-guidelines.txt           | 8 ++++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/doc/maintainer-patch-review-checklist.txt b/doc/maintainer-patch-review-checklist.txt
index c8ace80f7..c7bb47810 100644
--- a/doc/maintainer-patch-review-checklist.txt
+++ b/doc/maintainer-patch-review-checklist.txt
@@ -49,8 +49,7 @@ New test should
 
 ### Shell tests
 * Use new https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#23-writing-a-testcase-in-shell[shell API]
-* Check coding style with
-  https://salsa.debian.org/debian/devscripts/raw/master/scripts/checkbashisms.pl[checkbashism.pl]
+* Check coding style with `make check`
   (more in https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#132-shell-coding-style[Shell coding style])
 * If a test is a regression test it should include related kernel or glibc commits as a comment
 
diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 8053f0cb0..b87446d1b 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -150,9 +150,13 @@ to 'dash' by default or install 'dash' on your favorite distribution and use
 it to run the tests. If your distribution lacks 'dash' package you can always
 compile it from http://gondor.apana.org.au/~herbert/dash/files/[source].
 
-Debian also has nice devscript
+Run `make check` in the test's directory and/or use `make check-$TCID.sh`,
+it uses (among other checks) our vendored version of
 https://salsa.debian.org/debian/devscripts/raw/master/scripts/checkbashisms.pl[checkbashism.pl]
-that can be used to check for non-portable shell code.
+from Debian, that is used to check for non-portable shell code.
+
+NOTE: If `make check` does not report any problems, the code still may be wrong
+      as `checkbashisms.pl` used for checking only looks for common mistakes.
 
 Here are some common sense style rules for shell
 
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
