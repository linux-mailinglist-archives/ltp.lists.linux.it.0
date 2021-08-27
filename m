Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8463F93F7
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 07:13:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C72913C2D80
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 07:13:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4AFFC3C2D6A
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 07:13:21 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7D03C601164
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 07:13:20 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DF1281FEC2;
 Fri, 27 Aug 2021 05:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1630041199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Nn8sIE2X5+xg3CUHhGEMrJGP2JZmuk4hXjSNyuT+TA=;
 b=JUP6ySokcsHlLPvPlIENqByxLtJpz/I1sJX7F3oF6y76JIjy8gh11JCzQ9UTx0FQbq4d9/
 ZLi9EWiabQ4GSgrVCgK4JctH89SMwSvGgVu7q/iY7/czMiKuU2NS60wqwY/TwxEZp61sSf
 sG4vR6wljd1xNfGs0cylikhBvOP7Gsg=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id AB0E2A3B8F;
 Fri, 27 Aug 2021 05:13:19 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri, 27 Aug 2021 06:13:08 +0100
Message-Id: <20210827051309.28521-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827051309.28521-1-rpalethorpe@suse.com>
References: <20210827051309.28521-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] bpf: Mention CAP_BPF in required privs and add
 fallback definition
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

We don't need CAP_SYS_ADMIN most of the time. bpf() can be called with
only CAP_BPF even when unprivileged_bpf_disable > 0. When
unprivileged_bpf_disable == 0, CAP_BPF also allows more features Vs. no
privileges at all.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/lapi/capability.h                  | 4 ++++
 testcases/kernel/syscalls/bpf/bpf_common.c | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/lapi/capability.h b/include/lapi/capability.h
index c6470f389..8cabd0f28 100644
--- a/include/lapi/capability.h
+++ b/include/lapi/capability.h
@@ -44,6 +44,10 @@
 # define CAP_SYS_RESOURCE     24
 #endif
 
+#ifndef CAP_BPF
+# define CAP_BPF              39
+#endif
+
 #ifndef CAP_TO_INDEX
 # define CAP_TO_INDEX(x)     ((x) >> 5)
 #endif
diff --git a/testcases/kernel/syscalls/bpf/bpf_common.c b/testcases/kernel/syscalls/bpf/bpf_common.c
index 6e9cd498c..72957a487 100644
--- a/testcases/kernel/syscalls/bpf/bpf_common.c
+++ b/testcases/kernel/syscalls/bpf/bpf_common.c
@@ -40,7 +40,7 @@ int bpf_map_create(union bpf_attr *const attr)
 		if (errno == EPERM) {
 			tst_res(TCONF, "Hint: check also /proc/sys/kernel/unprivileged_bpf_disabled");
 			tst_brk(TCONF | TERRNO,
-				"bpf() requires CAP_SYS_ADMIN on this system");
+				"bpf() requires CAP_SYS_ADMIN or CAP_BPF on this system");
 		} else {
 			tst_brk(TBROK | TERRNO, "Failed to create array map");
 		}
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
