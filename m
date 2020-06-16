Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 830CB1FB0F4
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 14:41:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A2CE3C5FBC
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 14:41:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 618603C0718
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 14:40:59 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CF4631BD50CA
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 14:40:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 379E0AD35
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 12:41:02 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 16 Jun 2020 14:41:13 +0200
Message-Id: <20200616124113.14808-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] testcases.mk: Fix LTPLIBS build rule
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

The current code that attempts to rebuild libraries a test is depending
on is broken for more than one library since the "$^" is a list of all
prerequisities.

This fixes the problem by adding a proper pattern rule.

I've also added the libraries to the .PHONY target so that we attempt to
rebuild them regardless of the library archive existence since we do not
know the prerequisities of the library archive in the testcase directory
we cannot tell if some of the sources has been changed so the safest
course of action is to attempt the rebuild every time.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/mk/testcases.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/mk/testcases.mk b/include/mk/testcases.mk
index 684655fbf..bb22be82e 100644
--- a/include/mk/testcases.mk
+++ b/include/mk/testcases.mk
@@ -48,8 +48,12 @@ LTPLIBS_FILES = $(addsuffix .a, $(addprefix $(abs_top_builddir)/libs/, $(foreach
 
 MAKE_DEPS += $(LTPLIBS_FILES)
 
+.PHONY: $(LTPLIBS_FILES)
+
 $(LTPLIBS_FILES): $(LTPLIBS_DIRS)
-	$(MAKE) -C "$^" -f "$(subst $(abs_top_builddir),$(abs_top_srcdir),$^)/Makefile" all
+
+$(LTPLIBS_FILES): %:
+	$(MAKE) -C "$(dir $@)" -f "$(subst $(abs_top_builddir),$(abs_top_srcdir),$(dir $@))/Makefile" all
 
 LDFLAGS += $(addprefix -L$(top_builddir)/libs/lib, $(LTPLIBS))
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
