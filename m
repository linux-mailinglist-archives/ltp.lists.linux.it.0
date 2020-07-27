Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6A322F59A
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 18:44:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6EF33C60FC
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 18:44:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2548B3C60E6
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 18:44:10 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 780492348D6
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 18:44:09 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id o13so10041566pgf.0
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 09:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=54LrZxiP1yUemLeoxohjPb4XMwnzS/JHohGhK84c5xA=;
 b=ItUIrA8zINthl7rfejI0sWgw1ITnd7ozJaQKd7exjAZmFkxqK+yiEdQdBDRTqM9h5i
 3yKtYYnuxJGd1AkNrlRKTB7WuFoajEdZASE79XcTngDzFHCGPR8hY8hSgJMJHDe04LPU
 DK5PljxZy+tK/adQ6A5IgNxqJ7eGjUOnFVW5o9EU30O8+d7sGrqrjqEfUpp2A6rmGgfH
 ReIF2XHixWXmzN8bkhGA2282T8Sc+LvHUlHY3SoypMu1dqAnScjy7o2ugqWLmuBEBp4E
 qn8RKnaRMrAgbfCC1FN6Ywe/WyuqE5DCQr9cGMAzpCD0P7xX8XV0m8CWIytx4UnarwS4
 xOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=54LrZxiP1yUemLeoxohjPb4XMwnzS/JHohGhK84c5xA=;
 b=MZe55jH2FDfMMXij7GmY8R6OU/BfHvXc5Ekmg8dS9z3d5Zi5Zc0AK9LH77I4k7pgUC
 Lwd8rX98UIexrhbjeNw4qJlh1Kud055e4GMcvYj+C4E88PoW/OzC34UNoryrJWp2GGSb
 8uo1FoxiOqF43PF3UrWz5HJGTAre1tTtZRKaME/9sTvo0E/nYuRoke77Dl1SIZp48VyD
 XmEHshrgWac44sE3HHh4gthIGskNx5ax8SLScbv/9nJpf+2O3bxfgYvsFXfQLehCUL3s
 lo3JqgiZzls3dL572ZoINNN4q48fRfQFVSWZPr4sdxuu9vCvCHCMS+uobcJE++LsCePl
 TXsw==
X-Gm-Message-State: AOAM530vMzOZ+T8jpa+AlTSZXnkce3Mtc6Dck/+50YfdZ55nGpQ+v5nA
 MNqzO5jdGPbWTLeavfrzhsi2BST1
X-Google-Smtp-Source: ABdhPJzi/gj36dFoqVDBfyD7lF4xei9LU6ZoFDPHJvv2OBMe6X20N9BDsDtub6ZdLr+lHtlzoCshRQ==
X-Received: by 2002:a63:560f:: with SMTP id k15mr19913896pgb.162.1595868247872; 
 Mon, 27 Jul 2020 09:44:07 -0700 (PDT)
Received: from aidengao.c.googlers.com.com
 (15.4.198.104.bc.googleusercontent.com. [104.198.4.15])
 by smtp.gmail.com with ESMTPSA id p127sm15131357pfb.17.2020.07.27.09.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 09:44:07 -0700 (PDT)
From: aidengao <aiden.gaoyuan@gmail.com>
To: ltp@lists.linux.it
Date: Mon, 27 Jul 2020 16:44:03 +0000
Message-Id: <20200727164403.1177686-3-aiden.gaoyuan@gmail.com>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
In-Reply-To: <20200727164403.1177686-1-aiden.gaoyuan@gmail.com>
References: <20200727164403.1177686-1-aiden.gaoyuan@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.7 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] hotplug/memory_hotplug: Add a memtoy command to
 delete a file
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

Add a new memtoy command for interactively deleting a file.
USAGE: deletefile <filename>
Example: deletefile /data/local/tmp
This will delete a file named tmp in /data/local

Signed-off-by: Yuan Gao <aiden.gaoyuan@gmail.com>
---
 .../kernel/hotplug/memory_hotplug/commands.c  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/testcases/kernel/hotplug/memory_hotplug/commands.c b/testcases/kernel/hotplug/memory_hotplug/commands.c
index d37c6b40b..0aa32ebea 100644
--- a/testcases/kernel/hotplug/memory_hotplug/commands.c
+++ b/testcases/kernel/hotplug/memory_hotplug/commands.c
@@ -726,6 +726,26 @@ static int file_seg(char *args)
 	return CMD_SUCCESS;
 }
 
+/*
+ * deletefile <file-name>
+ */
+static int delete_file(char *args)
+{
+	char *filename, *nextarg;
+
+	args += strspn(args, whitespace);
+	if (!required_arg(args, "<file-name>"))
+		return CMD_ERROR;
+	filename = strtok_r(args, whitespace, &nextarg);
+
+	if (remove(filename)) {
+		printf("Fail to delete a file %s\n", filename);
+		return CMD_ERROR;
+	}
+
+	return CMD_SUCCESS;
+}
+
 /*
  * createfile <file-name> <size>[k|m|g|p]]
  */
@@ -1070,6 +1090,8 @@ struct command {
 		    "\t<seg-share> := private|shared - default = private\n"}, {
 	.cmd_name = "createfile", .cmd_func = create_file, .cmd_help =
 			"createfile <file-name> <size>[k|m|g|p]]",}, {
+	.cmd_name = "deletefile", .cmd_func = delete_file, .cmd_help =
+			"deletefile <file-name>"}, {
 	.cmd_name = "shm",.cmd_func = shmem_seg,.cmd_help =
 		    "shm <seg-name> <seg-size>[k|m|g|p] - \n"
 		    "\tdefine a shared memory segment of specified size.\n"
-- 
2.28.0.rc0.142.g3c755180ce-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
