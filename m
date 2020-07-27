Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB10622F59B
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 18:44:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA6C83C26C0
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 18:44:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 722C43C26DE
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 18:44:12 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8BA2B14001EA
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 18:44:11 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id j19so10015205pgm.11
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 09:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dmhYUfNmsEsqaTAeaNgYOWyOx9YOs47wUY8mCGXP6Ls=;
 b=SLaN9WrHjeAdTw9eJa/iNcahqE/obsc7EbeyqE9apwgPqgXGar3QWyhmZrrgpxwuzE
 zBF15gIOCReJVNfY60lol9zfmPFf8n7mGFpryTU03SsNvLn/qGimbE0hx7eyGnqSBjop
 MaE8RAW+kTPfXahBeZr50YXHa4QmTbjcdi//hOWG6AVNAZawMWl8/XB8DlX48B71XQNZ
 6M7FWpnJCP4YZbSmrxtNsYTPZdPUuD5TM8qGbShq84qmaFZQx8GlkdlD4A+Y+5Q++urv
 gQpeVG+WnKzpe9F8U+FGtRAY27h7PaRD1HHUtfGRUo5qIAwAaYM0olRFGQKOEWiEYOxZ
 FfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dmhYUfNmsEsqaTAeaNgYOWyOx9YOs47wUY8mCGXP6Ls=;
 b=Ow54ol5K0RWYgUFEd3vLEr5mMO+28/uOLrG1h7tYaIE+TZeXvDnHo568ZCH2BkHpfx
 oEl7pByhAhwS3yhBp3pllOxDgNo49u6UKGdHbp6ovDiWkOpBnH2kjY2OzEkoFopyYoAs
 u5UCwAiqc2qksnr0iDgxTy3eomHS4mOg2MzJHMdKSA0J2PLeKgaXhtn0yJe9odJPZjdn
 eoXLtIE7W4n4UhDaqKctVHEcH12hGKKzt7GBT8RlNoSnErg3u8rrrQpx/aqtlViW2XKG
 m+qlOxTIiZFTXGbzbudvhWZGJWXHc+x41xeKIdSMz/qWBJUg5B+Knb2V5wn4Sks6wCMz
 Qbhg==
X-Gm-Message-State: AOAM531C3BNBT+lqSMpxPovh3TrHtXShDpipr/Du7KJQw3tpcSf6thBR
 cljggk6X6DiwT8tnC5gIN2LFtSjR
X-Google-Smtp-Source: ABdhPJxraH6F7/lDw1f2cUtLlUa9Oq3ZWMRs5xPJHRHNtdhuKotOEFA9cBjUs5O9aFrjSinLQ1psRA==
X-Received: by 2002:a63:20d:: with SMTP id 13mr20717576pgc.166.1595868246635; 
 Mon, 27 Jul 2020 09:44:06 -0700 (PDT)
Received: from aidengao.c.googlers.com.com
 (15.4.198.104.bc.googleusercontent.com. [104.198.4.15])
 by smtp.gmail.com with ESMTPSA id p127sm15131357pfb.17.2020.07.27.09.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 09:44:06 -0700 (PDT)
From: aidengao <aiden.gaoyuan@gmail.com>
To: ltp@lists.linux.it
Date: Mon, 27 Jul 2020 16:44:01 +0000
Message-Id: <20200727164403.1177686-1-aiden.gaoyuan@gmail.com>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.7 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] hotplug/memory_hotplug: Handle NULL returned by
 strtok_r when parsing inputs
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
Cc: kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: aidengao <aidengao@google.com>

In the original version of memtoy, it uses strtok_r(args, " ", &nextarg)
to split string. When strtok_r finds the last substring to be split,
it will set nextarg to NULL rather than let it point to '\0'.
In this case, if it wants to do something else to nextarg like calling
strspn(nextarg, " "), it will throw an error.
Add NULL check for nextarg to fix this error.

Signed-off-by: Yuan Gao <aiden.gaoyuan@gmail.com>
---
 .../kernel/hotplug/memory_hotplug/commands.c  | 29 +++++++++++--------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/testcases/kernel/hotplug/memory_hotplug/commands.c b/testcases/kernel/hotplug/memory_hotplug/commands.c
index e31743bd3..2e8972c1c 100644
--- a/testcases/kernel/hotplug/memory_hotplug/commands.c
+++ b/testcases/kernel/hotplug/memory_hotplug/commands.c
@@ -61,6 +61,11 @@
 
 static char *whitespace = " \t";
 
+inline char *get_next_arg(char *args, char *nextarg)
+{
+	return nextarg ? nextarg + strspn(nextarg, whitespace) : args + strlen(args);
+}
+
 /*
  * =========================================================================
  */
@@ -146,7 +151,7 @@ static int get_range(char *args, range_t * range, char **nextarg)
 		range->offset = get_scaled_value(args, "offset");
 		if (range->offset == BOGUS_SIZE)
 			return CMD_ERROR;
-		args = nextarg + strspn(nextarg, whitespace);
+		args = get_next_arg(args, nextarg);
 
 		/*
 		 * <length> ... only if offset specified
@@ -160,7 +165,7 @@ static int get_range(char *args, range_t * range, char **nextarg)
 					return CMD_ERROR;
 			} else
 				range->length = 0;	/* map to end of file */
-			args = nextarg + strspn(nextarg, whitespace);
+			args = get_next_arg(args, nextarg);
 		}
 	}
 
@@ -669,7 +674,7 @@ static int anon_seg(char *args)
 	range.length = get_scaled_value(args, "size");
 	if (range.length == BOGUS_SIZE)
 		return CMD_ERROR;
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	if (*args != '\0') {
 		segflag = get_shared(args);
@@ -699,7 +704,7 @@ static int file_seg(char *args)
 	if (!required_arg(args, "<path-name>"))
 		return CMD_ERROR;
 	pathname = strtok_r(args, whitespace, &nextarg);
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	/*
 	 * offset, length are optional
@@ -757,7 +762,7 @@ static int touch_seg(char *args)
 	if (!required_arg(args, "<seg-name>"))
 		return CMD_ERROR;
 	segname = strtok_r(args, whitespace, &nextarg);
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	/*
 	 * offset, length are optional
@@ -788,7 +793,7 @@ static int unmap_seg(char *args)
 	if (!required_arg(args, "<seg-name>"))
 		return CMD_ERROR;
 	segname = strtok_r(args, whitespace, &nextarg);
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	if (!segment_unmap(segname))
 		return CMD_ERROR;
@@ -812,7 +817,7 @@ static int map_seg(char *args)
 	if (!required_arg(args, "<seg-name>"))
 		return CMD_ERROR;
 	segname = strtok_r(args, whitespace, &nextarg);
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	/*
 	 * offset, length are optional
@@ -856,7 +861,7 @@ static int mbind_seg(char *args)
 	if (!required_arg(args, "<seg-name>"))
 		return CMD_ERROR;
 	segname = strtok_r(args, whitespace, &nextarg);
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	/*
 	 * offset, length are optional
@@ -871,7 +876,7 @@ static int mbind_seg(char *args)
 	if (policy < 0)
 		return CMD_ERROR;
 
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 	if (*args == '+') {
 		flags = get_mbind_flags(++args, &nextarg);
 		if (flags == -1)
@@ -914,7 +919,7 @@ static int shmem_seg(char *args)
 	if (!required_arg(args, "<seg-name>"))
 		return CMD_ERROR;
 	segname = strtok_r(args, whitespace, &nextarg);
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	if (!required_arg(args, "<size>"))
 		return CMD_ERROR;
@@ -922,7 +927,7 @@ static int shmem_seg(char *args)
 	range.length = get_scaled_value(args, "size");
 	if (range.length == BOGUS_SIZE)
 		return CMD_ERROR;
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	if (!segment_register(SEGT_SHM, segname, &range, MAP_SHARED))
 		return CMD_ERROR;
@@ -954,7 +959,7 @@ static int where_seg(char *args)
 	if (!required_arg(args, "<seg-name>"))
 		return CMD_ERROR;
 	segname = strtok_r(args, whitespace, &nextarg);
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	/*
 	 * offset, length are optional
-- 
2.28.0.rc0.142.g3c755180ce-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
