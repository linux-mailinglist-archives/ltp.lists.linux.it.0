Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5923188E8
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 12:03:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB6A33C6903
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 12:03:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 96E173C5DD7
 for <ltp@lists.linux.it>; Thu, 11 Feb 2021 12:03:33 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 61C23600C5E
 for <ltp@lists.linux.it>; Thu, 11 Feb 2021 12:03:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613041413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mShDfRhg1S1vWH9mNng3V0ngX52FJyVadm2Zu8mcYOQ=;
 b=bhiuZPbkfwzOSvhOdUOR7i0tGd/KY2wJ7RWOipC5Wf7G/Gqqj6ZHEhEc1atBrxHmv2X0Bl
 cKQ2cmXRZb6g1hDi3YpXfdb3k3AyPfkOX1qPFR2tGyvxZnDxLtR3T71Z20Z7LgHD4MpsZF
 YAd8+9FKDQLkzMJExekufq2jnviI4nY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EEF9BAE3B;
 Thu, 11 Feb 2021 11:03:32 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 11 Feb 2021 11:03:15 +0000
Message-Id: <20210211110317.31942-4-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210211110317.31942-1-rpalethorpe@suse.com>
References: <20210211110317.31942-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/5] API: Fix clone.h
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

Functions in headers should be static inline. Also add stdint.h
because it results in confusing error messages if it is missing.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/lapi/clone.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/lapi/clone.h b/include/lapi/clone.h
index 2b8cbdbe0..81db443c9 100644
--- a/include/lapi/clone.h
+++ b/include/lapi/clone.h
@@ -10,6 +10,7 @@
 #include <sys/syscall.h>
 #include <linux/types.h>
 #include <sched.h>
+#include <stdint.h>
 
 #include "config.h"
 #include "lapi/syscalls.h"
@@ -26,7 +27,7 @@ struct clone_args {
 	uint64_t __attribute__((aligned(8))) tls;
 };
 
-int clone3(struct clone_args *args, size_t size)
+static inline int clone3(struct clone_args *args, size_t size)
 {
 	return tst_syscall(__NR_clone3, args, size);
 }
@@ -36,7 +37,7 @@ int clone3(struct clone_args *args, size_t size)
 #define CLONE_PIDFD	0x00001000	/* set if a pidfd should be placed in parent */
 #endif
 
-void clone3_supported_by_kernel(void)
+static inline void clone3_supported_by_kernel(void)
 {
 	if ((tst_kvercmp(5, 3, 0)) < 0) {
 		/* Check if the syscall is backported on an older kernel */
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
