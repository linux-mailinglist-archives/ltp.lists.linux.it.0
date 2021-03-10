Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD17333C91
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 13:24:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D56C53C555F
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 13:24:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C825D3C4B4F
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 13:24:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4CAC51A01165
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 13:24:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6313FAE55
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 12:24:41 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 10 Mar 2021 13:26:22 +0100
Message-Id: <20210310122625.25425-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] Add proper filesystem skiplist
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

This adds a proper .skip_filesystems array to the tst_test structure and
implements support for both test with .all_filesystems enabled and
disabled.

As a bonus point we get the list of filesystems that the test does not
support exported to the metadata as well.

Cyril Hrubis (3):
  lib: Add proper filesystem skiplist
  lib: tst_fs_type change fs names to lowercase
  lib: Apply the skip_filesystems to rest of test as well

 include/tst_fs.h                              | 19 +++++++---
 include/tst_test.h                            |  9 +++--
 lib/tst_fs_type.c                             | 36 +++++++++----------
 lib/tst_supported_fs_types.c                  | 35 +++++++++++++-----
 lib/tst_test.c                                | 12 ++++++-
 testcases/kernel/syscalls/fcntl/fcntl33.c     | 19 ++++------
 .../kernel/syscalls/fsconfig/fsconfig01.c     |  2 +-
 testcases/kernel/syscalls/fsmount/fsmount01.c |  2 +-
 testcases/kernel/syscalls/fsmount/fsmount02.c |  2 +-
 testcases/kernel/syscalls/fsopen/fsopen01.c   |  2 +-
 testcases/kernel/syscalls/fspick/fspick01.c   |  2 +-
 testcases/kernel/syscalls/fspick/fspick02.c   |  2 +-
 .../kernel/syscalls/ioctl/ioctl_loop05.c      | 11 +++---
 .../kernel/syscalls/move_mount/move_mount01.c |  2 +-
 .../kernel/syscalls/move_mount/move_mount02.c |  2 +-
 .../kernel/syscalls/open_tree/open_tree01.c   |  2 +-
 .../kernel/syscalls/open_tree/open_tree02.c   |  2 +-
 .../sync_file_range/sync_file_range02.c       |  2 +-
 .../kernel/syscalls/vmsplice/vmsplice01.c     |  9 +++--
 .../kernel/syscalls/vmsplice/vmsplice02.c     |  9 +++--
 testcases/lib/tst_supported_fs.c              |  4 +--
 21 files changed, 111 insertions(+), 74 deletions(-)

-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
