Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4474334D631
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 19:41:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E882B3C8C1D
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 19:41:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8C2153C1A31
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 19:41:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EC67A68FF5E
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 19:41:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 26948AFDF;
 Mon, 29 Mar 2021 17:41:42 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 29 Mar 2021 19:41:35 +0200
Message-Id: <20210329174135.23890-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_safe_macros: Add SAFE_EXECVP()
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Fix for Joerg's patch [1], deliberatelly using execvp() instead of
execv() (more info at that patch).

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20210315092844.991073-1-lkml@jv-coder.de/

 include/tst_safe_macros.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index 2a2b0088a..b9d9baa1a 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -487,6 +487,12 @@ int safe_sigwait(const char *file, const int lineno,
                 "execl(%s, %s, ...) failed", file, arg); 	\
        } while (0)
 
+#define SAFE_EXECVP(file, arg) do {                   \
+	execvp((file), (arg));              \
+	tst_brk_(__FILE__, __LINE__, TBROK | TERRNO,       \
+	         "execvp(%s, %p) failed", file, arg); \
+	} while (0)
+
 int safe_getpriority(const char *file, const int lineno, int which, id_t who);
 #define SAFE_GETPRIORITY(which, who) \
 	safe_getpriority(__FILE__, __LINE__, (which), (who))
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
