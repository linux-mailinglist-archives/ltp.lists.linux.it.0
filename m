Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFCEB17FF1
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Aug 2025 12:09:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3CA23CCED3
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Aug 2025 12:09:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4F7F93C8D08
 for <ltp@lists.linux.it>; Fri,  1 Aug 2025 12:09:46 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 77DAF1400F23
 for <ltp@lists.linux.it>; Fri,  1 Aug 2025 12:09:43 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1449B21B15;
 Fri,  1 Aug 2025 10:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1754042982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7LsC95xI3l3doDinaCzLkAMjE402xAAUClsw/6YyVBc=;
 b=EJwlecycIDSa9BEpE2lrAY4NnB4omHul+EZydXI/4fecaEmH7Eumol90lpmbweJjJxYy4Z
 MAeBFPYnJeRupc2/7luOMF1QSzloAkIkbzIV7e1cX3ew1VuvmNQ2LZ/5gb3p7ssZEnv6i8
 vVokWpb9/mTw2x8IBXJlFq3z1upQ60U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1754042982;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7LsC95xI3l3doDinaCzLkAMjE402xAAUClsw/6YyVBc=;
 b=YtIEZqF0xR36AqUvl8EjgO04mEMIsXpxcDvYpezxG3ozifXqoP5sV9eL1/9YLrBuks+VWw
 k5ayYmonZsk098Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1754042982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7LsC95xI3l3doDinaCzLkAMjE402xAAUClsw/6YyVBc=;
 b=EJwlecycIDSa9BEpE2lrAY4NnB4omHul+EZydXI/4fecaEmH7Eumol90lpmbweJjJxYy4Z
 MAeBFPYnJeRupc2/7luOMF1QSzloAkIkbzIV7e1cX3ew1VuvmNQ2LZ/5gb3p7ssZEnv6i8
 vVokWpb9/mTw2x8IBXJlFq3z1upQ60U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1754042982;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7LsC95xI3l3doDinaCzLkAMjE402xAAUClsw/6YyVBc=;
 b=YtIEZqF0xR36AqUvl8EjgO04mEMIsXpxcDvYpezxG3ozifXqoP5sV9eL1/9YLrBuks+VWw
 k5ayYmonZsk098Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF3B1138A5;
 Fri,  1 Aug 2025 10:09:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IhK7L2WSjGgtRwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 01 Aug 2025 10:09:41 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  1 Aug 2025 12:09:35 +0200
Message-ID: <20250801100935.974351-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 1/1] Makefile: Add kernel modules related make
 targets
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

LTP contains few kernel modules and tests which are using them.  These
require to be built with the same kernel headers as the running kernel
(SUT). Sometimes the best way to achieve this is to compile them on the
SUT.

Add 'modules', 'modules-clean' and 'modules-install' make targets to
make it easier to build them.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

I'm sorry for the noise.

Most of the people will need just modules-install, but let's be
consistent with other LTP make targets.

Kind regards,
Petr

Changes v1->v2:
* Add also modules-clean and modules-install
This is needed as 'make modules clean' or 'make modules install'
would be running 2 separate targets.

v1:
https://lore.kernel.org/ltp/20250801094205.965645-1-pvorel@suse.cz/
https://patchwork.ozlabs.org/project/ltp/patch/20250801094205.965645-1-pvorel@suse.cz/

 INSTALL  | 10 ++++++++++
 Makefile | 24 ++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/INSTALL b/INSTALL
index cbe27f32ea..10c19d4105 100644
--- a/INSTALL
+++ b/INSTALL
@@ -165,6 +165,16 @@ PKG_CONFIG_LIBDIR=/usr/lib/i386-linux-gnu/pkgconfig CFLAGS=-m32 LDFLAGS=-m32 ./c
 * Arch Linux
 PKG_CONFIG_LIBDIR=/usr/lib32/pkgconfig CFLAGS=-m32 LDFLAGS=-m32 ./configure
 
+Kernel modules
+--------------
+
+LTP contains few kernel modules and tests which are using them.
+These require to be built with the same kernel headers as the running kernel (SUT).
+Sometimes the best way to achieve this is to compile them on the SUT.
+
+'modules', 'modules-clean' and 'modules-install' make targets are shortcuts
+to build just these modules and tests.
+
 Android Users
 -------------
 
diff --git a/Makefile b/Makefile
index eab40da8a6..933e33ca75 100644
--- a/Makefile
+++ b/Makefile
@@ -212,6 +212,30 @@ endif
 test-metadata: metadata-all
 	$(MAKE) -C $(abs_srcdir)/metadata test
 
+MODULE_DIRS := commands/insmod \
+	testcases/kernel/firmware \
+	testcases/kernel/device-drivers \
+	testcases/kernel/syscalls/delete_module \
+	testcases/kernel/syscalls/finit_module \
+	testcases/kernel/syscalls/init_module
+
+.PHONY: modules modules-clean modules-install
+modules:
+	@$(foreach dir,$(MODULE_DIRS),\
+		echo "Build $(dir)";\
+		$(MAKE) -C $(abs_srcdir)/$(dir); \
+)
+modules-clean:
+	@$(foreach dir,$(MODULE_DIRS),\
+		echo "Build $(dir)";\
+		$(MAKE) -C $(abs_srcdir)/$(dir) clean; \
+)
+modules-install: modules
+	@$(foreach dir,$(MODULE_DIRS),\
+		echo "Build $(dir)";\
+		$(MAKE) -C $(abs_srcdir)/$(dir) install; \
+)
+
 ## Help
 .PHONY: help
 help:
-- 
2.50.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
