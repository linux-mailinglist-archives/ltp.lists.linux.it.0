Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8EFB84123
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Sep 2025 12:27:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DEB923CDD07
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Sep 2025 12:27:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A4C5A3CDBC9
 for <ltp@lists.linux.it>; Thu, 18 Sep 2025 12:26:53 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DA687140005D
 for <ltp@lists.linux.it>; Thu, 18 Sep 2025 12:26:52 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 683843370E;
 Thu, 18 Sep 2025 10:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758191210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m3k6NCq9ThFMgnENfwBchg7fSqv7ePRaCT5p4aXg7wk=;
 b=mke/9QfjtbI88nKOogYQllJQV6T9ibBBzCXXj6dF4/+8NdloH9KYiGSrykgJ8uuoOBQm0m
 PTCKIYGg9vhH+Vkn1ZUyeTuhQyVM8XeF8tOUOnAbAQ4dDCd3V/0nB2nqaT/JiAEgTcUMDB
 ICdvkeMACQLXyuIcJpRQbiB74Cql2eo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758191210;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m3k6NCq9ThFMgnENfwBchg7fSqv7ePRaCT5p4aXg7wk=;
 b=9i5W7NkQ7zWSldVaG0MkRNX4MGdLbAerggt10F5CBhsm2Cwc3w+w1uuTnbFt9PfyHBV/XX
 KkbVRUf4NRsiVZDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1758191209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m3k6NCq9ThFMgnENfwBchg7fSqv7ePRaCT5p4aXg7wk=;
 b=vKvETKgitM5gw27KaajfwgOMHoK3TFu6U+ekpBp4uOAqWxbSfj8X8RlaVNocKoGxBHL9nE
 +f9p/squcvqa7oxHnkepSen78KwilzjkuN06ItWhhl2mgX38z/9KUbPuxhIAWUMZ10nhzJ
 r2VU05LRascPhaBBHBQw2Ukv4RhGYkw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1758191209;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=m3k6NCq9ThFMgnENfwBchg7fSqv7ePRaCT5p4aXg7wk=;
 b=Eespccwz1Eotd6KgE9kccmYy1/H49BtbUNgheKfJMD7TItE9Mx3AA5YU1vmvclnhYqr3RS
 1c8zgBIkFK70jdDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 251D213A51;
 Thu, 18 Sep 2025 10:26:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1l77B2ney2iubQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 18 Sep 2025 10:26:49 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 18 Sep 2025 12:26:46 +0200
Message-ID: <20250918102646.403590-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 TO_DN_SOME(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.cz:mid, suse.cz:email,
 suse.com:email, imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -2.80
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [COMMITTED] Revert "ima_policy.sh: Optimize check for policy
 writable"
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
Cc: linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This reverts commit 31bb2bbdd3ecfe4b4557d3678f80fe61ace340d0.

c38b528783 demonstrated a bug introuduced by 31bb2bbdd3 on SUT on kernel
without CONFIG_IMA_KEYRINGS_PERMIT_SIGNED_BY_BUILTIN_OR_SECONDARY.

on tmpfs TMPDIR fails on umount:
...
ima_policy 2 TCONF: IMA policy already loaded and kernel not configured to enable multiple writes to it (need CONFIG_IMA_WRITE_POLICY=y)
ima_policy 2 TCONF: IMA policy already loaded and kernel not configured to enable multiple writes to it (need CONFIG_IMA_WRITE_POLICY=y)
umount: /tmp/LTP_ima_policy.23MpPS2XWr/mntpoint: target is busy.
ima_policy 2 TINFO: umount(/tmp/LTP_ima_policy.23MpPS2XWr/mntpoint) failed, try 1 ...
ima_policy 2 TINFO: Likely gvfsd-trash is probing newly mounted  fs, kill it to speed up tests.

on non-tmpfs TMPDIR (fails to remove temporary directory):
...
ima_policy 2 ima_policy 2 TCONF: IMA policy already loaded and kernel not configured to enable multiple writes to it (need CONFIG_IMA_WRITE_POLICY=y)
TCONF: IMA policy already loaded and kernel not configured to enable multiple writes to it (need CONFIG_IMA_WRITE_POLICY=y)
rm: cannot remove '/var/tmp/LTP_ima_policy.bujyrIYMGz': No such file or directory

Both errors are caused due load_policy() calling require_policy_writable(),
which calls tst_brk(). load_policy() spaws a new process, therefore it
should not call tst_brk (or otherwise exit a test) because ima_cleanup()
is then called twice (which causes the above problems).

Reported-by: Avinesh Kumar <akumar@suse.de>
Reported-by: Petr Cervinka <pcervinka@suse.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .../kernel/security/integrity/ima/tests/ima_policy.sh  | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/tests/ima_policy.sh b/testcases/kernel/security/integrity/ima/tests/ima_policy.sh
index 490c8b6c2e..d66f261a81 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_policy.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_policy.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2009 IBM Corporation
-# Copyright (c) 2018-2025 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2018-2020 Petr Vorel <pvorel@suse.cz>
 # Author: Mimi Zohar <zohar@linux.ibm.com>
 #
 # Test replacing the default integrity measurement policy.
@@ -11,6 +11,8 @@ TST_CNT=2
 
 setup()
 {
+	require_policy_writable
+
 	VALID_POLICY="$TST_DATAROOT/measure.policy"
 	[ -f $VALID_POLICY ] || tst_brk TCONF "missing $VALID_POLICY"
 
@@ -18,11 +20,13 @@ setup()
 	[ -f $INVALID_POLICY ] || tst_brk TCONF "missing $INVALID_POLICY"
 }
 
+# NOTE: function spaws a new process, therefore it should not call tst_brk()
+# (or otherwise exit a test), because that calls ima_cleanup() twice (which
+# breaks umount on TMPDIR or removing TMPDIR).
 load_policy()
 {
 	local ret
 
-	require_policy_writable
 	exec 2>/dev/null 4>$IMA_POLICY
 	[ $? -eq 0 ] || exit 1
 
@@ -42,6 +46,7 @@ test1()
 
 	local p1
 
+	require_policy_writable
 	load_policy $INVALID_POLICY & p1=$!
 	wait "$p1"
 	if [ $? -ne 0 ]; then
@@ -57,6 +62,7 @@ test2()
 
 	local p1 p2 rc1 rc2
 
+	require_policy_writable
 	load_policy $VALID_POLICY & p1=$!
 	load_policy $VALID_POLICY & p2=$!
 	wait "$p1"; rc1=$?
-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
