Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF813C6E45
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 12:14:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B19333C876B
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 12:14:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F30B53C663C
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:13:46 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6E44E6008EB
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:13:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 229DA2226C;
 Tue, 13 Jul 2021 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626171226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1GDz8tERqYBMT06TrhPJyxXgECMfWiz0lqrUMCN2gAM=;
 b=vL2IbcfUUhkbaqekKUvNvZUrjNsK1uOdDQuBiv/G5ihTaPaXQCXZqc6oJYuum1vlzMuoQU
 7v5o5i/dDXj87lpB5HYcjyPSYDTdi+etRePxoQ9/+onh7PkxuutdY1NpDMZDukb9ZZpPQj
 gdGZqd7QBpLhb8kt2zoxNGsvkjXxxRc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626171226;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1GDz8tERqYBMT06TrhPJyxXgECMfWiz0lqrUMCN2gAM=;
 b=pRKirWH4HwoMPVjCkmCcAGSZEvJoVne/H3OUFYhTRVEbKy+qYacqf7D297JiTRrwY7HCoE
 vMirONo/ECFnk6DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB79713AE3;
 Tue, 13 Jul 2021 10:13:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0CwkNFln7WCaYAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 13 Jul 2021 10:13:45 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 12:13:36 +0200
Message-Id: <20210713101338.6985-6-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713101338.6985-1-pvorel@suse.cz>
References: <20210713101338.6985-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v4 5/7] make: Add make test{, -c, -shell} targets
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

For testing C and shell API.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v3->v4:
Don't run on cross-compile.

 Makefile | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Makefile b/Makefile
index 56812d77b..ff4a70eec 100644
--- a/Makefile
+++ b/Makefile
@@ -192,6 +192,29 @@ $(INSTALL_TARGETS): $(INSTALL_DIR) $(DESTDIR)/$(bindir)
 ## Install
 install: $(INSTALL_TARGETS)
 
+## Test
+define _test
+	@set -e; $(top_srcdir)/lib/newlib_tests/runtest.sh -b $(abs_builddir) $(1)
+endef
+
+test: lib-all
+ifneq ($(build),$(host))
+	$(error running tests on cross-compile build not supported)
+endif
+	$(call _test)
+
+test-c: lib-all
+ifneq ($(build),$(host))
+	$(error running tests on cross-compile build not supported)
+endif
+	$(call _test,-c)
+
+test-shell: lib-all
+ifneq ($(build),$(host))
+	$(error running tests on cross-compile build not supported)
+endif
+	$(call _test,-s)
+
 ## Help
 .PHONY: help
 help:
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
