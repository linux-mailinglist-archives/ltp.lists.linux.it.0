Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B07345A304
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Nov 2021 13:44:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F2373C8E51
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Nov 2021 13:44:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 31C163C8DCB
 for <ltp@lists.linux.it>; Tue, 23 Nov 2021 13:43:58 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A91F1601C59
 for <ltp@lists.linux.it>; Tue, 23 Nov 2021 13:43:57 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 5B0A41FD63;
 Tue, 23 Nov 2021 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1637671437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YU7+mR5X1h8DzMu2UlECBsvdY1AQ4SyXWzAt8GKOyxE=;
 b=gktZAe3frCEbg51+2W7Eyeow9EeF+n8CuNEKzU4HFs/jPkuJB84ZHxP2yZH2p66KVtwvx0
 9CauH07X3gJdyp4iZzC8t4DvDnOtsrtICO2xCyF5qqFaCPDJdpzCvFbjA/eFmPu6dhLKRc
 Pu9HWPGdwj75HTk9lyQzJKUN4/YT78c=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 2D939A3B88;
 Tue, 23 Nov 2021 12:43:57 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 23 Nov 2021 12:43:48 +0000
Message-Id: <20211123124348.31073-4-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211123124348.31073-1-rpalethorpe@suse.com>
References: <20211123124348.31073-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] statx: Add missing static keyword to tcase
 variable
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This shows how easy it is to miss the static keyword.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/statx/statx01.c | 2 +-
 testcases/kernel/syscalls/statx/statx02.c | 2 +-
 testcases/kernel/syscalls/statx/statx04.c | 2 +-
 testcases/kernel/syscalls/statx/statx05.c | 2 +-
 testcases/kernel/syscalls/statx/statx07.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/statx/statx01.c b/testcases/kernel/syscalls/statx/statx01.c
index 2358dd7bc..11e188e8f 100644
--- a/testcases/kernel/syscalls/statx/statx01.c
+++ b/testcases/kernel/syscalls/statx/statx01.c
@@ -131,7 +131,7 @@ static void test_device_file(void)
 }
 
 
-struct tcase {
+static struct tcase {
 	void (*tfunc)(void);
 } tcases[] = {
 	{&test_normal_file},
diff --git a/testcases/kernel/syscalls/statx/statx02.c b/testcases/kernel/syscalls/statx/statx02.c
index 08ea940cb..15f5562b2 100644
--- a/testcases/kernel/syscalls/statx/statx02.c
+++ b/testcases/kernel/syscalls/statx/statx02.c
@@ -90,7 +90,7 @@ static void test_sym_link(void)
 			"Statx symlink flag failed to work as expected");
 }
 
-struct tcase {
+static struct tcase {
 	void (*tfunc)(void);
 } tcases[] = {
 	{&test_empty_path},
diff --git a/testcases/kernel/syscalls/statx/statx04.c b/testcases/kernel/syscalls/statx/statx04.c
index 180c61bf9..f66b04f70 100644
--- a/testcases/kernel/syscalls/statx/statx04.c
+++ b/testcases/kernel/syscalls/statx/statx04.c
@@ -133,7 +133,7 @@ static void test_unflagged(void)
 		tst_res(TFAIL, "STATX_ATTR_NODUMP flag is set");
 }
 
-struct test_cases {
+static struct test_cases {
 	void (*tfunc)(void);
 } tcases[] = {
 	{&test_flagged},
diff --git a/testcases/kernel/syscalls/statx/statx05.c b/testcases/kernel/syscalls/statx/statx05.c
index 81a5bcbf2..47a1f8ad1 100644
--- a/testcases/kernel/syscalls/statx/statx05.c
+++ b/testcases/kernel/syscalls/statx/statx05.c
@@ -74,7 +74,7 @@ static void test_unflagged(void)
 		tst_res(TFAIL, "STATX_ATTR_ENCRYPTED flag is set");
 }
 
-struct test_cases {
+static struct test_cases {
 	void (*tfunc)(void);
 } tcases[] = {
 	{&test_flagged},
diff --git a/testcases/kernel/syscalls/statx/statx07.c b/testcases/kernel/syscalls/statx/statx07.c
index ec1cdd190..9aa160d31 100644
--- a/testcases/kernel/syscalls/statx/statx07.c
+++ b/testcases/kernel/syscalls/statx/statx07.c
@@ -84,7 +84,7 @@ static int get_mode(char *file_name, int flag_type, char *flag_name)
 	return buf.stx_mode;
 }
 
-const struct test_cases {
+static const struct test_cases {
 	int flag;
 	char *flag_name;
 	char *server_file;
-- 
2.33.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
