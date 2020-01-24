Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 300A8148575
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 13:55:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 627343C23DB
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 13:55:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 26EA43C237A
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 13:55:39 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C1465602128
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 13:55:38 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 18CE4B21F
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 12:55:38 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 24 Jan 2020 13:55:34 +0100
Message-Id: <20200124125537.17714-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/3] Add test for misaligned fallocate()
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
- Remove useless check in purge_dir()
- Fix potential buffer overflow in rmdir()/purge_dir()
- Add description of tst_purge_dir() to test writing guidelines

Martin Doucha (3):
  Add tst_purge_dir() helper function
  Add test for misaligned fallocate()
  Purge temp directory after each run of fallocate05

 doc/test-writing-guidelines.txt               |  11 +
 include/tst_device.h                          |   5 +
 lib/tst_tmpdir.c                              |  97 ++++---
 runtest/syscalls                              |   1 +
 .../kernel/syscalls/fallocate/fallocate05.c   |  11 +-
 .../kernel/syscalls/fallocate/fallocate06.c   | 253 ++++++++++++++++++
 6 files changed, 332 insertions(+), 46 deletions(-)
 create mode 100644 testcases/kernel/syscalls/fallocate/fallocate06.c

-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
