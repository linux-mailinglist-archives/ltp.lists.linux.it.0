Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CAF241FEE
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Aug 2020 20:49:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 38BB53C5EF4
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Aug 2020 20:49:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C86533C129F
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 20:49:41 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 15736600AFB
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 20:49:41 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id u20so8105959pfn.0
 for <ltp@lists.linux.it>; Tue, 11 Aug 2020 11:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sAId2GftU3Rfe92Tc5RROQ2Vqn3wABR5Qlkjp4QuDok=;
 b=MJzdg+lgL7O9Ze7lbxVT1EAR969yqDjCMSS3tSLAvNBaTUWDj96GrBfijT6koohcSF
 wHyIrDB7aDrjhniOs7piJvrl8mEZp3BpsdH6EwGSfBq4XZI6hyb76RElu5z9uijUqWeU
 aeCGCml/HjXsalZl+0AuIX3OPN4OI3/WrcViTsyeAjrs9WFVf0+xzLxdP+ZfOre3H0d7
 zrJUeuvZ6qYLhPJ8ouMv/ifz1M59cKQkzDW1nTFeK6TRuz0GEAcR946QyGWLJ1M3QWws
 c89GKP4caktBu86MKqRa37GIGBDbeoM2DWEQxojbnmDI/NKgikivPmJxQavL7JZ5Atc/
 lmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sAId2GftU3Rfe92Tc5RROQ2Vqn3wABR5Qlkjp4QuDok=;
 b=LG3q6kEWfHego95PqVibOM9Mvc4NkFdJ5JFc/xXJENn4MOyo9kR7iFHYatcr2O7PoY
 aAV00QuBSsXYfeWfHQpsVbLbFenuC2OGpDq6uF3fAC3WNCEEBQ0qbvwQfSLSe0Mphv7Q
 Ub5zKlys1jIhi5WWNGQwQZcKiwYLVRIDsqOZ/Qppy46zvvW4yS14/ZPc2XHHicuepQdV
 9E5qbWWrIDmmnrMwYIRqHjr3JSvDuagsCd9P1+hms+AMeqvhljd19f2A40Nbppz2F8kL
 bIU4FXY3Sbd94jCjzKFMSoeSVxQSg9psHulsg1lUQDZP2HVCVRtio1RzHoXox48pHCBK
 ubVA==
X-Gm-Message-State: AOAM5327T0F6ii39a/QrtUTSAJ4rIWoZhC3VXZ5RHLGTDJjhDfPXZB7o
 hlPz8r/NpJQZl3zyk8J1nlyh1rZN
X-Google-Smtp-Source: ABdhPJx9LHlPWLOzB0SG8dudxyI9R9Kg8YGgmnM361kaLNXMGeXIWc24suuo3IWoopcUiKdOQuc7PA==
X-Received: by 2002:a63:5b05:: with SMTP id p5mr1868018pgb.143.1597171779138; 
 Tue, 11 Aug 2020 11:49:39 -0700 (PDT)
Received: from aidengao.c.googlers.com.com
 (15.4.198.104.bc.googleusercontent.com. [104.198.4.15])
 by smtp.gmail.com with ESMTPSA id o65sm5022706pfg.176.2020.08.11.11.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 11:49:38 -0700 (PDT)
From: Yuan Gao <aiden.gaoyuan@gmail.com>
To: ltp@lists.linux.it
Date: Tue, 11 Aug 2020 18:49:11 +0000
Message-Id: <20200811184911.4089327-2-aiden.gaoyuan@gmail.com>
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
In-Reply-To: <20200811184911.4089327-1-aiden.gaoyuan@gmail.com>
References: <20200811184911.4089327-1-aiden.gaoyuan@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
 HK_RANDOM_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/3] hotplug/memory_hotplug: Add a memtoy command
 to delete a file
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

Add a new memtoy command for interactively deleting a file.
USAGE: deletefile <filename>
Example: deletefile /data/local/tmp
This will delete a file named tmp in /data/local

Change from v1:
1. Replace printf with fprintf in stderr for error message

Signed-off-by: Yuan Gao <aiden.gaoyuan@gmail.com>
---
 .../kernel/hotplug/memory_hotplug/commands.c  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/testcases/kernel/hotplug/memory_hotplug/commands.c b/testcases/kernel/hotplug/memory_hotplug/commands.c
index 9cd69ebcd..43edebb83 100644
--- a/testcases/kernel/hotplug/memory_hotplug/commands.c
+++ b/testcases/kernel/hotplug/memory_hotplug/commands.c
@@ -727,6 +727,28 @@ static int file_seg(char *args)
 	return CMD_SUCCESS;
 }
 
+/*
+ * deletefile <file-name>
+ */
+static int delete_file(char *args)
+{
+	glctx_t *gcp = &glctx;
+	char *filename, *nextarg;
+
+	args += strspn(args, whitespace);
+	if (!required_arg(args, "<file-name>"))
+		return CMD_ERROR;
+	filename = strtok_r(args, whitespace, &nextarg);
+
+	if (remove(filename)) {
+		fprintf(stderr, "%s: deletefile failed - %s\n",
+			gcp->program_name, strerror(errno));
+		return CMD_ERROR;
+	}
+
+	return CMD_SUCCESS;
+}
+
 /*
 * createfile <file-name> <size>[k|m|g|p]]
 */
@@ -1074,6 +1096,8 @@ struct command {
 		    "\t<seg-share> := private|shared - default = private\n"}, {
 	.cmd_name="createfile",.cmd_func=create_file,.cmd_help=
 			"createfile <file-name> <size>[k|m|g|p]]",}, {
+	.cmd_name = "deletefile", .cmd_func = delete_file, .cmd_help =
+			"deletefile <file-name>"}, {
 	.cmd_name = "shm",.cmd_func = shmem_seg,.cmd_help =
 		    "shm <seg-name> <seg-size>[k|m|g|p] - \n"
 		    "\tdefine a shared memory segment of specified size.\n"
-- 
2.28.0.236.gb10cc79966-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
