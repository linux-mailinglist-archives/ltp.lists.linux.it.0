Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C293B6E77
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 08:58:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 79E2F3C6C67
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 08:58:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2CA383C0352
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 08:58:45 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 253981A00CB7
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 08:58:44 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6027520387;
 Tue, 29 Jun 2021 06:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624949924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gvJ9aX+yXQ9CLGdZbMabj5jP1lxpGUauAYvFrpX36/Q=;
 b=HAJ3piWTYJrIFSsbB6t8Zf3r4RqRCaRvUPqQQL3LrzhI67dOOFCrpSdJll9A1BbB+dhvnz
 EdqdDe6Ax5FMXI69UBw7+74lx+YQKsTPuRXiP7J9NdXJVA/a6digeRfRvqkCjCdjSgAYQy
 OShxStwviZIc2PyLy3+GRb8nSqU5wQQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624949924;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gvJ9aX+yXQ9CLGdZbMabj5jP1lxpGUauAYvFrpX36/Q=;
 b=QIoHdNzkuhXzS0RyJQyBLTq5yvokuHj9AxYUqbpnZj95MZ+pDWdy3QPrUDl4RiNxzAiivm
 h9OeCYeCesTg+qBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 24B8C11906;
 Tue, 29 Jun 2021 06:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624949924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gvJ9aX+yXQ9CLGdZbMabj5jP1lxpGUauAYvFrpX36/Q=;
 b=HAJ3piWTYJrIFSsbB6t8Zf3r4RqRCaRvUPqQQL3LrzhI67dOOFCrpSdJll9A1BbB+dhvnz
 EdqdDe6Ax5FMXI69UBw7+74lx+YQKsTPuRXiP7J9NdXJVA/a6digeRfRvqkCjCdjSgAYQy
 OShxStwviZIc2PyLy3+GRb8nSqU5wQQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624949924;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gvJ9aX+yXQ9CLGdZbMabj5jP1lxpGUauAYvFrpX36/Q=;
 b=QIoHdNzkuhXzS0RyJQyBLTq5yvokuHj9AxYUqbpnZj95MZ+pDWdy3QPrUDl4RiNxzAiivm
 h9OeCYeCesTg+qBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 4aVUB6TE2mDcCgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 29 Jun 2021 06:58:44 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 29 Jun 2021 08:58:36 +0200
Message-Id: <20210629065836.20932-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] delete_module0{1,
 3}: Skip when kernel is locked down
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
Cc: Anton Smorodskyi <asmorodskyi@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Lockdown requires signed modules, otherwise tests fails with EPERM.
TCONF until we solve signing modules in LTP build.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/delete_module/delete_module01.c | 4 ++++
 testcases/kernel/syscalls/delete_module/delete_module03.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/testcases/kernel/syscalls/delete_module/delete_module01.c b/testcases/kernel/syscalls/delete_module/delete_module01.c
index 8fb559f0c..cec20c19c 100644
--- a/testcases/kernel/syscalls/delete_module/delete_module01.c
+++ b/testcases/kernel/syscalls/delete_module/delete_module01.c
@@ -25,6 +25,10 @@ static int module_loaded;
 
 static void do_delete_module(void)
 {
+	/* lockdown requires signed modules */
+	if (tst_lockdown_enabled())
+		tst_brk(TCONF, "Kernel is locked down, skip this test");
+
 	if (module_loaded == 0) {
 		tst_module_load(MODULE_NAME_KO, NULL);
 		module_loaded = 1;
diff --git a/testcases/kernel/syscalls/delete_module/delete_module03.c b/testcases/kernel/syscalls/delete_module/delete_module03.c
index 7178e8ef1..56cef459f 100644
--- a/testcases/kernel/syscalls/delete_module/delete_module03.c
+++ b/testcases/kernel/syscalls/delete_module/delete_module03.c
@@ -50,6 +50,10 @@ static void do_delete_module(void)
 
 static void setup(void)
 {
+	/* lockdown requires signed modules */
+	if (tst_lockdown_enabled())
+		tst_brk(TCONF, "Kernel is locked down, skip this test");
+
 	/* Load first kernel module */
 	tst_module_load(DUMMY_MOD_KO, NULL);
 	dummy_mod_loaded = 1;
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
