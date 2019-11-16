Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C076FE907
	for <lists+linux-ltp@lfdr.de>; Sat, 16 Nov 2019 01:20:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8FAAD3C2392
	for <lists+linux-ltp@lfdr.de>; Sat, 16 Nov 2019 01:20:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9D8C23C089F
 for <ltp@lists.linux.it>; Sat, 16 Nov 2019 01:20:16 +0100 (CET)
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 357152010E4
 for <ltp@lists.linux.it>; Sat, 16 Nov 2019 01:20:16 +0100 (CET)
Received: by mail-wr1-x443.google.com with SMTP id f2so12770999wrs.11
 for <ltp@lists.linux.it>; Fri, 15 Nov 2019 16:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NC1Fv+sSIoi6coquzu9RO8dFk426sGHnkaMrnNFtNNc=;
 b=Z1eZonxu1JWDlBQ4dzxlyh5P4npsAhh16JnhEyaGhHoihmCoCDLicdo2mxA7astcPf
 VYYRF/PS75T6EJDLeebEPrwv+2ppZ/MDj0kRAE4gl38dt98BMmJ2yoBpF39u5kK8uZ/Z
 rVe8Y7Vr92D+zB9v0bsMPIEdlBaUis13kFo6xahtnSqq46DtGQZwsrxCRZPN0g+czNte
 hNnxnLEF5jvOyaP3TX7OyTkp7Yjwj0FjDgJRLQDVeIJ4eYSwAlMRPMmEVxNblste5JBY
 AF9OmhDsYpTeVBI2+TLJsheCs9xcG/C0Z7bCb1QmyESDNBcn/m/Bdb8PaRpE1jneKHWp
 HRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NC1Fv+sSIoi6coquzu9RO8dFk426sGHnkaMrnNFtNNc=;
 b=klF9vN9xSghpCmtM6JKyGn8VisVLwMBk+/80wV3pZXNgVbxQ1zTnHCjy3ap96J86QQ
 gbegE0FUijqkmzBlG/hnDK2VPZHQQTtdIIwLQ0V5uX0gYOb7nm7qdUtv7HnpOANPSal7
 aC8hAJsnDrolQSnV6K00hYMIhGeNQWPKgC6NxxzO4+Y9eooXsTrlribywZvwysYvM8Ff
 wu+pqHj+hEYO1q8IokgF/FYZs8g2DSfNO59LDzKCxxkDhj5bnw8K2/OQUWDi/l9QLLN0
 xgxYjSEYjdHfnuJCvSPzz6WLdbqz/zo4pPDaciCmmSP3ZD3xS1VnvFgE2398b7YH/ylN
 Rxsw==
X-Gm-Message-State: APjAAAV8vZ+FRXoBjVhoeENol7v0TYAdApUQ1zXsrH6TIfl21bXOpvK+
 sL+Ptt9NUOO5IgEr9XXKDmTzZXl9
X-Google-Smtp-Source: APXvYqyir3UagXXqPDvKqw0YAiF8bO78ya+QO5cPxv+Hfwx//zzkW4R7aluCj4pXmha4xMHKLfJfwQ==
X-Received: by 2002:adf:eb48:: with SMTP id u8mr18082863wrn.225.1573863615439; 
 Fri, 15 Nov 2019 16:20:15 -0800 (PST)
Received: from localhost.localdomain ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id b15sm12977526wrx.77.2019.11.15.16.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 16:20:14 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Sat, 16 Nov 2019 01:20:03 +0100
Message-Id: <20191116002003.13013-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] fanotify: Fix for musl
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

FSID_VAL_MEMBER() wrapper was meant to be only for struct
fanotify_event_info_fid, it was used also for struct event_t
(which has also __kernel_fsid_t fsid, but shouldn't be redefined).

This caused error on recent musl v1.1.23 (with f67b3c17),
which has struct fanotify_event_info_fid.

Fixes: 0498fc0a8 ("fanotify: Detect val vs. __val
fanotify_event_info_fid.fsid member")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

I'm sorry, one more error sneaked in.
I accidentally tested it on toolchains which has older musl release.

Helper should have obvious name to show it's just for fanotify_event_info_fid,
but something like EVENT_INFO_FID_FSID_VAL_MEMBER() is too long.
Posting just in case you prefer renaming (fanotify.h is getting a bit
complicated).

NOTE: I also find in various uclibc arch dependent kernel_types.h headers
libc/sysdeps/linux/x86_64/bits/kernel_types.h (19 of 29 archs)
typedef struct {
#ifdef __USE_ALL
	int val[2];
#else
	int __val[2];
#endif
} __kernel_fsid_t;

which would suggest we need also detection and helper for general
__kernel_fsid_t usage. But I'd ignore it unless anybody reports it's
really needed. I haven't found whether __USE_ALL is set as default, but
I expect it so.

Kind regards,
Petr

 testcases/kernel/syscalls/fanotify/fanotify.h   | 1 +
 testcases/kernel/syscalls/fanotify/fanotify13.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index 5370e30bb..9c98aaa1d 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -143,6 +143,7 @@ struct fanotify_event_info_fid {
 };
 #endif /* HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID */
 
+/* NOTE: only for struct fanotify_event_info_fid */
 #ifdef HAVE_STRUCT_FANOTIFY_EVENT_INFO_FID_FSID___VAL
 # define FSID_VAL_MEMBER(fsid, i) (fsid.__val[i])
 #else
diff --git a/testcases/kernel/syscalls/fanotify/fanotify13.c b/testcases/kernel/syscalls/fanotify/fanotify13.c
index 26212ab62..3d8de6009 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify13.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify13.c
@@ -130,8 +130,8 @@ static int setup_marks(unsigned int fd, struct test_case_t *tc)
 					"kernel");
 				return 1;
 			} else if (errno == ENODEV &&
-					!FSID_VAL_MEMBER(event_set[i].fsid, 0) &&
-					!FSID_VAL_MEMBER(event_set[i].fsid, 1)) {
+					!event_set[i].fsid.val[0] &&
+					!event_set[i].fsid.val[1]) {
 				tst_res(TCONF,
 					"FAN_REPORT_FID not supported on "
 					"filesystem type %s",
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
