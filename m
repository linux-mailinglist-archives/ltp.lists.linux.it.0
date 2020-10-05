Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E5809283692
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Oct 2020 15:31:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A6CA83C2826
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Oct 2020 15:31:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id DB0003C2612
 for <ltp@lists.linux.it>; Mon,  5 Oct 2020 15:30:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 833771400F91
 for <ltp@lists.linux.it>; Mon,  5 Oct 2020 15:30:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 25577ADE4;
 Mon,  5 Oct 2020 13:30:37 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  5 Oct 2020 15:30:51 +0200
Message-Id: <20201005133054.23587-9-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201005133054.23587-1-chrubis@suse.cz>
References: <20201005133054.23587-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 08/11] make: Allow CLEAN_TARGETS to remove directories
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

From: Petr Vorel <pvorel@suse.cz>

make clean on leaf target can contain also directories.

Changing delete to recursive delete (-r parameter for rm) should be safe
thus detection whether actually requited is not implemented.

This will be needed for metadata metadata.chunked target.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 include/mk/generic_leaf_target.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/mk/generic_leaf_target.inc b/include/mk/generic_leaf_target.inc
index e6fa107d1..64953f89a 100644
--- a/include/mk/generic_leaf_target.inc
+++ b/include/mk/generic_leaf_target.inc
@@ -60,10 +60,10 @@
 # $(HOST_MAKE_TARGETS)	: Host tools which use $HOSTCC.
 #
 # $(CLEAN_TARGETS)		: What targets should be cleaned (must be
-#				  real files). This will automatically append
-#				  adds the .o suffix to all files referenced
-#				  by $(MAKE_TARGETS)) to CLEAN_TARGETS, if
-#				  MAKE_TARGETS wasn't defined (see
+#				  real files or directories). This will automatically append
+#				  adds the .o suffix to all files referenced by
+#				  $(MAKE_TARGETS)) to CLEAN_TARGETS, if MAKE_TARGETS wasn't
+#				  defined (see
 #				  $(MAKE_TARGETS)).
 # $(INSTALL_MODE)		: What mode should we using when calling
 # 				  install(1)?
@@ -103,7 +103,7 @@ $(MAKE_TARGETS): | $(MAKE_DEPS)
 all: $(MAKE_TARGETS)
 
 clean:: $(CLEAN_DEPS)
-	-$(RM) -f $(CLEAN_TARGETS)
+	-$(RM) -f -r $(CLEAN_TARGETS)
 
 $(INSTALL_FILES): | $(INSTALL_DEPS)
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
