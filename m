Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E2D6711B
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 16:15:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F4E23C1CE4
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 16:15:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3758D3C1C94
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 16:15:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3563F1A027AB
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 16:15:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6D979AFE0
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 14:15:31 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 12 Jul 2019 16:15:28 +0200
Message-Id: <20190712141530.22195-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] Fix acct failures on nearly full FS.
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

Unfortunately it looks like BSD process accounting on Linux is bit of a
minefield, even when you enable the accounting and everything looks OK
kernel may still drop the data silently for a couple of reasons. You can
have a look at kernel/acct.c. This patch disables the test if there is
no enough disk space because in that case data are silently dropped.

If there is less than 4% of free space the accounting is silently
disabled from the start hence the test produces TCONF unless there is at
least 4.1% of free space now.

Cyril Hrubis (2):
  safe_macros: Add SAFE_STATFS()
  syscalls/acct02: Fix failures with nearly full FS

 include/tst_safe_macros.h               | 18 ++++++++++++++++++
 testcases/kernel/syscalls/acct/acct02.c | 12 ++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
