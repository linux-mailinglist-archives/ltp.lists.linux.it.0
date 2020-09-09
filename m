Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA256263523
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:57:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7ED163C2C43
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:57:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 6387F3C2C0E
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:17 +0200 (CEST)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1602A60069A
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:17 +0200 (CEST)
Received: by mail-wm1-x344.google.com with SMTP id a9so3289960wmm.2
 for <ltp@lists.linux.it>; Wed, 09 Sep 2020 10:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hn6iynNog3DaPy2ZZP2uKebjDKV2A4Z7RruGPa2zsMk=;
 b=l2kFQu/AgDG/91SM12uCYPiXLr05NDHX+EdBRBsgJ1vOsctxl308YFt2l8AkqcDXb7
 ue7UhSkXlKM1/NrrAC8vFd2hUfz3NhzTSPRxj3cZK0hJ0eq3YiomcTwsMgYn66T9H4p5
 hofu9oI0U75Cqohdq6oUA0aZjjByCdDbzKjv2DVIss8kfj9BESex3amyipodH8k/3JUy
 Q4NRCeBNEIYXaW0QqQynvHLyuw41WlaafjhaCLawRUIvZzQ6BlqxN6aobrpb3rJMj3ku
 /ntxV+c1qsRN/PBL54yfSeGqJBVCC98SBJWjOmN5Y28Z8OUDP4q4mkuZp+bFBsJxlXrC
 d35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hn6iynNog3DaPy2ZZP2uKebjDKV2A4Z7RruGPa2zsMk=;
 b=AIaULm7lyPECDiHuT4P9F5jJ0ZLrKLVZy+wjwKuIuGVbtx5SciuUF1xMfn3zSOgrya
 6IeR8oqHUSr0mLoXsxC1BPptmrGm7Q772A/Qq709FV9kMbaKA1kaUaan16yGMGxoizri
 mv781HXRMIOJvBymnkpRqVmsflbB5aMxc08/7bAykp+wEDDf2ikmVRXWRALSsTxtaRSO
 fZl1xblWO/+pSiDX5V1/fvcsAjpVYOrHtCd0ZvxChQFad4YIiwH2KyUkB+Wq4zIYkief
 aeLC/c3Ll26EUiRw59yA50kUAICi5ujQFgSLD+06G/Ap16fBaGAWJHTOnYzrxE4TKZiH
 Jc1Q==
X-Gm-Message-State: AOAM532cX45rScvDYpo4oP4Jy4NdOEeuL4c9BpGs9vaB5GfLH6IvXyAt
 rt90hOO7T8/4n1gchpquiDI8wx35/Bk=
X-Google-Smtp-Source: ABdhPJydigKpGztFJfX4kOQP39BZSYtiydWVRJgcNHyo5Dx+idIl2F69qF1KyefCmW/zhLp6lcs/iw==
X-Received: by 2002:a7b:c84a:: with SMTP id c10mr4639792wml.139.1599674236679; 
 Wed, 09 Sep 2020 10:57:16 -0700 (PDT)
Received: from localhost.localdomain ([141.226.8.56])
 by smtp.gmail.com with ESMTPSA id z83sm4979714wmb.4.2020.09.09.10.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 10:57:16 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Wed,  9 Sep 2020 20:56:58 +0300
Message-Id: <20200909175707.10670-2-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909175707.10670-1-amir73il@gmail.com>
References: <20200909175707.10670-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 01/10] syscalls/fanotify14: Test cases for
 FAN_REPORT_DFID_NAME
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Check invalid combinations for the new flags.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 testcases/kernel/syscalls/fanotify/fanotify.h   | 10 ++++++++++
 testcases/kernel/syscalls/fanotify/fanotify14.c | 10 +++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index d271578e9..4a7959989 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -44,6 +44,13 @@ static long fanotify_mark(int fd, unsigned int flags, uint64_t mask,
 #ifndef FAN_REPORT_FID
 #define FAN_REPORT_FID		0x00000200
 #endif
+#ifndef FAN_REPORT_DIR_FID
+#define FAN_REPORT_DIR_FID	0x00000400
+#endif
+#ifndef FAN_REPORT_NAME
+#define FAN_REPORT_NAME		0x00000800
+#define FAN_REPORT_DFID_NAME     (FAN_REPORT_DIR_FID | FAN_REPORT_NAME)
+#endif
 
 #ifndef FAN_MARK_INODE
 #define FAN_MARK_INODE		0
@@ -114,6 +121,9 @@ typedef struct {
 #ifndef FAN_EVENT_INFO_TYPE_DFID_NAME
 #define FAN_EVENT_INFO_TYPE_DFID_NAME	2
 #endif
+#ifndef FAN_EVENT_INFO_TYPE_DFID
+#define FAN_EVENT_INFO_TYPE_DFID	3
+#endif
 
 #ifndef HAVE_STRUCT_FANOTIFY_EVENT_INFO_HEADER
 struct fanotify_event_info_header {
diff --git a/testcases/kernel/syscalls/fanotify/fanotify14.c b/testcases/kernel/syscalls/fanotify/fanotify14.c
index 3ca38d1e7..349177d9a 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify14.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify14.c
@@ -52,7 +52,15 @@ static struct test_case_t {
 	},
 	{
 		FAN_CLASS_NOTIF | FAN_REPORT_FID, FAN_MARK_MOUNT, INODE_EVENTS
-	}
+	},
+	{
+		/* FAN_REPORT_NAME without FAN_REPORT_DIR_FID is not valid */
+		FAN_CLASS_NOTIF | FAN_REPORT_NAME, 0, 0
+	},
+	{
+		/* FAN_REPORT_NAME without FAN_REPORT_DIR_FID is not valid */
+		FAN_CLASS_NOTIF | FAN_REPORT_FID | FAN_REPORT_NAME, 0, 0
+	},
 };
 
 static void do_test(unsigned int number)
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
