Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB07495C96
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 10:15:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DF843C96F1
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 10:15:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F0A693C9232
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 10:15:03 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 44C801A01126
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 10:15:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7F60B1F3C0;
 Fri, 21 Jan 2022 09:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642756502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=X1uqoI4enFOEueYnMRf5AmgchDF2KdKhtDV8DUF0FQE=;
 b=KwjTvPmS5SIQkz3/2aporKHeMoZjS3bXgUvAT+M2nT0Jjaw9lvDN3ikeOc5D86NmD2sqGd
 EOBRFnUUX7+9+lJU2Yk8wNgCScoYnTqu6QZH7gZLe944SGRUb+5soxFRq7hz9JmLCKB+40
 kVT+/u6Z1qhz3qT8KAi67czQgaIswYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642756502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=X1uqoI4enFOEueYnMRf5AmgchDF2KdKhtDV8DUF0FQE=;
 b=G3hNjtNtCEoM3PquH5fG//rOEHkg5VKXlz6JteND97D6RUmx7mCO13MTWV8zbNoNaVim1z
 Qvii/2T6E12kqIDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4DB6813C1A;
 Fri, 21 Jan 2022 09:15:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gwnTEJZ56mFETAAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Fri, 21 Jan 2022 09:15:02 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Fri, 21 Jan 2022 10:15:00 +0100
Message-Id: <20220121091500.8264-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Reduce needed memory by the dio_read test
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

The previous runtest file was requiring half an hour to complete using
quite amount of RAM. For 100 threads, the test would easily use ~3.5GB
of memory making really difficult to test on system with few resources.

With this modification we reduce both read and write buffer size, as
well as the file size, so test will take few minutes to complete and
we will reduce memory allocation.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.de>
---
 runtest/ltp-aiodio.part4 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/runtest/ltp-aiodio.part4 b/runtest/ltp-aiodio.part4
index fc1e1d479..54019d47b 100644
--- a/runtest/ltp-aiodio.part4
+++ b/runtest/ltp-aiodio.part4
@@ -62,7 +62,7 @@ DIT002 dio_truncate
 #Running read_checkzero
 #gread_checkzero
 #Running dio_read
-DOR000 dio_read -n 1 -i 100
-DOR001 dio_read -n 10 -i 30
-DOR002 dio_read -n 20 -i 15
-DOR003 dio_read -n 100 -i 4
+DOR000 dio_read -n 1 -i 100 -r 512k -w 512k -s 32M
+DOR001 dio_read -n 10 -i 30 -r 512k -w 512k -s 32M
+DOR002 dio_read -n 20 -i 15 -r 512k -w 512k -s 32M
+DOR003 dio_read -n 100 -i 4 -r 512k -w 512k -s 32M
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
