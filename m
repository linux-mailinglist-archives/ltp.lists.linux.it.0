Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C238495DC4
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 11:30:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 036043C96DF
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 11:30:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A584D3C9424
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 11:30:17 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 14AF6600A0E
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 11:30:16 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 10CD51F884;
 Fri, 21 Jan 2022 10:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642761016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8mMoUq4QffSmj0luTlz9AQna59umyeadd2r+SdBP5jE=;
 b=uix86mKX9pZGr4ID2CzJLwHHYUuCEt5QpdkYjvtXLfEZ2N0MUdRpkFMmSLcXQoqn42J2SG
 U6Mve+sGczSF0LBb6Oo262EMf7ttjj6WD6mqF1/+qBnD5t+kKjXRPr3fRizmVYh07paV9r
 fP5kPzn7LBfTIGi8aszPpzEAIOMv2zY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642761016;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8mMoUq4QffSmj0luTlz9AQna59umyeadd2r+SdBP5jE=;
 b=1Vf/qUE6JJ9dJOCa7+mfCZ1ApL35uBAp8GulRRcCvo2PwusWF7GcBhMl+8epVSL97mtzuG
 RgQ1MDjHClZjzoCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7649913C32;
 Fri, 21 Jan 2022 10:30:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Af1RGTeL6mGzbwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 21 Jan 2022 10:30:15 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 21 Jan 2022 11:30:11 +0100
Message-Id: <20220121103011.6266-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] aiodio: Set timeout 30 min
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

Originally only ADSP075 failed (dio_sparse  -w 518192k -s 518192k -n 1000)
but just in case increase timeout for all newly rewritten tests.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/io/ltp-aiodio/aiodio_append.c | 1 +
 testcases/kernel/io/ltp-aiodio/dio_append.c    | 1 +
 testcases/kernel/io/ltp-aiodio/dio_read.c      | 1 +
 testcases/kernel/io/ltp-aiodio/dio_sparse.c    | 1 +
 testcases/kernel/io/ltp-aiodio/dio_truncate.c  | 1 +
 5 files changed, 5 insertions(+)

diff --git a/testcases/kernel/io/ltp-aiodio/aiodio_append.c b/testcases/kernel/io/ltp-aiodio/aiodio_append.c
index 46cc74ee4e..3c4add66ec 100644
--- a/testcases/kernel/io/ltp-aiodio/aiodio_append.c
+++ b/testcases/kernel/io/ltp-aiodio/aiodio_append.c
@@ -183,6 +183,7 @@ static struct tst_test test = {
 		"tmpfs",
 		NULL
 	},
+	.timeout = 1800,
 };
 #else
 TST_TEST_TCONF("test requires libaio and its development packages");
diff --git a/testcases/kernel/io/ltp-aiodio/dio_append.c b/testcases/kernel/io/ltp-aiodio/dio_append.c
index c099793f6c..dd044325bd 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_append.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_append.c
@@ -97,4 +97,5 @@ static struct tst_test test = {
 		"tmpfs",
 		NULL
 	},
+	.timeout = 1800,
 };
diff --git a/testcases/kernel/io/ltp-aiodio/dio_read.c b/testcases/kernel/io/ltp-aiodio/dio_read.c
index 67a28147fd..f48414ec01 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_read.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_read.c
@@ -181,4 +181,5 @@ static struct tst_test test = {
 		"tmpfs",
 		NULL
 	},
+	.timeout = 1800,
 };
diff --git a/testcases/kernel/io/ltp-aiodio/dio_sparse.c b/testcases/kernel/io/ltp-aiodio/dio_sparse.c
index 39fc895d65..0039daa8d1 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_sparse.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_sparse.c
@@ -135,4 +135,5 @@ static struct tst_test test = {
 		"tmpfs",
 		NULL
 	},
+	.timeout = 1800,
 };
diff --git a/testcases/kernel/io/ltp-aiodio/dio_truncate.c b/testcases/kernel/io/ltp-aiodio/dio_truncate.c
index 1fbf83de06..80445c48a3 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_truncate.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_truncate.c
@@ -169,4 +169,5 @@ static struct tst_test test = {
 		"tmpfs",
 		NULL
 	},
+	.timeout = 1800,
 };
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
