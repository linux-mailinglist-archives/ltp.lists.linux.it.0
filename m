Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 769D7241F84
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Aug 2020 20:06:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC7233C3139
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Aug 2020 20:06:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 6916E3C136B
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 20:06:24 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5F313600C26
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 20:06:24 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id f10so7174313plj.8
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 11:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LKOKviFwjcPRL6oQS/CZ89NEUagwMEUpeQAPQgHprtQ=;
 b=GkYa2E87KjNeclx+VnlQ3KRGTDXP2dcz1Y5WrALa1URMP3kVIORYoR5Pi5OJTbWO66
 eov2KhVYWQj8kczDub5X5w71kTRvU+uF5RGhV9fqvNOxOAxY/Wp7aaSCdulZaMozaOZG
 WklSE78Rrf7j8Mut7DGEU83PSMpCMFh4y+TqH9LWyJGwrQ3PBeeJLpZDtTRUrVD1NxAO
 xlDwXPcH3OzbSDWEoYI51p3X7R9/5gMarv/iFpAyhivVK2J8zP6ERu/uwhAgCvdB1FKC
 HhbgmV76TtQwHS5dZyJX+NBBExW5i1XD6eLGFuFKSU2/JMK6uy5v9eczR9npZyCX0SkT
 nyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LKOKviFwjcPRL6oQS/CZ89NEUagwMEUpeQAPQgHprtQ=;
 b=UcvZfrBfr2pGi20jW9gRfZ34JKXaaGZsjjIQSI1ljhk7HoSwc2VpO/02OBMYVQUXgD
 2BTjXNPvjVLjQg9HBJtfCijAB/e+ZwPfcl2PraSuhiEusfzsYUQl1yuUNfwZIA6fiUJC
 4SePtLMQ9UwanuL3Tv17wy5LU92hNRvkFyng3EQ8ZSmxWAdZu79JYI/w+hXqNZklCt1y
 nn4Cm/t7bGorzNcp+YvH35KZsfSHMzOw+wmjMX0C+3yrq7rnlxF3MHAL1hyZmsjjS8Xn
 /UQX6ISss5CrMf5auJPCfuGR4P+XZdZds56Y4fbT2RF3OoGhHWs6x4OtASk7gB7hVNSg
 Y3+w==
X-Gm-Message-State: AOAM5304uvnF0zcCv4otNiTsaVmVhwGLlES8J6LASMrg3ZYiGM00xV2m
 Ycjq5tstcEzAg0T++k/YZRFaqKUNiFc=
X-Google-Smtp-Source: ABdhPJyWC1H9idL0n9r3mAzDBhSqsYwoVoDLQJhwYSFod25BJouXiLhF3zGs+2dnJM8DtkfP6rryog==
X-Received: by 2002:a17:90a:c70b:: with SMTP id
 o11mr2177527pjt.169.1597169182135; 
 Tue, 11 Aug 2020 11:06:22 -0700 (PDT)
Received: from aidengao.c.googlers.com.com
 (159.21.83.34.bc.googleusercontent.com. [34.83.21.159])
 by smtp.gmail.com with ESMTPSA id k5sm21523328pgk.78.2020.08.11.11.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 11:06:21 -0700 (PDT)
From: Yuan Gao <aiden.gaoyuan@gmail.com>
To: ltp@lists.linux.it
Date: Tue, 11 Aug 2020 18:06:04 +0000
Message-Id: <20200811180604.4073173-1-aiden.gaoyuan@gmail.com>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
 HK_RANDOM_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] hotplug/memory_hotplug: Handle NULL returned
 by strtok_r when parsing inputs
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

In the original version of memtoy, it uses strtok_r(args, " ", &nextarg)
to split string. When strtok_r finds the last substring to be split,
it will set nextarg to NULL rather than let it point to '\0'.
In this case, if it wants to do something else to nextarg like calling
strspn(nextarg, " "), it will throw an error.
Add NULL check for nextarg to fix this error.

Change from v1
1. Replace strlen() with strnlen()

Signed-off-by: Yuan Gao <aiden.gaoyuan@gmail.com>
---
 .../kernel/hotplug/memory_hotplug/commands.c  | 31 +++++++++++--------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/testcases/kernel/hotplug/memory_hotplug/commands.c b/testcases/kernel/hotplug/memory_hotplug/commands.c
index e31743bd3..e3438e132 100644
--- a/testcases/kernel/hotplug/memory_hotplug/commands.c
+++ b/testcases/kernel/hotplug/memory_hotplug/commands.c
@@ -50,6 +50,7 @@
 
 #define CMD_SUCCESS 0
 #define CMD_ERROR   1
+#define CMDBUFSZ 256
 
 #ifndef __NR_migrate_pages
 #define __NR_migrate_pages 0
@@ -61,6 +62,11 @@
 
 static char *whitespace = " \t";
 
+inline char *get_next_arg(char *args, char *nextarg)
+{
+	return nextarg ? nextarg + strspn(nextarg, whitespace) : args + strnlen(args, CMDBUFSZ);
+}
+
 /*
  * =========================================================================
  */
@@ -146,7 +152,7 @@ static int get_range(char *args, range_t * range, char **nextarg)
 		range->offset = get_scaled_value(args, "offset");
 		if (range->offset == BOGUS_SIZE)
 			return CMD_ERROR;
-		args = nextarg + strspn(nextarg, whitespace);
+		args = get_next_arg(args, nextarg);
 
 		/*
 		 * <length> ... only if offset specified
@@ -160,7 +166,7 @@ static int get_range(char *args, range_t * range, char **nextarg)
 					return CMD_ERROR;
 			} else
 				range->length = 0;	/* map to end of file */
-			args = nextarg + strspn(nextarg, whitespace);
+			args = get_next_arg(args, nextarg);
 		}
 	}
 
@@ -669,7 +675,7 @@ static int anon_seg(char *args)
 	range.length = get_scaled_value(args, "size");
 	if (range.length == BOGUS_SIZE)
 		return CMD_ERROR;
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	if (*args != '\0') {
 		segflag = get_shared(args);
@@ -699,7 +705,7 @@ static int file_seg(char *args)
 	if (!required_arg(args, "<path-name>"))
 		return CMD_ERROR;
 	pathname = strtok_r(args, whitespace, &nextarg);
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	/*
 	 * offset, length are optional
@@ -757,7 +763,7 @@ static int touch_seg(char *args)
 	if (!required_arg(args, "<seg-name>"))
 		return CMD_ERROR;
 	segname = strtok_r(args, whitespace, &nextarg);
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	/*
 	 * offset, length are optional
@@ -788,7 +794,7 @@ static int unmap_seg(char *args)
 	if (!required_arg(args, "<seg-name>"))
 		return CMD_ERROR;
 	segname = strtok_r(args, whitespace, &nextarg);
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	if (!segment_unmap(segname))
 		return CMD_ERROR;
@@ -812,7 +818,7 @@ static int map_seg(char *args)
 	if (!required_arg(args, "<seg-name>"))
 		return CMD_ERROR;
 	segname = strtok_r(args, whitespace, &nextarg);
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	/*
 	 * offset, length are optional
@@ -856,7 +862,7 @@ static int mbind_seg(char *args)
 	if (!required_arg(args, "<seg-name>"))
 		return CMD_ERROR;
 	segname = strtok_r(args, whitespace, &nextarg);
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	/*
 	 * offset, length are optional
@@ -871,7 +877,7 @@ static int mbind_seg(char *args)
 	if (policy < 0)
 		return CMD_ERROR;
 
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 	if (*args == '+') {
 		flags = get_mbind_flags(++args, &nextarg);
 		if (flags == -1)
@@ -914,7 +920,7 @@ static int shmem_seg(char *args)
 	if (!required_arg(args, "<seg-name>"))
 		return CMD_ERROR;
 	segname = strtok_r(args, whitespace, &nextarg);
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	if (!required_arg(args, "<size>"))
 		return CMD_ERROR;
@@ -922,7 +928,7 @@ static int shmem_seg(char *args)
 	range.length = get_scaled_value(args, "size");
 	if (range.length == BOGUS_SIZE)
 		return CMD_ERROR;
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	if (!segment_register(SEGT_SHM, segname, &range, MAP_SHARED))
 		return CMD_ERROR;
@@ -954,7 +960,7 @@ static int where_seg(char *args)
 	if (!required_arg(args, "<seg-name>"))
 		return CMD_ERROR;
 	segname = strtok_r(args, whitespace, &nextarg);
-	args = nextarg + strspn(nextarg, whitespace);
+	args = get_next_arg(args, nextarg);
 
 	/*
 	 * offset, length are optional
@@ -1107,7 +1113,6 @@ static int help_me(char *args)
 /*
  * =========================================================================
  */
-#define CMDBUFSZ 256
 
 static bool unique_abbrev(char *cmd, size_t clen, struct command *cmdp)
 {
-- 
2.28.0.236.gb10cc79966-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
