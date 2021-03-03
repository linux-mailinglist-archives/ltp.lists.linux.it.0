Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE6A32B804
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 14:30:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA2253C6E51
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 14:30:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 6009F3C5691
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 14:24:47 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A6960600678
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 14:24:46 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4FC6ADDC;
 Wed,  3 Mar 2021 13:24:45 +0000 (UTC)
From: Martin Loviska <mloviska@suse.de>
To: ltp@lists.linux.it
Date: Wed,  3 Mar 2021 14:24:03 +0100
Message-Id: <20210303132403.6427-1-mloviska@suse.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 03 Mar 2021 14:29:58 +0100
Subject: [LTP] [PATCH] Wait for complete input provided by `seq`
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
Cc: Fabian Vogt <fvogt@suse.de>, mloviska <mloviska@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: mloviska <mloviska@suse.com>

`splice02` may exit before `seq` therefore broken pipe occurs.

Found with SLES JeOS (https://progress.opensuse.org/issues/77260).

Suggested-by: Fabian Vogt <fvogt@suse.de>
Tested-by: Petr Vorel <pvorel@suse.cz>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Martin Loviska <mloviska@suse.com>
---
 runtest/smoketest | 2 +-
 runtest/syscalls  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/runtest/smoketest b/runtest/smoketest
index 0c24fc1fa..e6800d283 100644
--- a/runtest/smoketest
+++ b/runtest/smoketest
@@ -11,5 +11,5 @@ symlink01 symlink01
 stat04 symlink01 -T stat04
 utime01A symlink01 -T utime01
 rename01A symlink01 -T rename01
-splice02 seq 1 20 | splice02
+splice02 (seq 1 20 || :) | splice02
 route4-change-dst route-change-dst.sh
diff --git a/runtest/syscalls b/runtest/syscalls
index fe22ae5b6..13b87e6bc 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1446,7 +1446,7 @@ socketpair02 socketpair02
 sockioctl01 sockioctl01
 
 splice01 splice01
-splice02 seq 1 20000 | splice02
+splice02 (seq 1 20000 || :) | splice02
 splice03 splice03
 splice04 splice04
 splice05 splice05
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
