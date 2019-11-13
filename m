Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 062B2F9FA5
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 01:57:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8D183C2505
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 01:57:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 559453C24F1
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 01:56:47 +0100 (CET)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A170360256B
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 01:56:39 +0100 (CET)
Received: by mail-wm1-x344.google.com with SMTP id u18so147063wmc.3
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 16:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ME3cRSKVpEdWYtbmS9f6W9g1QnmuyQA+aOCi4+b+Op8=;
 b=TjySgiAAWhRvrLy7T+uV4u7dNwsTkLsyrjZSFgwpIwDAHj2PS5kgwtNbC4K0eYlsLE
 e8Vi1LwKeEfhDbRwXehrU1cxP1QHznoJRunbbmGNjqzDU0VtMIq+pFATblXb1PLc0Sy2
 jcgVQjTHgwEvtdfKITdw1h42UlKp4ODpCNeJAHyUSa7hk7meYuvl9YirOj8IIqA1jVfT
 gMobTdiQeRsBhfobnFgRa5ZzkZCuEBNi2rIzb5/bQNYPot4PfLH0OuWfuaGukx2dNdAT
 kA6XtkxM5XwRgQfWWxzfr44EvLSE82lV8WcwR42NRi9gtDrytC3f1g9q9zqobddRf1pr
 Y+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ME3cRSKVpEdWYtbmS9f6W9g1QnmuyQA+aOCi4+b+Op8=;
 b=a4nifd3xjmziZ6g39hkiCoM+SUAmshq0g9cQS3q7GkqYppzhGi9BqZXQ3uVeWg9jWP
 dAFszkPMpkfj4x024+O+eq/mt8RfMIc4z6rFVrmJIs3X8MCkKbzBdQvcSHTJgorGhduH
 jmNgyQ+iVhqPrsDr0aO9ZlOLli/fk7FpJNd4kCMh7jwc35kTL8At3agAtoyuFvUfQXYY
 /S//qNArNw7k46KxaO8lKUP6iIspgRiAvlHCwr7UfemF5Y4unSISOluWHQEsoNAvkHzP
 rbNpzqbdEMG4iKP1Db9NP2RZw9YdVyX20JdzLKxO7aRXsoAyDMwHWEmFXhmPRdAnBinh
 gFBA==
X-Gm-Message-State: APjAAAVULmIk9WLZNwy86i+doz+bB2NPpUJnC7MUw0cFk6u8+p6LaK7b
 k1goIHAKYMP3W9NLnXJlzs3Zb/65
X-Google-Smtp-Source: APXvYqzkU9ETHVHYRJThEDkaHgKsQHX7R0qOH0yir6QyHGOiCto155TvQVrHmxHPxgoZkFm2Ik7i1w==
X-Received: by 2002:a1c:b607:: with SMTP id g7mr287904wmf.94.1573606598748;
 Tue, 12 Nov 2019 16:56:38 -0800 (PST)
Received: from x230.suse.cz ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id z4sm431546wmf.36.2019.11.12.16.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 16:56:38 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 13 Nov 2019 01:56:25 +0100
Message-Id: <20191113005626.19585-3-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113005626.19585-1-petr.vorel@gmail.com>
References: <20191113005626.19585-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] fanotify: Rework checks for fallback
 definitions
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
Cc: Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add autoconf checks for struct fanotify_event_info_fid
and struct fanotify_event_info_header.

Instead of detecting via FAN_REPORT_FID or HAVE_NAME_TO_HANDLE_AT.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
New commit.

 configure.ac                                  |  1 +
 m4/ltp-fanotify.m4                            |  7 +++++++
 testcases/kernel/syscalls/fanotify/fanotify.h | 14 ++++++++------
 3 files changed, 16 insertions(+), 6 deletions(-)
 create mode 100644 m4/ltp-fanotify.m4

diff --git a/configure.ac b/configure.ac
index 62c5a0bb4..71738b72d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -212,6 +212,7 @@ LTP_CHECK_CAPABILITY_SUPPORT
 LTP_CHECK_CC_WARN_OLDSTYLE
 LTP_CHECK_CLONE_SUPPORTS_7_ARGS
 LTP_CHECK_CRYPTO
+LTP_CHECK_FANOTIFY
 LTP_CHECK_FIDEDUPE
 LTP_CHECK_FORTIFY_SOURCE
 LTP_CHECK_FTS_H
diff --git a/m4/ltp-fanotify.m4 b/m4/ltp-fanotify.m4
new file mode 100644
index 000000000..e7b77d8a4
--- /dev/null
+++ b/m4/ltp-fanotify.m4
@@ -0,0 +1,7 @@
+dnl SPDX-License-Identifier: GPL-2.0-or-later
+dnl Copyright (c) 2019 Petr Vorel <petr.vorel@gmail.com>
+
+AC_DEFUN([LTP_CHECK_FANOTIFY],[
+AC_CHECK_TYPES([struct fanotify_event_info_header],,,[#include <sys/fanotify.h>])
+AC_CHECK_TYPES([struct fanotify_event_info_fid],,,[#include <sys/fanotify.h>])
+])
diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index 573ed5f59..9d2fded13 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -101,6 +101,10 @@ static long fanotify_mark(int fd, unsigned int flags, uint64_t mask,
 #define FAN_OPEN_EXEC_PERM	0x00040000
 #endif
 
+#ifndef FAN_REPORT_FID
+#define FAN_REPORT_FID		0x00000200
+#endif
+
 /*
  * FAN_ALL_PERM_EVENTS has been deprecated, so any new permission events
  * are not to be added to it. To cover the instance where a new permission
@@ -123,23 +127,21 @@ typedef struct {
 #define __kernel_fsid_t lapi_fsid_t
 #endif /* __kernel_fsid_t */
 
-#ifndef FAN_REPORT_FID
-#define FAN_REPORT_FID		0x00000200
-
+#ifndef HAVE_STRUCT_FANOTIFY_EVENT_INFO_HEADER
 struct fanotify_event_info_header {
 	uint8_t info_type;
 	uint8_t pad;
 	uint16_t len;
 };
+#endif /* HAVE_STRUCT_FANOTIFY_EVENT_INFO_HEADER */
 
-#ifdef HAVE_NAME_TO_HANDLE_AT
+#ifndef HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID
 struct fanotify_event_info_fid {
 	struct fanotify_event_info_header hdr;
 	__kernel_fsid_t fsid;
 	unsigned char handle[0];
 };
-#endif /* HAVE_NAME_TO_HANDLE_AT */
-#endif /* ! FAN_REPORT_FID */
+#endif /* HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID */
 
 #ifdef HAVE_NAME_TO_HANDLE_AT
 /*
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
