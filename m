Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B102324270
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 17:49:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3AE73C59A2
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 17:49:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E0E5F3C4E27
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 17:49:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 47578200DF5
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 17:49:22 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AB1C5AF2C;
 Wed, 24 Feb 2021 16:49:21 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 24 Feb 2021 17:50:41 +0100
Message-Id: <20210224165045.17738-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224165045.17738-1-chrubis@suse.cz>
References: <20210224165045.17738-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/5] lib: tst_cmd: Make tst_cmd() usable for global
 paths
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
Cc: Michal Simek <michals@xilinx.com>, Carlos Hernandez <ceh@ti.com>,
 automated-testing@yoctoproject.org, Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

We need to skip the check if the path to the binary starts with '/'.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/tst_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_cmd.c b/lib/tst_cmd.c
index 7446249f9..b73978e20 100644
--- a/lib/tst_cmd.c
+++ b/lib/tst_cmd.c
@@ -58,7 +58,7 @@ int tst_cmd_fds_(void (cleanup_fn)(void),
 
 	char path[PATH_MAX];
 
-	if (tst_get_path(argv[0], path, sizeof(path))) {
+	if (argv[0][0] != '/' && tst_get_path(argv[0], path, sizeof(path))) {
 		if (flags & TST_CMD_TCONF_ON_MISSING)
 			tst_brkm(TCONF, cleanup_fn, "Couldn't find '%s' in $PATH at %s:%d", argv[0],
 				 __FILE__, __LINE__);
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
