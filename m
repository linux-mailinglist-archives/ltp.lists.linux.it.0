Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B95D827C2FA
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 12:58:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D65E3C2A89
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 12:58:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 385103C2824
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 12:58:33 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1F382200908
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 12:58:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8EF2DB202
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 10:58:32 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 29 Sep 2020 12:58:24 +0200
Message-Id: <20200929105824.28793-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929105824.28793-1-pvorel@suse.cz>
References: <20200929105824.28793-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] doc/user-guide: Document block device variables
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

NOTE: LTP_BIG_DEV{,FS_TYPE} omitted, because used only
in dma_thread_diotest.c which is using legacy API.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/user-guide.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/doc/user-guide.txt b/doc/user-guide.txt
index 5cb8322cf..8df29e688 100644
--- a/doc/user-guide.txt
+++ b/doc/user-guide.txt
@@ -13,6 +13,9 @@ For running LTP network tests see `testcases/network/README.md`.
 | 'LTPROOT'             | Prefix for installed LTP, the default is '/opt/ltp'.
 | 'LTP_COLORIZE_OUTPUT' | Force colorized output behaviour. 'y' or '1': always colorize
                           'n' or '0': never colorize.
+| 'LTP_DEV'             | Path to the block device to be used
+                          (C: '.needs_device = 1', shell: 'TST_NEEDS_DEVICE=1').
+| 'LTP_DEV_FS_TYPE'     | Filesystem used for testing (default: 'ext2').
 | 'LTP_TIMEOUT_MUL'     | Multiply timeout, must be number >= 1 (> 1 is useful for
                           slow machines to avoid unexpected timeout).
                           Variable is also used in shell tests, but ceiled to int.
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
