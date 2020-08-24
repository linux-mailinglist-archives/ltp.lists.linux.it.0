Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D536624FB58
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 12:24:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88BB43C2EF4
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 12:24:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 778653C13D8
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 12:24:45 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 100B31400BD7
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 12:24:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F3B07ABEA
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 10:25:13 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 24 Aug 2020 12:24:39 +0200
Message-Id: <20200824102439.26587-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] prepare_lvm.sh: Allow to define tmp directory
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

Many distros don't have enough /tmp size for LVM tests, thus
allow to set $LVM_DIR to use different temporary directory.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/misc/lvm/prepare_lvm.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/testcases/misc/lvm/prepare_lvm.sh b/testcases/misc/lvm/prepare_lvm.sh
index e7f9c90e4..b6557f221 100755
--- a/testcases/misc/lvm/prepare_lvm.sh
+++ b/testcases/misc/lvm/prepare_lvm.sh
@@ -9,8 +9,9 @@ TST_NEEDS_ROOT=1
 TST_NEEDS_CMDS="mount pvcreate vgcreate lvcreate"
 . tst_test.sh
 
-LVM_TMPDIR="/tmp/ltp/growfiles"
-LVM_IMGDIR="/tmp/ltp/imgfiles"
+LVM_DIR="${LVM_DIR:-/tmp}"
+LVM_TMPDIR="$LVM_DIR/ltp/growfiles"
+LVM_IMGDIR="$LVM_DIR/ltp/imgfiles"
 
 error_check()
 {
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
