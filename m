Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9BE3971EB
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 12:55:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE6073C7E64
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 12:55:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4196B3C59F3
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 12:55:36 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 413DB6008B7
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 12:55:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id AFABF218AB;
 Tue,  1 Jun 2021 10:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1622544934; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=gFybT+NDwmZZAl1hcHGUhLwSXeCPk7bbQN0/5ckDf7s=;
 b=ETNX1jjO7wFnAVPFCkBgJ2Z6rFdpFnZilYpwi4hDU1ynRgHb0E+73dcLgetQofl0gNmjFN
 +ZXX9eI7SVP1tuNC/E0rY0p4Xzq1GWKaWclfCmNtMceSRDk9Y1AxgPNIYy4/WEIY3Y6y+s
 F9g6Shvkb6T0HauKo70K/q8IeTDJH30=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 80562A3B81;
 Tue,  1 Jun 2021 10:55:34 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  1 Jun 2021 11:55:15 +0100
Message-Id: <20210601105521.27459-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/6] cfs_bandwidth01 and CGroup API
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

V3:
* Reverse order of writing cpu.cfs_period_us and cpu.cfs_quota_us to fix V1.
* Add may_have_waiters to indicate we should try waking and cleaning up
  children during cleanup. At worst this can result in timeout warnings if there
  are less than 9 children waiting.
  Which is probably better than failing to cleanup the CGroups.

V2:
* Simpler check for unrecognised controller name
* Dropped whitespace patch which was already merged
* Moved subgroup creation to setup. Otherwise it leaks memory between iterations.
  Although the test still worked because it doesn't error if the group already
  exists.

Richard Palethorpe (6):
  API/cgroups: Allow fetching of CGroup name
  API/cgroups: Remove obsolete function in API
  API/cgroups: Add cpu controller
  API/cgroups: Auto add controllers to subtree_control in new subgroup
  API/cgroups: tst_require fail gracefully with unknown controller
  sched/cgroup: Add cfs_bandwidth01

 include/tst_cgroup.h                          |   4 +
 lib/tst_cgroup.c                              |  58 ++++--
 runtest/sched                                 |   1 +
 .../kernel/sched/cfs-scheduler/.gitignore     |   1 +
 testcases/kernel/sched/cfs-scheduler/Makefile |   4 +-
 .../sched/cfs-scheduler/cfs_bandwidth01.c     | 184 ++++++++++++++++++
 6 files changed, 236 insertions(+), 16 deletions(-)
 create mode 100644 testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
