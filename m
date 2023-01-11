Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F267665D7A
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Jan 2023 15:16:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E40F53CCAD7
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Jan 2023 15:16:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 21A8A3CB560
 for <ltp@lists.linux.it>; Wed, 11 Jan 2023 15:16:21 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CC2716005C1
 for <ltp@lists.linux.it>; Wed, 11 Jan 2023 15:16:20 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 04A6B17B91
 for <ltp@lists.linux.it>; Wed, 11 Jan 2023 14:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673446580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0mBhuf0WxA9xC1xNHS+tglhRb0jBJiNdbaEHhRUUETE=;
 b=j0C6zPREkNHZk50PsL0Ajxmd9RuEl/zlfVJlpmXN1x5uZ+1YWVXTOFVqc/mrtRRtaYKemo
 xsfvV0ThXXX0PAGRYe1fDbSs7FqPfKfLD78q48+hLHaKA7tDpgM1BQPh8re2E5MdajSP5P
 kZOrFQ+IdA3eBdShkepFf/GIKUg3E3Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673446580;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0mBhuf0WxA9xC1xNHS+tglhRb0jBJiNdbaEHhRUUETE=;
 b=g2NgpfR5dFH21WIkDaG3ZQD0e64Xc8apsi82PgMlH4kTwN6FkrEZS3dIMyFZFtF79TiDBk
 edO1J2Q5AYNnxYBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B1661358A
 for <ltp@lists.linux.it>; Wed, 11 Jan 2023 14:16:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BPykD7PEvmMACgAAMHmgww
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Wed, 11 Jan 2023 14:16:19 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Wed, 11 Jan 2023 19:46:16 +0530
Message-Id: <20230111141616.20011-1-akumar@suse.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] c-test-tutorial-simple.txt: improve documentation
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

Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 doc/c-test-tutorial-simple.txt | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/doc/c-test-tutorial-simple.txt b/doc/c-test-tutorial-simple.txt
index 89b0ad4e7..c5861cb36 100644
--- a/doc/c-test-tutorial-simple.txt
+++ b/doc/c-test-tutorial-simple.txt
@@ -333,16 +333,16 @@ call in the +*.in+ files (e.g. +x86_64.in+) which are used to generate
 may find the system call number is missing from the +*.in+ files and will need
 to add it (see +include/lapi/syscalls/strip_syscall.awk+).
 
-System call numbers vary between architectures, hence why there are multiple
+System call numbers vary between architectures, hence there are multiple
 +*.in+ files for each architecture. You can find the various values for the
-+statx+ system call across a number of +uinstd.h+ files in the Linux kernel.
++statx+ system call across a number of +unistd.h+ files in the Linux kernel.
 
 Note that we don't use the system-call-identifier value available in
-+/usr/include/linux/uinstd.h+ because the kernel might be much newer than the
++/include/uapi/linux/unistd.h+ because the kernel might be much newer than the
 user land development packages.
 
-For +statx+ we had to add +statx 332+ to +testcases/kernel/include/x86_64.in+,
-+statx 383+ to +testcases/kernel/include/powerpc.in+, etc.  Now lets look at
+For +statx+ we had to add +statx 332+ to +include/lapi/syscalls/x86_64.in+,
++statx 383+ to +include/lapi/syscalls/powerpc.in+, etc.  Now lets look at
 the code, which I will explain in more detail further down.
 
 [source,c]
@@ -1007,7 +1007,7 @@ We can then send this patch with the following command sans +--dry-run+.
 $ git send-email --dry-run output/v2-0001-tutorial-Add-a-step-by-step-C-test-tutorial.patch
 --------------------------------------------------------------------------------
 
-Git will ask some questions (which you an ignore) and then tell you what it
+Git will ask some questions (which you can ignore) and then tell you what it
 would do if this weren't a dry-run. In order for this to work you have to have
 a valid SMTP server set in +.gitconfig+ and also be signed up to the LTP
 mailing list under the same e-mail address you have configured in Git. You can
-- 
2.39.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
