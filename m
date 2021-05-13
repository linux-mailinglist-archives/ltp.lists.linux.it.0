Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A047B37FA8B
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 17:21:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5CB63C6419
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 17:21:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EBD703C1C23
 for <ltp@lists.linux.it>; Thu, 13 May 2021 17:21:55 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7FDDD601DB1
 for <ltp@lists.linux.it>; Thu, 13 May 2021 17:21:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620919314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SCkdj3iHOC/Wx5bWDC/xaGt7+C9NkKoF6+nb+jqSR70=;
 b=MIvctokK5/D/jm2o0LE5Injn5NrfZ9fK4fuBGFr4cJPTeXCkCpXjn6vV1ZX89DX1GfKJ9g
 MipRwE+SmWQa7/Q2fFEwED/eGH97RwTFxiA3m0zgYOw4olLj/umIs8op6uhO8i/8k2COfs
 Qso23M2r2p9mkDzh/iiF81qZhGFPTwA=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C5141B180;
 Thu, 13 May 2021 15:21:54 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 13 May 2021 16:21:19 +0100
Message-Id: <20210513152125.25766-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 0/6] cfs_bandwidth01 and CGroup API
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

This adds a test scheduler test which uses the cpu controller.

Also included are some additions and fixes to the CGroup API related
to the test.

Richard Palethorpe (6):
  API/cgroups: Allow fetching of CGroup name
  API/cgroups: Remove obsolete function in API
  API/cgroups: Check for unknown controller name
  API/cgroups: Add cpu controller
  API/cgroups: Auto add controllers to subtree_control in new subgroup
  sched/cgroup: Add cfs_bandwidth01

 include/tst_cgroup.h                          |   4 +
 lib/tst_cgroup.c                              |  94 ++++++----
 runtest/sched                                 |   1 +
 .../kernel/sched/cfs-scheduler/.gitignore     |   1 +
 testcases/kernel/sched/cfs-scheduler/Makefile |   4 +-
 .../sched/cfs-scheduler/cfs_bandwidth01.c     | 175 ++++++++++++++++++
 6 files changed, 245 insertions(+), 34 deletions(-)
 create mode 100644 testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
