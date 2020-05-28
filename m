Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1B11E5DD8
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 13:06:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6DABB3C3205
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 13:06:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E9C383C31C0
 for <ltp@lists.linux.it>; Thu, 28 May 2020 13:06:01 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 496F7141F779
 for <ltp@lists.linux.it>; Thu, 28 May 2020 13:06:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E1792ABCE
 for <ltp@lists.linux.it>; Thu, 28 May 2020 11:05:59 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 28 May 2020 13:05:53 +0200
Message-Id: <20200528110554.10179-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528110554.10179-1-pvorel@suse.cz>
References: <20200528110554.10179-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 1/2] LVM: Don't require root for
 generate_lvm_runfile.sh
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

LTPROOT can be in user writable directory. Having rights for make
install is user responsibility, it does not have to be guarded by
TST_NEEDS_ROOT=1.

Fixes: 45289e498 ("Add LVM support scripts")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/misc/lvm/generate_lvm_runfile.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/testcases/misc/lvm/generate_lvm_runfile.sh b/testcases/misc/lvm/generate_lvm_runfile.sh
index 5ca035f22..b3366cb99 100755
--- a/testcases/misc/lvm/generate_lvm_runfile.sh
+++ b/testcases/misc/lvm/generate_lvm_runfile.sh
@@ -5,7 +5,6 @@
 # Generate LTP runfile for LVM tests (runtest/lvm.local)
 
 TST_TESTFUNC=generate_runfile
-TST_NEEDS_ROOT=1
 TST_NEEDS_CMDS="sed"
 . tst_test.sh
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
