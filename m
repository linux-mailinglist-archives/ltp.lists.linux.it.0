Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E57C13FC704
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 14:26:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 216433C9A56
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 14:26:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DA05F3C2A67
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 14:26:16 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 56722200B73
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 14:26:16 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9F0EF22209;
 Tue, 31 Aug 2021 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1630412775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Nk+U2VM9ADHUICK2G+obVvtRZdBzuLRnMPbYLWjy01Q=;
 b=HuZCfeZRc7zvHXHB23nA4cYKg7m/57LDJv35ZcaNFth2LnSjS/0bYo0PmiB8BUJHb4K/oN
 wb7SEi2Ct6Tk4epqYB8Qx+2YuJNqJdGGdr6QlbKq8ea+Kjj06z1NFZc93xcvaxhSk4cPRK
 kW4QbosT2w4i1ATTw46lvWaYyNeNYXY=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 6C54CA3B92;
 Tue, 31 Aug 2021 12:26:15 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 31 Aug 2021 13:25:53 +0100
Message-Id: <20210831122554.14590-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] docs: rm explicit reference to checkpatch.pl
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

It is included in `make check` now.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 doc/maintainer-patch-review-checklist.txt | 3 +--
 doc/test-writing-guidelines.txt           | 5 ++---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/doc/maintainer-patch-review-checklist.txt b/doc/maintainer-patch-review-checklist.txt
index 58662bed1..c8ace80f7 100644
--- a/doc/maintainer-patch-review-checklist.txt
+++ b/doc/maintainer-patch-review-checklist.txt
@@ -38,8 +38,7 @@ New test should
 ### C tests
 * Use new https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#22-writing-a-test-in-c[C API]
 * Test binaries are added into corresponding '.gitignore' files
-* Check coding style with
-  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/scripts/checkpatch.pl[checkpatch.pl] and `make check`
+* Check coding style with `make check`
   (more in https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#21-c-coding-style[C coding style])
 * Docparse documentation
 * If a test is a regression test it should include tags
diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 340c80cc6..e95373e84 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -305,12 +305,11 @@ NOTE: See also
       https://github.com/linux-test-project/ltp/wiki/Maintainer-Patch-Review-Checklist[Maintainer Patch Review Checklist].
 
 1. Test compiles and runs fine (check with `-i 10` too)
-2. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/scripts/checkpatch.pl[checkpatch.pl]
-   does not report any errors
+2. `make check` does not emit any warnings for the test you are working on
+   (hint: run it in the test's directory and/or use `make check-$TCID`)
 3. The runtest entires are in place
 4. Test binaries are added into corresponding '.gitignore' files
 5. Patches apply over the latest git
-6. 'make check' does not emit any warnings
 
 6.1 About .gitignore files
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
