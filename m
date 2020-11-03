Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B902A4FBF
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 20:13:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4DABC3C5465
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 20:13:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 815733C3021
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 20:13:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 38CA91401433
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 20:13:41 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EA232AF38;
 Tue,  3 Nov 2020 19:13:40 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 Nov 2020 20:13:23 +0100
Message-Id: <20201103191327.11081-8-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201103191327.11081-1-pvorel@suse.cz>
References: <20201103191327.11081-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 07/11] make: Allow {INSTALL,
 MAKE}_TARGETS be a directory
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
Cc: automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

by detecting it and adding required -d parameter for install
and installing whole directory with -t.

This will be needed for metadata metadata.chunked target.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 include/mk/functions.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/mk/functions.mk b/include/mk/functions.mk
index 79c6193ca..e86dbccdc 100644
--- a/include/mk/functions.mk
+++ b/include/mk/functions.mk
@@ -35,7 +35,8 @@ INSTALL_FILES		+= $$(abspath $$(DESTDIR)/$(3)/$(1))
 
 $$(abspath $$(DESTDIR)/$(3)/$(1)): \
     $$(abspath $$(dir $$(DESTDIR)/$(3)/$(1)))
-	install -m $$(INSTALL_MODE) "$(2)/$(1)" "$$@"
+	install -m $$(INSTALL_MODE) $(shell test -d "$(2)/$(1)" && echo "-d") $(PARAM) "$(2)/$(1)" $$@
+	$(shell test -d "$(2)/$(1)" && echo "install -m "'$$(INSTALL_MODE) $(PARAM)' "$(2)/$(1)/*" -t '$$@')
 endef
 
 #
-- 
2.29.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
