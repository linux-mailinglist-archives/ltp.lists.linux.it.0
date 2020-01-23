Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B46146E37
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 17:20:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 604453C255F
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 17:20:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C4EC93C251F
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 17:20:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DF9F820134D
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 17:20:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3A876AEA2
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 16:20:20 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 23 Jan 2020 17:20:16 +0100
Message-Id: <20200123162019.18958-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/3] Add test for misaligned fallocate()
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

This patch is a follow-up to the fallocate05 fix. The original fallocate05
test accidentally tested some misaligned allocation and deallocation
on platforms with block size bigger than 8k but it didn't validate
the results correctly. Test calling fallocate() on misaligned file range
and this time validate the results properly, taking into account advanced
FS features like copy-on-write.

Changes since v1:
- Fix compilation with --std=c89
- Misalign by at most 512 bytes, otherwise the test may miss an XFS bug on PPC
- Clear the temp directory using tst_purge_dir()

Martin Doucha (3):
  Add tst_purge_dir() helper function
  Add test for misaligned fallocate()
  Purge temp directory after each run of fallocate05

 include/tst_device.h                          |   5 +
 lib/tst_tmpdir.c                              | 106 +++++---
 runtest/syscalls                              |   1 +
 .../kernel/syscalls/fallocate/fallocate05.c   |  11 +-
 .../kernel/syscalls/fallocate/fallocate06.c   | 253 ++++++++++++++++++
 5 files changed, 333 insertions(+), 43 deletions(-)
 create mode 100644 testcases/kernel/syscalls/fallocate/fallocate06.c

-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
