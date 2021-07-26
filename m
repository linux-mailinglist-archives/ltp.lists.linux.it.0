Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FE13D5CE2
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 17:23:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72DC13C9241
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 17:23:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2A30B3C6733
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 17:23:18 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7255B1000A0A
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 17:23:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D67091FD34
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 15:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627312996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6dsdnBqgm4mvmyoQS4n4i2vssCfYdpfAOlAnFxiTLV4=;
 b=BEtQQcD+AANhl3HM/FO4g8QdEsJ9wSEOG12iODmlEaGJH//DsUs1FhPvHMUq/k5AdEi7Ej
 rF6RluZmKKW/8Qy4BHSfm+lwEbeqKJZqdXviKx2QKhz3A3HGqyaN2LeYhwElY8wZ0xLvbi
 2SHrG7gMhHP4j7Zk4UF9DcjuW9LqUA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627312996;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6dsdnBqgm4mvmyoQS4n4i2vssCfYdpfAOlAnFxiTLV4=;
 b=gSr1SBNpkSBo3JO8IaX34mIwi6QkD3cR8Zs395S82I/1OljeUzNWcvZkPk6lqDnVfA5hsi
 E3ym/nyvRkaBJqCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C626D13B44
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 15:23:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CJh7L2TT/mDwYwAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 15:23:16 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Jul 2021 17:22:55 +0200
Message-Id: <20210726152255.16868-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210726152255.16868-1-mdoucha@suse.cz>
References: <20210726152255.16868-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] Replace the xxd utility with tst_hexdump
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

The xxd utility is part of Vim suite and may not be available on embedded
systems. Replace it with internal LTP helper program.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1: None

Note: I couldn't test ima_selinux.sh changes because SLES kernel don't support
measure func=CRITICAL_DATA yet. ima_keys.sh appears to work correctly.

 testcases/kernel/security/integrity/ima/tests/ima_keys.sh   | 6 +++---
 .../kernel/security/integrity/ima/tests/ima_selinux.sh      | 4 +---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
index 3476b8007..995a55fed 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
@@ -6,7 +6,7 @@
 #
 # Verify that keys are measured correctly based on policy.
 
-TST_NEEDS_CMDS="cmp cut grep sed xxd"
+TST_NEEDS_CMDS="cmp cut grep sed"
 TST_CNT=2
 TST_NEEDS_DEVICE=1
 TST_SETUP=setup
@@ -82,7 +82,7 @@ test1()
 		algorithm=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f1)
 		keyring=$(echo "$line" | cut -d' ' -f5)
 
-		echo "$line" | cut -d' ' -f6 | xxd -r -p > $test_file
+		echo "$line" | cut -d' ' -f6 | tst_hexdump -d > $test_file
 
 		if ! expected_digest="$(compute_digest $algorithm $test_file)"; then
 			tst_res TCONF "cannot compute digest for $algorithm"
@@ -126,7 +126,7 @@ test2()
 		tst_brk TBROK "unable to import a certificate into $keyring_name keyring"
 
 	grep $keyring_name $ASCII_MEASUREMENTS | tail -n1 | cut -d' ' -f6 | \
-		xxd -r -p > $temp_file
+		tst_hexdump -d > $temp_file
 
 	if [ ! -s $temp_file ]; then
 		tst_res TFAIL "keyring $keyring_name not found in $ASCII_MEASUREMENTS"
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_selinux.sh b/testcases/kernel/security/integrity/ima/tests/ima_selinux.sh
index c2af0e298..a4eb60b16 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_selinux.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_selinux.sh
@@ -100,8 +100,6 @@ test1()
 # configuration.
 test2()
 {
-	tst_check_cmds xxd || return
-
 	local measured_data state_file="$TST_TMPDIR/selinux_state.txt"
 	local data_source_name="selinux"
 	local pattern="data_sources=[^[:space:]]*$data_source_name"
@@ -127,7 +125,7 @@ test2()
 	digest=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f2)
 	algorithm=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f1)
 
-	echo "$line" | cut -d' ' -f6 | xxd -r -p > $state_file
+	echo "$line" | cut -d' ' -f6 | tst_hexdump -d > $state_file
 
 	expected_digest="$(compute_digest $algorithm $state_file)" || \
 	tst_brk TCONF "cannot compute digest for $algorithm"
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
