Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B230496192
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 15:54:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A6913C970A
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 15:54:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2852D3C96A3
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 15:54:00 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CC8A31400B88
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 15:53:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3685821101;
 Fri, 21 Jan 2022 14:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642776839; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qc3ebvXX5BZ/I29WAoj68n0TFGWt5dXvBQnBEcUsVjE=;
 b=lMZU1MaAojpzLCpDoJT60DzockW+bPURoYMubSIwqk1RM2RNycs8r7harn0Z15O0addauk
 OXixFwNL9KMEChfrVLRxaHLxSHzXeoIV6LFvrCqLzyBXmUcpQY8oTTILKDFJLD/IU0G8z5
 +ocdZgIro8drA5OX0PvqnL/cOwW63wI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642776839;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qc3ebvXX5BZ/I29WAoj68n0TFGWt5dXvBQnBEcUsVjE=;
 b=yfwFqteThcC3823L2zxE2wno/gev8EI3Es82jNt0dfvr0EKTY8xX3gYreqysrYvDCewDy8
 8YnOzItdgh6e6JCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71C5813671;
 Fri, 21 Jan 2022 14:53:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5GGqFAbJ6mHqcwAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Fri, 21 Jan 2022 14:53:58 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Fri, 21 Jan 2022 15:53:55 +0100
Message-Id: <20220121145355.20327-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Reduce default children in dio_read test
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

We reduce default children from 100 to 8 in order to reduce time
execution and memory footprint consuption when using default
values.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.de>
---
 testcases/kernel/io/ltp-aiodio/dio_read.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/io/ltp-aiodio/dio_read.c b/testcases/kernel/io/ltp-aiodio/dio_read.c
index 2c2ec4bce..8183b7211 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_read.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_read.c
@@ -26,7 +26,7 @@ static char *str_readsize;
 static char *str_filesize;
 
 static char *filename = "file.bin";
-static int numchildren = 100;
+static int numchildren = 8;
 static long long writesize = 32 * 1024 * 1024;
 static long long readsize = 32 * 1024 * 1024;
 static long long filesize = 128 * 1024 * 1024;
@@ -171,7 +171,7 @@ static struct tst_test test = {
 	.needs_tmpdir = 1,
 	.forks_child = 1,
 	.options = (struct tst_option[]) {
-		{"n:", &str_numchildren, "Number of threads (default 100)"},
+		{"n:", &str_numchildren, "Number of threads (default 16)"},
 		{"w:", &str_writesize, "Size of writing blocks (default 32M)"},
 		{"r:", &str_readsize, "Size of reading blocks (default 32M)"},
 		{"s:", &str_filesize, "File size (default 128M)"},
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
