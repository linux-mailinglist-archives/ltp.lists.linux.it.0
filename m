Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCFE251CEB
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 18:07:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F8C83C2975
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 18:07:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id B99463C13D8
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 18:07:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4F1BF1000A85
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 18:07:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2311EB077
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 16:08:07 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 25 Aug 2020 18:07:31 +0200
Message-Id: <20200825160735.24602-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/4] Improve reliability of ioctl_sg01
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

ioctl_sg01 needs dirty memory to reliably detect kernel data leaks. Its
description originally recommended running it after mem01 which has been
recently dropped.

Add helper function to LTP library for pre-polluting free memory and loop
the main check in ioctl_sg01 to further decrease the chance of false negative.

Martin Doucha (4):
  Add SAFE_SYSINFO() macro
  Add tst_pollute_memory() helper function
  ioctl_sg01: Pollute free memory in setup
  ioctl_sg01: Loop data leak check 100 times

 include/tst_memutils.h                       | 22 +++++++
 include/tst_safe_macros.h                    |  5 ++
 lib/safe_macros.c                            | 20 +++++++
 lib/tst_memutils.c                           | 62 ++++++++++++++++++++
 testcases/kernel/syscalls/ioctl/ioctl_sg01.c | 32 ++++++----
 5 files changed, 128 insertions(+), 13 deletions(-)
 create mode 100644 include/tst_memutils.h
 create mode 100644 lib/tst_memutils.c

-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
