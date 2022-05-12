Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9465255FE
	for <lists+linux-ltp@lfdr.de>; Thu, 12 May 2022 21:46:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 83B2F3CA9DB
	for <lists+linux-ltp@lfdr.de>; Thu, 12 May 2022 21:46:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1F0113CA9B9
 for <ltp@lists.linux.it>; Thu, 12 May 2022 21:46:05 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 82DC81A00CD8
 for <ltp@lists.linux.it>; Thu, 12 May 2022 21:46:05 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 32E7B1F900;
 Thu, 12 May 2022 19:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1652384765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HX19wF1LfbAYYnJEJ6KmQ8KJXcRGGo2ztITVDGrBqnk=;
 b=hx61SqvU5J9ECJKRHK2KNDVxkTJ12MNESQE7/0GlXZ1wvQrXoeiYmkdVkE9MmETgWPDtd/
 2XqPBTmjARf75mMOJua1owH64LC86rNnxHRXBfyamAhJOklJ9wKTx1midwqt0mbhlE+zH9
 dTBDPva538p4P+7zi1FJfM8q4TsB38o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1652384765;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HX19wF1LfbAYYnJEJ6KmQ8KJXcRGGo2ztITVDGrBqnk=;
 b=LgMmeQIgJa9FZMOtv+TIvmY8NCop2F2J7W3/bR585ZzPy1ZzT0l31s7cbokr91MnAo2oyS
 idvPyPd+rGvpp7DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD9A013ABE;
 Thu, 12 May 2022 19:46:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aD+cL/xjfWIkVwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 12 May 2022 19:46:04 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 12 May 2022 21:45:52 +0200
Message-Id: <20220512194557.30911-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512194557.30911-1-pvorel@suse.cz>
References: <20220512194557.30911-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 3/8] tst_test.sh: Improve pattern for allowed variables
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
Cc: Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

to allow using '... $TST_FOO'

i.e. without filtering '
EXPECT_PASS "grep '$TST_MNTPOINT $TST_FS_TYPE' /proc/mounts"
would produce warning:
tst_mount_device 1 TWARN: Reserved variable TST_FS_TYPE' used!
because sed filters it as: FS_TYPE'

Will be needed for next commit.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_test.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 1fe77d50d..0f1a63aac 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -621,7 +621,7 @@ tst_run()
 	local _tst_name
 
 	if [ -n "$TST_TEST_PATH" ]; then
-		for _tst_i in $(grep '^[^#]*\bTST_' "$TST_TEST_PATH" | sed 's/.*TST_//; s/[="} \t\/:`].*//'); do
+		for _tst_i in $(grep '^[^#]*\bTST_' "$TST_TEST_PATH" | sed 's/.*TST_//; s/[="} \t\/:`'"'"'].*//'); do
 			case "$_tst_i" in
 			DISABLE_APPARMOR|DISABLE_SELINUX);;
 			SETUP|CLEANUP|TESTFUNC|ID|CNT|MIN_KVER);;
-- 
2.36.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
