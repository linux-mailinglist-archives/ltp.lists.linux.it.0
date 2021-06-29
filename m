Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C03A83B7A0F
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 23:48:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA6323C93A2
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 23:48:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 58BD33C6CF1
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 23:48:16 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DCF2F140004E
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 23:48:15 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 93BCE225E7;
 Tue, 29 Jun 2021 21:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625003295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JqIMcD7/1tjbdCHpp2PVrAC5mdgBhEx4SYNhwVuM5SQ=;
 b=s6jZZqW8DK5xiLLQ+wv+8FcgMITkckQj86SFXs5OSbLvnidPQrkN0sdFNk6GYBV9KqmYyi
 2VnZxz+rXUJETr7ZxAmrz0pb7Tb+y/tDKLJC0NRPRvtEvxRIFPYZJ6OZjqe8yGjSZret0r
 asYWOO6K/YjT4VWkJLGB3BBGQNRmtXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625003295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JqIMcD7/1tjbdCHpp2PVrAC5mdgBhEx4SYNhwVuM5SQ=;
 b=Z2sApKCIEGrUCpFNbEzNSRXM/WT3gL67OLABSsj+DEJrnK6YR734DYJnfmvl1bY/MY7QkC
 6ljj7L/6RJDYy3Dg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5052911906;
 Tue, 29 Jun 2021 21:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625003295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JqIMcD7/1tjbdCHpp2PVrAC5mdgBhEx4SYNhwVuM5SQ=;
 b=s6jZZqW8DK5xiLLQ+wv+8FcgMITkckQj86SFXs5OSbLvnidPQrkN0sdFNk6GYBV9KqmYyi
 2VnZxz+rXUJETr7ZxAmrz0pb7Tb+y/tDKLJC0NRPRvtEvxRIFPYZJ6OZjqe8yGjSZret0r
 asYWOO6K/YjT4VWkJLGB3BBGQNRmtXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625003295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JqIMcD7/1tjbdCHpp2PVrAC5mdgBhEx4SYNhwVuM5SQ=;
 b=Z2sApKCIEGrUCpFNbEzNSRXM/WT3gL67OLABSsj+DEJrnK6YR734DYJnfmvl1bY/MY7QkC
 6ljj7L/6RJDYy3Dg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id uPkTEh+V22AcSAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 29 Jun 2021 21:48:15 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 29 Jun 2021 23:48:06 +0200
Message-Id: <20210629214808.18760-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629214808.18760-1-pvorel@suse.cz>
References: <20210629214808.18760-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/5] make: Add make test{, -c, -shell} targets
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

For testing C and shell API.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Simplicity wins :).

 Makefile | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Makefile b/Makefile
index 56812d77b..7c1dba7e6 100644
--- a/Makefile
+++ b/Makefile
@@ -192,6 +192,16 @@ $(INSTALL_TARGETS): $(INSTALL_DIR) $(DESTDIR)/$(bindir)
 ## Install
 install: $(INSTALL_TARGETS)
 
+## Test
+test: lib-all
+	$(top_srcdir)/lib/newlib_tests/runtest.sh
+
+test-c: lib-all
+	$(top_srcdir)/lib/newlib_tests/runtest.sh -c
+
+test-shell: lib-all
+	$(top_srcdir)/lib/newlib_tests/runtest.sh -s
+
 ## Help
 .PHONY: help
 help:
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
