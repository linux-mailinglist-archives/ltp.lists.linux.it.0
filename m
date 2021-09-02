Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 467BA3FEC3C
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 12:38:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A74F3C939D
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 12:38:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 70D1C3C2BD6
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 12:37:58 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E204D600489
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 12:37:57 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C5EA20334;
 Thu,  2 Sep 2021 10:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630579077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wDS2K1nLFTSXLqY52cA1wBd9vsSOSjhDOhnYKzmFI5Y=;
 b=VPmUMfx4nBDFLecGEWFZE6da7vaExioW7mi8Q3nAlDGTK2zzfuj6o3VwhwTbCg60uG5RJS
 eve5GmiXyf/usG/5W/s2a1AOrCJrnee3s/e84Ft9wT4T0aJkGY+6XI03cy2bnyMlVAaOpw
 Htlzp6GuG48mWzogdPgK+0/QxtB8RcU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630579077;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wDS2K1nLFTSXLqY52cA1wBd9vsSOSjhDOhnYKzmFI5Y=;
 b=pWvEnMJIqQmp1c28t+cSr8uik9McbPpotxYvSaS7SpNAdph034sE6tOcMp76eDaVTe0uo5
 heFKYw4U7B+jx9Bg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3472C13424;
 Thu,  2 Sep 2021 10:37:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id UI6yCoWpMGGmaAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 02 Sep 2021 10:37:57 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  2 Sep 2021 12:37:39 +0200
Message-Id: <20210902103740.19446-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210902103740.19446-1-pvorel@suse.cz>
References: <20210902103740.19446-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] rules.mk: Add checkbashisms to 'make check' for
 *.sh
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Similarly to 3c83485d1 it runs checkbashisms part of 'make check' and
'make check-$TCID.sh' for particular script only, e.g. 'make
check-tst_net.sh' (deliberately kept *.sh suffix to be different for C
targets, because shell targets itself does not have make target).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 include/mk/env_post.mk              | 2 ++
 include/mk/generic_leaf_target.inc  | 2 +-
 include/mk/generic_trunk_target.inc | 2 +-
 include/mk/rules.mk                 | 9 +++++++++
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
index eb76b38a4..ec045c40d 100644
--- a/include/mk/env_post.mk
+++ b/include/mk/env_post.mk
@@ -93,6 +93,8 @@ CHECK_TARGETS			?= $(addprefix check-,$(notdir $(patsubst %.c,%,$(sort $(wildcar
 CHECK_TARGETS			:= $(filter-out $(addprefix check-, $(FILTER_OUT_MAKE_TARGETS)), $(CHECK_TARGETS))
 CHECK				?= $(abs_top_srcdir)/tools/sparse/sparse-ltp
 CHECK_NOFLAGS			?= $(abs_top_srcdir)/scripts/checkpatch.pl -f --no-tree --terse --no-summary --ignore CONST_STRUCT,VOLATILE,SPLIT_STRING
+SHELL_CHECK			?= $(abs_top_srcdir)/scripts/checkbashisms.pl --force --extra
+SHELL_CHECK_TARGETS		?= $(addprefix check-,$(notdir $(sort $(wildcard $(abs_srcdir)/*.sh))))
 
 ifeq ($(CHECK),$(abs_top_srcdir)/tools/sparse/sparse-ltp)
 CHECK_DEPS			+= $(CHECK)
diff --git a/include/mk/generic_leaf_target.inc b/include/mk/generic_leaf_target.inc
index aa092a5a3..33e9c9ea0 100644
--- a/include/mk/generic_leaf_target.inc
+++ b/include/mk/generic_leaf_target.inc
@@ -110,6 +110,6 @@ $(INSTALL_FILES): | $(INSTALL_DEPS)
 install: $(INSTALL_FILES)
 
 $(CHECK_TARGETS): | $(CHECK_DEPS)
-check: $(CHECK_TARGETS)
+check: $(CHECK_TARGETS) $(SHELL_CHECK_TARGETS)
 
 # vim: syntax=make
diff --git a/include/mk/generic_trunk_target.inc b/include/mk/generic_trunk_target.inc
index 32a108fbf..82aece7c0 100644
--- a/include/mk/generic_trunk_target.inc
+++ b/include/mk/generic_trunk_target.inc
@@ -69,7 +69,7 @@ $(INSTALL_FILES): | $(INSTALL_DEPS)
 trunk-install: $(INSTALL_FILES)
 
 $(CHECK_TARGETS): | $(CHECK_DEPS)
-trunk-check: $(CHECK_TARGETS)
+trunk-check: $(CHECK_TARGETS) $(SHELL_CHECK_TARGETS)
 
 # Avoid creating duplicate .PHONY references to all, clean, and install. IIRC,
 # I've seen some indeterministic behavior when one does this in the past with
diff --git a/include/mk/rules.mk b/include/mk/rules.mk
index 6bd184841..a60e6705a 100644
--- a/include/mk/rules.mk
+++ b/include/mk/rules.mk
@@ -48,3 +48,12 @@ else
 	@-$(CHECK_NOFLAGS) $<
 	@-$(CHECK) $(CHECK_FLAGS) $(CPPFLAGS) $(CFLAGS) $<
 endif
+
+.PHONY: $(SHELL_CHECK_TARGETS)
+$(SHELL_CHECK_TARGETS): check-%.sh: %.sh
+ifdef VERBOSE
+	-$(SHELL_CHECK) $<
+else
+	@echo CHECK $(target_rel_dir)$<
+	@-$(SHELL_CHECK) $<
+endif
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
