Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC271CF8CB
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 17:17:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C4B03C24A4
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 17:17:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 664313C209D
 for <ltp@lists.linux.it>; Tue, 12 May 2020 17:17:04 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E936D10007AE
 for <ltp@lists.linux.it>; Tue, 12 May 2020 17:17:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 61B0BAB64
 for <ltp@lists.linux.it>; Tue, 12 May 2020 15:17:06 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 12 May 2020 17:17:30 +0200
Message-Id: <20200512151730.10201-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512151730.10201-1-chrubis@suse.cz>
References: <20200512151730.10201-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] [COMMITTED] lib: Fix two strncpy() destination
 equal bounds warnings
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

In function 'strncpy',
    inlined from 'tst_sys_conf_save_str' at tst_sys_conf.c:29:2:
/usr/include/bits/string_fortified.h:106:10: warning: '__builtin_strncpy' specified bound 4096 equals destination size [-Wstringop-truncation]
  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function 'strncpy',
    inlined from 'tst_sys_conf_save_str' at tst_sys_conf.c:30:2:
/usr/include/bits/string_fortified.h:106:10: warning: '__builtin_strncpy' specified bound 4096 equals destination size [-Wstringop-truncation]
  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In short we have to always copy dest-1 bytes and zero the last one, that
may still make us loose part of the path, but at least we will not
crash.

Maybe we should rewrite the code to just use strdup() instead.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/tst_sys_conf.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/tst_sys_conf.c b/lib/tst_sys_conf.c
index 1ae875387..4ad9f8b9b 100644
--- a/lib/tst_sys_conf.c
+++ b/lib/tst_sys_conf.c
@@ -26,8 +26,11 @@ int tst_sys_conf_save_str(const char *path, const char *value)
 {
 	struct tst_sys_conf *n = SAFE_MALLOC(sizeof(*n));
 
-	strncpy(n->path, path, sizeof(n->path));
-	strncpy(n->value, value, sizeof(n->value));
+	strncpy(n->path, path, sizeof(n->path)-1);
+	strncpy(n->value, value, sizeof(n->value)-1);
+
+	n->path[sizeof(n->path) - 1] = 0;
+	n->value[sizeof(n->value) - 1] = 0;
 
 	n->next = save_restore_data;
 	save_restore_data = n;
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
