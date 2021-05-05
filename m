Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2DA3736DD
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 11:16:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 131483C5853
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 11:16:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 07DCC3C17CE
 for <ltp@lists.linux.it>; Wed,  5 May 2021 11:16:31 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 90796600CC6
 for <ltp@lists.linux.it>; Wed,  5 May 2021 11:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620206190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s8lpf7bi4CTlLRmTIPPRG9CPNyrcL3OwmkrhLsndMR0=;
 b=RNsyaGxO5Ol2GRBDI4hDBcEKsGR6PalDS2KiZ988vvGNijfXFI4jJNWdfTwFNOvGhE2s/F
 4E9ACVenU1DCxMfzeZ1Y1b7qivuNDMY8cf1M3wxc5ZaBLpAZDj2eyDiGfvoEFG7/2MiTH/
 3eUVfs6GBu5RZsV16BrmR3DNHEfleTc=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3CA9BB23F;
 Wed,  5 May 2021 09:16:30 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed,  5 May 2021 10:16:22 +0100
Message-Id: <20210505091623.29121-4-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505091623.29121-1-rpalethorpe@suse.com>
References: <20210505091623.29121-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/4] bpf: Add helper to run socket programs
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

So far we always trigger the BPF programs the same way.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/bpf/bpf_common.c | 15 +++++++++++++++
 testcases/kernel/syscalls/bpf/bpf_prog01.c | 11 +----------
 testcases/kernel/syscalls/bpf/bpf_prog02.c | 11 +----------
 testcases/kernel/syscalls/bpf/bpf_prog03.c |  9 +--------
 testcases/kernel/syscalls/bpf/bpf_prog04.c |  9 +--------
 5 files changed, 19 insertions(+), 36 deletions(-)

diff --git a/testcases/kernel/syscalls/bpf/bpf_common.c b/testcases/kernel/syscalls/bpf/bpf_common.c
index 42c72b975..8a324a8fa 100644
--- a/testcases/kernel/syscalls/bpf/bpf_common.c
+++ b/testcases/kernel/syscalls/bpf/bpf_common.c
@@ -124,3 +124,18 @@ int bpf_load_prog(union bpf_attr *const attr, const char *const log)
 	tst_brk(TBROK | TERRNO, "Failed to load program");
 	return ret;
 }
+
+void bpf_run_prog(const int prog_fd,
+		  const char *const msg, const size_t msg_len)
+{
+	int sk[2];
+
+	SAFE_SOCKETPAIR(AF_UNIX, SOCK_DGRAM, 0, sk);
+	SAFE_SETSOCKOPT(sk[1], SOL_SOCKET, SO_ATTACH_BPF,
+			&prog_fd, sizeof(prog_fd));
+
+	SAFE_WRITE(1, sk[0], msg, msg_len);
+
+	SAFE_CLOSE(sk[0]);
+	SAFE_CLOSE(sk[1]);
+}
diff --git a/testcases/kernel/syscalls/bpf/bpf_prog01.c b/testcases/kernel/syscalls/bpf/bpf_prog01.c
index ac57b24b5..1d5d04556 100644
--- a/testcases/kernel/syscalls/bpf/bpf_prog01.c
+++ b/testcases/kernel/syscalls/bpf/bpf_prog01.c
@@ -79,22 +79,13 @@ void setup(void)
 void run(void)
 {
 	int map_fd, prog_fd;
-	int sk[2];
 	uint32_t key = 0;
 	uint64_t val;
 
 	map_fd = bpf_map_array_create(1);
 	prog_fd = load_prog(map_fd);
-
-	SAFE_SOCKETPAIR(AF_UNIX, SOCK_DGRAM, 0, sk);
-	SAFE_SETSOCKOPT(sk[1], SOL_SOCKET, SO_ATTACH_BPF,
-			&prog_fd, sizeof(prog_fd));
-
-	SAFE_WRITE(1, sk[0], msg, sizeof(MSG));
-
+	bpf_run_prog(prog_fd, msg, sizeof(MSG));
 	SAFE_CLOSE(prog_fd);
-	SAFE_CLOSE(sk[0]);
-	SAFE_CLOSE(sk[1]);
 
         bpf_map_array_get(map_fd, &key, &val);
 	if (val != 1) {
diff --git a/testcases/kernel/syscalls/bpf/bpf_prog02.c b/testcases/kernel/syscalls/bpf/bpf_prog02.c
index 4558153ea..9f6acca60 100644
--- a/testcases/kernel/syscalls/bpf/bpf_prog02.c
+++ b/testcases/kernel/syscalls/bpf/bpf_prog02.c
@@ -79,20 +79,11 @@ static void setup(void)
 static void run(void)
 {
 	int map_fd, prog_fd;
-	int sk[2];
 
 	map_fd = bpf_map_array_create(2);
 	prog_fd = load_prog(map_fd);
-
-	SAFE_SOCKETPAIR(AF_UNIX, SOCK_DGRAM, 0, sk);
-	SAFE_SETSOCKOPT(sk[1], SOL_SOCKET, SO_ATTACH_BPF,
-			&prog_fd, sizeof(prog_fd));
-
-	SAFE_WRITE(1, sk[0], msg, sizeof(MSG));
-
+	bpf_run_prog(prog_fd, msg, sizeof(MSG));
 	SAFE_CLOSE(prog_fd);
-	SAFE_CLOSE(sk[0]);
-	SAFE_CLOSE(sk[1]);
 
         *key = 0;
 	bpf_map_array_get(map_fd, key, val);
diff --git a/testcases/kernel/syscalls/bpf/bpf_prog03.c b/testcases/kernel/syscalls/bpf/bpf_prog03.c
index 1195ddc2c..9a7af7f4c 100644
--- a/testcases/kernel/syscalls/bpf/bpf_prog03.c
+++ b/testcases/kernel/syscalls/bpf/bpf_prog03.c
@@ -117,7 +117,6 @@ static void setup(void)
 static void run(void)
 {
 	int map_fd, prog_fd;
-	int sk[2];
 
 	map_fd = bpf_map_array_create(32);
 
@@ -137,13 +136,7 @@ static void run(void)
 
 	tst_res(TFAIL, "Loaded bad eBPF, now we will run it and maybe crash");
 
-	SAFE_SOCKETPAIR(AF_UNIX, SOCK_DGRAM, 0, sk);
-	SAFE_SETSOCKOPT(sk[1], SOL_SOCKET, SO_ATTACH_BPF,
-			&prog_fd, sizeof(prog_fd));
-
-	SAFE_WRITE(1, sk[0], msg, sizeof(MSG));
-	SAFE_CLOSE(sk[0]);
-	SAFE_CLOSE(sk[1]);
+	bpf_run_prog(prog_fd, msg, sizeof(MSG));
 	SAFE_CLOSE(prog_fd);
 
 	*key = 0;
diff --git a/testcases/kernel/syscalls/bpf/bpf_prog04.c b/testcases/kernel/syscalls/bpf/bpf_prog04.c
index 1a1ee0f04..09d0cc468 100644
--- a/testcases/kernel/syscalls/bpf/bpf_prog04.c
+++ b/testcases/kernel/syscalls/bpf/bpf_prog04.c
@@ -92,7 +92,6 @@ static void setup(void)
 static void run(void)
 {
 	int map_fd, prog_fd;
-	int sk[2];
 
 	map_fd = bpf_map_array_create(1);
 	prog_fd = load_prog(map_fd);
@@ -100,13 +99,7 @@ static void run(void)
 	if (prog_fd >= 0) {
 		tst_res(TFAIL, "Malicious eBPF code passed verification. "
 			"Now let's try crashing the kernel.");
-		SAFE_SOCKETPAIR(AF_UNIX, SOCK_DGRAM, 0, sk);
-		SAFE_SETSOCKOPT(sk[1], SOL_SOCKET, SO_ATTACH_BPF, &prog_fd,
-			sizeof(prog_fd));
-
-		SAFE_WRITE(1, sk[0], msg, sizeof(MSG));
-		SAFE_CLOSE(sk[0]);
-		SAFE_CLOSE(sk[1]);
+		bpf_run_prog(prog_fd, msg, sizeof(MSG));
 	}
 
 	if (prog_fd >= 0)
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
