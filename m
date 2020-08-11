Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6C6241FF3
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Aug 2020 20:49:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6CEF13C3141
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Aug 2020 20:49:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8A64B3C312C
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 20:49:54 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 14C271A00CDA
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 20:49:54 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id o5so7145672pgb.2
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 11:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DS1Yzau5XEES+5ViCf3p07hlaxEP5VFw0py17NlX+8M=;
 b=kx0hYfPHIijfR8zwVtEC8+Xub2vqlqLE6S0+ECQimVeufNyxJLMw1AMeBPKD+FoNcK
 f7XTdcLmGef2T5cCn2+uaS7ft+epVZrCOm3ZgLT2aML2uIZXit9832kFDSJrgs8Iz3mU
 gaKNbBMkgJI5dPAs7c8FEh/23RroYBmFwp6Y/IbExEqNtRNBHQOPS/gZMAulqgsNbqUs
 Q/QZsmxnqArnEGbpT8F7CRouFQ2bB6PhBKfL4DinfTG7RVUdbe4PkGYsd2x9fzzXCKE9
 ZPzJK0kBXNf7lZUHRSbusS+RD3zJkBBjr3Grd3eiCWXCcEwNAIUI1vZ6vKmfBWXxNUM6
 Vphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DS1Yzau5XEES+5ViCf3p07hlaxEP5VFw0py17NlX+8M=;
 b=ACyldJVYjE0pvpIz2jg7IrOXbdASqKp+YjO6JLNKk8J1epq0dUi/E3lxaJgeg2zY3j
 QfrrsXHnN6+RwFjlNQoZQR5KkAvu0BhqXZn/ygp4TL6LlpZM4UieRSgAHihxXyrNnvLX
 QLUVLtW7yynVupPC+60NyF5VfdkCKCfk8VYXxV2zsnzm9Dn+TufSjMT40kx/+yFYOco9
 9IYtYfOdG4vryi95GMlGe3b0CxCnfdM17xeKnhveO9VSkqq8M4ZhnC6TUfrpx3OH64i3
 tfwCRZNnsb6AORtcEtUzcvWi9zD9Y1hj44am60djwWIFH2nlZsljyYcZTYileRswE6fB
 cJbA==
X-Gm-Message-State: AOAM531670w05bm0vvkKFMcF3o6X+q8LMnfbAhZLOlrPT5SLYlTZ+lDc
 gGONTkavazWEP19wy9upLSrY0bGn
X-Google-Smtp-Source: ABdhPJyvU939iqKTmMa1mhES6BQrL047DsGHfOl7L8/bNKeC6c518N3FqQPoQPxIwox84gSYatneCQ==
X-Received: by 2002:a63:7d08:: with SMTP id y8mr1909862pgc.224.1597171776895; 
 Tue, 11 Aug 2020 11:49:36 -0700 (PDT)
Received: from aidengao.c.googlers.com.com
 (15.4.198.104.bc.googleusercontent.com. [104.198.4.15])
 by smtp.gmail.com with ESMTPSA id o65sm5022706pfg.176.2020.08.11.11.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 11:49:36 -0700 (PDT)
From: Yuan Gao <aiden.gaoyuan@gmail.com>
To: ltp@lists.linux.it
Date: Tue, 11 Aug 2020 18:49:10 +0000
Message-Id: <20200811184911.4089327-1-aiden.gaoyuan@gmail.com>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
 HK_RANDOM_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] hotplug/memory_hotplug: Add a memtoy command
 to create a file of specified size
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

Add a new memtoy command for interactively creating an empty file of
specified size.
USAGE: createfile <filename> <size>[k|m|p|g]
Example: createfile /data/local/tmp 100m
This will create a file named temp in /data/local/tmp/ with the size of
100 megabytes.

Change from v1:
1. Replace printf with fprintf in stderr for error message

Signed-off-by: Yuan Gao <aiden.gaoyuan@gmail.com>
---
 .../kernel/hotplug/memory_hotplug/commands.c  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/testcases/kernel/hotplug/memory_hotplug/commands.c b/testcases/kernel/hotplug/memory_hotplug/commands.c
index e3438e132..9cd69ebcd 100644
--- a/testcases/kernel/hotplug/memory_hotplug/commands.c
+++ b/testcases/kernel/hotplug/memory_hotplug/commands.c
@@ -36,6 +36,7 @@
 #include <sys/mman.h>
 #include <ctype.h>
 #include <errno.h>
+#include <fcntl.h>
 #include <numa.h>
 #include <numaif.h>
 #include <stdarg.h>
@@ -726,6 +727,47 @@ static int file_seg(char *args)
 	return CMD_SUCCESS;
 }
 
+/*
+ * createfile <file-name> <size>[k|m|g|p]]
+ */
+static int create_file(char *args)
+{
+	glctx_t *gcp = &glctx;
+	char *filename, *nextarg;
+	size_t len;
+	int fd;
+
+	args += strspn(args, whitespace);
+	if (!required_arg(args, "<file-name>"))
+		return CMD_ERROR;
+	filename = strtok_r(args, whitespace, &nextarg);
+	args = nextarg + strspn(nextarg, whitespace);
+
+	if (!required_arg(args, "<size>"))
+		return CMD_ERROR;
+	args = strtok_r(args, whitespace, &nextarg);
+	len = get_scaled_value(args, "size");
+	if (len == BOGUS_SIZE)
+		return CMD_ERROR;
+	args = get_next_arg(args, nextarg);
+
+	fd = open(filename, O_RDWR | O_CREAT, 0600);
+	if (fd < 0) {
+		fprintf(stderr, "%s: createfile failed - %s\n",
+			gcp->program_name, strerror(errno));
+		return CMD_ERROR;
+	}
+
+	if (posix_fallocate(fd, 0, len)) {
+		fprintf(stderr, "%s: createfile failed - %s\n",
+			gcp->program_name, strerror(errno));
+		return CMD_ERROR;
+	}
+	close(fd);
+	return CMD_SUCCESS;
+}
+
+
 /*
  * remove_seg:  <seg-name> [<seg-name> ...]
  */
@@ -1030,6 +1072,8 @@ struct command {
 		    "\tspecified offset into the file.  <offset> and <length> may be\n"
 		    "\tomitted and specified on the map command.\n"
 		    "\t<seg-share> := private|shared - default = private\n"}, {
+	.cmd_name = "createfile", .cmd_func = create_file, .cmd_help =
+			"createfile <file-name> <size>[k|m|g|p]]",}, {
 	.cmd_name = "shm",.cmd_func = shmem_seg,.cmd_help =
 		    "shm <seg-name> <seg-size>[k|m|g|p] - \n"
 		    "\tdefine a shared memory segment of specified size.\n"
-- 
2.28.0.236.gb10cc79966-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
