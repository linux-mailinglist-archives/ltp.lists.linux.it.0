Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 587C064EACB
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Dec 2022 12:43:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B3BCD3CBC2C
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Dec 2022 12:43:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 309F53C8C27
 for <ltp@lists.linux.it>; Fri, 16 Dec 2022 12:43:36 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 38FA11A00FB5
 for <ltp@lists.linux.it>; Fri, 16 Dec 2022 12:43:35 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 69BF122E04;
 Fri, 16 Dec 2022 11:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1671191015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=emj4zIzzPngeqGs/oTaez8xOAJp3538VpDKasrib1O0=;
 b=xdNguZ5mQYzW7wShN+a9966IQaIGf7Kloh0jf5VT4WL6IkiGHx0uczZlYN9yFlqGZwrbRF
 YWe57Hi/3aEwERt9cnGcfPazGHzICeuSjQwkavTABllWFEMIHOQi1zhpSh4xNertz9UE2k
 Q6dhhAtIWNZ2iCwd91S7mF2iUN1tt3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1671191015;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=emj4zIzzPngeqGs/oTaez8xOAJp3538VpDKasrib1O0=;
 b=Wf2WplFYJrQXFlMrzBwoeurNOuVZ1kSYm0CFQzqn36GV0x3P9LfNzUz33cwVbrmCrjT4iJ
 CykFMuC6G3csWBDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3DAC7138F0;
 Fri, 16 Dec 2022 11:43:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6P5ADedZnGNlFAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 16 Dec 2022 11:43:35 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 16 Dec 2022 12:43:31 +0100
Message-Id: <20221216114331.28883-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] aio-stress: TCONF on O_DIRECT on tmpfs
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

O_DIRECT is not supported on tmpfs. This flag is added by -O option,
thus cannot be filtered with .skip_filesystems.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/io/ltp-aiodio/aio-stress.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/io/ltp-aiodio/aio-stress.c b/testcases/kernel/io/ltp-aiodio/aio-stress.c
index 39db14d651..f20383dcfc 100644
--- a/testcases/kernel/io/ltp-aiodio/aio-stress.c
+++ b/testcases/kernel/io/ltp-aiodio/aio-stress.c
@@ -1239,10 +1239,13 @@ static void setup(void)
 	if (tst_parse_int(str_num_threads, &num_threads, 1, INT_MAX))
 		tst_brk(TBROK, "Invalid number of threads '%s'", str_num_threads);
 
-	if (str_o_flag)
+	if (str_o_flag) {
+		if (tst_fs_type(".") == TST_TMPFS_MAGIC)
+			tst_brk(TCONF, "O_DIRECT not supported on tmpfs");
 		o_flag = O_DIRECT;
-	else
+	} else {
 		o_flag = O_SYNC;
+	}
 
 	if (str_use_shm) {
 		if (!strcmp(str_use_shm, "shm")) {
-- 
2.39.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
