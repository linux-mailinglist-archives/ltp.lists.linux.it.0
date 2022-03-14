Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1731F4D8C1A
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Mar 2022 20:12:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CDC83CA81A
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Mar 2022 20:12:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C31F23C90D9
 for <ltp@lists.linux.it>; Mon, 14 Mar 2022 20:12:40 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4AA04600941
 for <ltp@lists.linux.it>; Mon, 14 Mar 2022 20:12:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0149F1F380;
 Mon, 14 Mar 2022 19:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1647285159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2vUGNnJge2yyrBD2v9yfVSURNvH2JJFK3vW+NLelac0=;
 b=QcRcTWCZc71H6FZyvV9DNQ2iFMVJg4gI5I+5i/fi/Ojmt9ExekCPI3bSMrAqdmke02KQvv
 PAp3Pq9EOj722LcEcok03WYT8B4wo6YGBCwGENrlsnrd6oiYeV30HEZZnU7N1xQPS9gOUt
 gW2tkvQuB5BAlONJYkrSBmi0XWU2Efg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1647285159;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2vUGNnJge2yyrBD2v9yfVSURNvH2JJFK3vW+NLelac0=;
 b=qUuuvUMsjZEAZtqrnPc4jZhAAZiqGD2cqNoJD5/umxlVWSHRsENM5QpgiayA7s3H+1KBrU
 yJB42sgFZ01t5sDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BECE413B3D;
 Mon, 14 Mar 2022 19:12:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RcW1K6aTL2J/bQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 14 Mar 2022 19:12:38 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 14 Mar 2022 20:12:34 +0100
Message-Id: <20220314191234.12382-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 1/1] creat09: Fix on more restrictive umask
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

XFS fails on umask 0077:

tst_test.c:1528: TINFO: Testing on xfs
tst_test.c:997: TINFO: Formatting /dev/loop0 with xfs opts='' extra opts=''
tst_test.c:1458: TINFO: Timeout per run is 0h 05m 00s
creat09.c:61: TINFO: User nobody: uid = 65534, gid = 65534
creat09.c:62: TINFO: Found unused GID 3: SUCCESS (0)
creat09.c:93: TPASS: mntpoint/testdir/creat.tmp: Owned by correct group
creat09.c:97: TFAIL: mntpoint/testdir/creat.tmp: Setgid bit is set
creat09.c:93: TPASS: mntpoint/testdir/open.tmp: Owned by correct group
creat09.c:97: TFAIL: mntpoint/testdir/open.tmp: Setgid bit is set

Thus clear the default umask.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/creat/creat09.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/syscalls/creat/creat09.c b/testcases/kernel/syscalls/creat/creat09.c
index bed7bddb0e..70da7d2fc7 100644
--- a/testcases/kernel/syscalls/creat/creat09.c
+++ b/testcases/kernel/syscalls/creat/creat09.c
@@ -56,6 +56,8 @@ static void setup(void)
 		(int)ltpuser->pw_gid);
 	free_gid = tst_get_free_gid(ltpuser->pw_gid);
 
+	umask(0);
+
 	/* Create directories and set permissions */
 	SAFE_MKDIR(WORKDIR, MODE_RWX);
 	SAFE_CHOWN(WORKDIR, ltpuser->pw_uid, free_gid);
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
