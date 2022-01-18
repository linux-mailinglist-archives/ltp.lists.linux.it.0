Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2AA492C77
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jan 2022 18:34:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0CDE83C965D
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jan 2022 18:34:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 244853C9404
 for <ltp@lists.linux.it>; Tue, 18 Jan 2022 18:34:53 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 25BF1600905
 for <ltp@lists.linux.it>; Tue, 18 Jan 2022 18:34:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3AC971F3A3;
 Tue, 18 Jan 2022 17:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642527292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sSnh5Vz2OTYQffmOx4olo5PqoQ0mwlN73RToNNYRj7U=;
 b=c0w7ZTrjwyJyGXzls2zoU6o78AubEvFqOFXvv8JEjEvbKdpmS+iu7/WpwFXnmRbEmNlbN2
 rBn2N1fgo8/jFxz4ETKP4vmLR6jjBy5sgskyYZzK2tBF/HstKdMKZXvmmQVZlQclj/J19Z
 2k8a15ZFIx6M0EXLSi+9oShmL+yCD74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642527292;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sSnh5Vz2OTYQffmOx4olo5PqoQ0mwlN73RToNNYRj7U=;
 b=xufBzAnCbhs7bITz4OI90nZN/NxpISjDUOn8idTBDPYbvdLqfgefBdRraszeXuIuq+qo2v
 M86Sa2+bLw0R1MCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F066F13DC8;
 Tue, 18 Jan 2022 17:34:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KNylODv65mGYJgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 18 Jan 2022 17:34:51 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 18 Jan 2022 18:34:48 +0100
Message-Id: <20220118173448.21287-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH 1/1] utime03.c: Drop 9p whitelist
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

Reasons:
1) It's whitelisted as "v9", which is wrong: it'd have to be "9p" (which
is in tst_fs_type_name(), but even though it would not be considered
because test is using .all_filesystems = 1 and "9p" it's not in
tst_fs_type_name() (the list of filesystems being used for .all_filesystems).

2) Tested - not needed. Working on 9p mounted on guests VMs with 5.16,
5.2.1 and 4.4.21 (on host with 5.16). The whitelist was added in 2011
(bc5da68248), i.e. kernel 2.6.

Use the same name as in tst_fs_type_name() to actually skip it.

Acked-by: Cyril Hrubis <chrubis@suse.cz>
Acked-by: Li Wang <liwang@redhat.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/utime/utime03.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/testcases/kernel/syscalls/utime/utime03.c b/testcases/kernel/syscalls/utime/utime03.c
index 48cc3bae77..2358fd70b4 100644
--- a/testcases/kernel/syscalls/utime/utime03.c
+++ b/testcases/kernel/syscalls/utime/utime03.c
@@ -93,7 +93,6 @@ static struct tst_test test = {
 	.mntpoint = MNTPOINT,
 	.all_filesystems = 1,
 	.skip_filesystems = (const char *const[]) {
-		"v9",
 		"vfat",
 		"exfat",
 		NULL
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
