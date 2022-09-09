Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BED85B3A86
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Sep 2022 16:18:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E314E3CAA6B
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Sep 2022 16:18:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1A63F3CA9C9
 for <ltp@lists.linux.it>; Fri,  9 Sep 2022 16:18:46 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6A90C10011B2
 for <ltp@lists.linux.it>; Fri,  9 Sep 2022 16:18:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BC60821F3E;
 Fri,  9 Sep 2022 14:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1662733124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=b/+TypTTsaKJN+xUVOC0L/pC9PMuZU5gkN+N4n/H6j8=;
 b=Qjh4j3kkofIWzcfFD6hH1DVi9j0l5jtUqfUbLIMIAMZ6RHZ4BZMErRUyTLxS5enLtoj0Kh
 yod4VrL4nP3GXqIiw3GAwaEkff/E7XXKSKLBHxeLMOGiZYAMLweZmlOVDV5F4tzZAykhzt
 Ua81Depg7aJ3//5NjJ3KqJGyWZ7gu/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1662733124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=b/+TypTTsaKJN+xUVOC0L/pC9PMuZU5gkN+N4n/H6j8=;
 b=1+q/ag3d4q9y/UmP6y4KdfD/hyeeQBWbbnjbxU/C1fPcx3Mvc1tnkzYxsub+CUTvLqdoSO
 v0PnfrsJPqbtGbDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 619D313A93;
 Fri,  9 Sep 2022 14:18:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EryOFkRLG2NmWAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 09 Sep 2022 14:18:44 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  9 Sep 2022 16:18:30 +0200
Message-Id: <20220909141840.18327-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v5 00/10] shell: df01.sh: $TST_ALL_FILESYSTEMS
 (.all_filesystems)
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

changes v4->v5:
* tst_fs_is_supported_skiplist() returns TST_FS_UNSUPPORTED,
  errors handled in testcases/lib/tst_supported_fs.c (Cyril)
* testcases/lib/tst_supported_fs.c: put parsing code to separate
  function parse_skiplist() (Cyril)
* testcases/lib/tst_supported_fs.c: Print usage on getopts error (Cyril)
* print TCONF when filesystem is not supported
* tst_test.sh: fix quiting test when no filesystem supported
* zram01.sh: use -f tmpfs in tst_supported_fs call
* new test lib/newlib_tests/shell/tst_all_filesystems_skip.sh
* add fuse to lib/newlib_tests/shell/tst_skip_filesystems.sh

new commits:
*  tst_supported_fs: Print TCONF if no filesystem supported

Petr Vorel (10):
  shell: Print mount command in tst_mount()
  shell API/tests: Require root for format/mount tests
  tst_supported_fs: Print TCONF if no filesystem supported
  tst_supported_fs: Implement skip list
  tst_supported_fs: Support skip list when query single fs
  shell: Add $TST_SKIP_FILESYSTEMS + tests
  tst_test.sh: Introduce TST_FS_TYPE_FUSE
  tst_test.sh: Add $TST_ALL_FILESYSTEMS
  shell: Add tests for TST_ALL_FILESYSTEMS=1
  df01.sh: Convert to TST_ALL_FILESYSTEMS=1

 doc/shell-test-api.txt                        |  13 +-
 include/tst_fs.h                              |  10 ++
 lib/newlib_tests/shell/tst_all_filesystems.sh |  27 +++
 .../shell/tst_all_filesystems_skip.sh         |  16 ++
 lib/newlib_tests/shell/tst_format_device.sh   |   1 +
 lib/newlib_tests/shell/tst_mount_device.sh    |   1 +
 .../shell/tst_mount_device_tmpfs.sh           |   1 +
 .../shell/tst_skip_filesystems.sh             |  35 ++++
 .../shell/tst_skip_filesystems_skip.sh        |  17 ++
 lib/tst_supported_fs_types.c                  |  17 ++
 runtest/commands                              |   8 +-
 runtest/smoketest                             |   2 +-
 testcases/commands/df/df01.sh                 |  32 +---
 .../kernel/device-drivers/zram/zram01.sh      |   3 +-
 testcases/lib/tst_supported_fs.c              |  74 +++++++--
 testcases/lib/tst_test.sh                     | 155 +++++++++++++-----
 testcases/misc/lvm/generate_lvm_runfile.sh    |   2 +-
 testcases/misc/lvm/prepare_lvm.sh             |   2 +-
 18 files changed, 326 insertions(+), 90 deletions(-)
 create mode 100755 lib/newlib_tests/shell/tst_all_filesystems.sh
 create mode 100755 lib/newlib_tests/shell/tst_all_filesystems_skip.sh
 create mode 100755 lib/newlib_tests/shell/tst_skip_filesystems.sh
 create mode 100755 lib/newlib_tests/shell/tst_skip_filesystems_skip.sh

-- 
2.37.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
