Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A6822F599
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 18:44:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8AD203C26A5
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 18:44:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id AC7BF3C60E6
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 18:44:09 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D2BE2600C98
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 18:44:08 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id e8so10010737pgc.5
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 09:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ybjMKtmvZGrPj3TXu2VriSa6zRUNpuFnnPwGzL5eVEI=;
 b=jCuAP1EtzSCzJSfhPrSw+umYqfDn1ehQTu6Hf9yjcVEDU5FafRoqS2Shi9Fv+M6qx+
 I0A5xi+ZeAY8fuN2nXaVxssYczHjm7A2opjn8L9EuRoSKpv2iwEFBHHFe0h0ikZ0tPkz
 pJlBzXbV+QzgCa2e9NenQ1miFrrcXRPf1K/nJldf+1xKGJ/6bFZjEokJg3H03W4Vsv3r
 vB2RB9KbR2zX8L6uD5Mhq7NUBBYMl2MjfVD/CXXPzVYcqGYkY9CYqAdb/FcNOGGSMQ0t
 j0l+dwyLZ3uzF8vOMnQ3UxI+z2ta+5rendFJvEsXBnjTAaYhb+2BkvUrdJ89Nddpo6aQ
 UMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ybjMKtmvZGrPj3TXu2VriSa6zRUNpuFnnPwGzL5eVEI=;
 b=so4Uxb3l8cUT+FdRiNma+oWBYTPumZFeKE7fQ5DoFB1XyLUd9slvFcpB43O07L3RD5
 SrnTjXWNiNeXJ4ht0BWQ4k7/Qkh0HL4AaIK6uKmaIJR2z4cVel98notbigQxvE9u7J5Z
 LqCxijCQzDnRklXGBGiSqWypDwAC6/tiIJ6amNXyZpgEjgD8Nk6a21earkvYGQ+yD5Ss
 TtNa3pl6aIttjvVdLjr1WfRhIeCOuQ2kqsAyTD0HEndROpvpVyyPUpKlcL9cyH5z6arK
 +h7zWEB1VURN7sk19cFj+a2VIemdGYxgzoJYMpu1hnFo0kyqH3In7thARLooe70rqsvf
 zbUw==
X-Gm-Message-State: AOAM533r2VIYtPs76M4AwkY3lyHW1Lt7MeMarZ8sLhJB4jAQGbbD9quD
 3CGxjfmqVeKmk/nQ1MYdOgLZZrxb
X-Google-Smtp-Source: ABdhPJwI+8W1AX+R8aIsw0luxvpzoPVuv7guHO/DifnseI3gLuDDUkEbiAkbxRW+x8WHDZzGKoA7aQ==
X-Received: by 2002:a65:60d4:: with SMTP id r20mr20193915pgv.436.1595868247286; 
 Mon, 27 Jul 2020 09:44:07 -0700 (PDT)
Received: from aidengao.c.googlers.com.com
 (15.4.198.104.bc.googleusercontent.com. [104.198.4.15])
 by smtp.gmail.com with ESMTPSA id p127sm15131357pfb.17.2020.07.27.09.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 09:44:06 -0700 (PDT)
From: aidengao <aiden.gaoyuan@gmail.com>
To: ltp@lists.linux.it
Date: Mon, 27 Jul 2020 16:44:02 +0000
Message-Id: <20200727164403.1177686-2-aiden.gaoyuan@gmail.com>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
In-Reply-To: <20200727164403.1177686-1-aiden.gaoyuan@gmail.com>
References: <20200727164403.1177686-1-aiden.gaoyuan@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.7 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] hotplug/memory_hotplug: Add a memtoy command to
 create a file of specified size
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

Add a new memtoy command for interactively creating an empty file of
specified size.
USAGE: createfile <filename> <size>[k|m|p|g]
Example: createfile /data/local/tmp 100m
This will create a file named temp in /data/local/tmp/ with the size of
100 megabytes.

Signed-off-by: Yuan Gao <aiden.gaoyuan@gmail.com>
---
 .../kernel/hotplug/memory_hotplug/commands.c  | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/testcases/kernel/hotplug/memory_hotplug/commands.c b/testcases/kernel/hotplug/memory_hotplug/commands.c
index 2e8972c1c..d37c6b40b 100644
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
@@ -725,6 +726,44 @@ static int file_seg(char *args)
 	return CMD_SUCCESS;
 }
 
+/*
+ * createfile <file-name> <size>[k|m|g|p]]
+ */
+static int create_file(char *args)
+{
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
+		printf("Fail to create a file %s\n", filename);
+		return CMD_ERROR;
+	}
+
+	if (posix_fallocate(fd, 0, len)) {
+		printf("Fail to create a file %s\n", filename);
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
@@ -1029,6 +1068,8 @@ struct command {
 		    "\tspecified offset into the file.  <offset> and <length> may be\n"
 		    "\tomitted and specified on the map command.\n"
 		    "\t<seg-share> := private|shared - default = private\n"}, {
+	.cmd_name = "createfile", .cmd_func = create_file, .cmd_help =
+			"createfile <file-name> <size>[k|m|g|p]]",}, {
 	.cmd_name = "shm",.cmd_func = shmem_seg,.cmd_help =
 		    "shm <seg-name> <seg-size>[k|m|g|p] - \n"
 		    "\tdefine a shared memory segment of specified size.\n"
-- 
2.28.0.rc0.142.g3c755180ce-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
