Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D77033F97B0
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 11:52:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2EFDB3C9C81
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 11:52:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 379073C2E1D
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 11:52:37 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B47791400E54
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 11:52:36 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 36C121FED9;
 Fri, 27 Aug 2021 09:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1630057956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6B5d0aFCGz4+uh+MulvogdJFFerjYFSGUR5SkFogHT8=;
 b=X/dH1XTWnOij1K04ZSUpocEEwygFuamhWwCJvazUXUrShPj9QsLVmu+BSiZE+j6pJmY4qE
 grI7VoXFT2jS0D30G4n5y0r6jdPU8jmEjt0aJ1JjNZCvPGn5jJ5cpxLIe6DTIHwNGss9mW
 HgMr0ndPEeHYi2ZvV/eyswga/u1haAE=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id E1A87A3B95;
 Fri, 27 Aug 2021 09:52:35 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri, 27 Aug 2021 10:52:10 +0100
Message-Id: <20210827095210.23602-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827095210.23602-1-rpalethorpe@suse.com>
References: <20210827095210.23602-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] Add CHECK_NOFLAGS and checkpatch.pl to 'make
 check'
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

Add another check command type. CHECK_NOFLAGS just takes the source
file name as an argument. By default it is set to
scripts/checkpatch.pl which is probably the only thing we want to use
it for. OTOH you can set it to clang-tidy instead.

It is run with '-' because of the large number of errors it presently
produces. Also of course, check errors are not actually fatal. If we
wish to stop on errors in the future (e.g. for CI) then a "strict"
option can be introduced.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Suggested-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/mk/env_post.mk | 1 +
 include/mk/rules.mk    | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
index 4722da907..eb76b38a4 100644
--- a/include/mk/env_post.mk
+++ b/include/mk/env_post.mk
@@ -92,6 +92,7 @@ endif
 CHECK_TARGETS			?= $(addprefix check-,$(notdir $(patsubst %.c,%,$(sort $(wildcard $(abs_srcdir)/*.c)))))
 CHECK_TARGETS			:= $(filter-out $(addprefix check-, $(FILTER_OUT_MAKE_TARGETS)), $(CHECK_TARGETS))
 CHECK				?= $(abs_top_srcdir)/tools/sparse/sparse-ltp
+CHECK_NOFLAGS			?= $(abs_top_srcdir)/scripts/checkpatch.pl -f --no-tree --terse --no-summary --ignore CONST_STRUCT,VOLATILE,SPLIT_STRING
 
 ifeq ($(CHECK),$(abs_top_srcdir)/tools/sparse/sparse-ltp)
 CHECK_DEPS			+= $(CHECK)
diff --git a/include/mk/rules.mk b/include/mk/rules.mk
index 2a04b2b67..6bd184841 100644
--- a/include/mk/rules.mk
+++ b/include/mk/rules.mk
@@ -41,8 +41,10 @@ endif
 .PHONY: $(CHECK_TARGETS)
 $(CHECK_TARGETS): check-%: %.c
 ifdef VERBOSE
-	$(CHECK) $(CHECK_FLAGS) $(CPPFLAGS) $(CFLAGS) $<
+	-$(CHECK_NOFLAGS) $<
+	-$(CHECK) $(CHECK_FLAGS) $(CPPFLAGS) $(CFLAGS) $<
 else
-	@$(CHECK) $(CHECK_FLAGS) $(CPPFLAGS) $(CFLAGS) $<
 	@echo CHECK $(target_rel_dir)$<
+	@-$(CHECK_NOFLAGS) $<
+	@-$(CHECK) $(CHECK_FLAGS) $(CPPFLAGS) $(CFLAGS) $<
 endif
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
