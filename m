Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 585711AA108
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 14:42:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B5153C64F3
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 14:42:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E15403C2AF5
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 14:41:59 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6431160170E
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 14:41:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E882EAD2B
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 12:41:57 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 15 Apr 2020 14:41:54 +0200
Message-Id: <20200415124157.10484-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v6 0/3] LVM support scripts for OpenQA
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

The old support script for LVM tests (testscripts/ltpfslvm.sh) doesn't work
very well with external testing tools so LVM tests currently cannot be run
in OpenQA. Create new LVM support scripts that focus exclusively on setup
and cleanup. One of the scripts also generates a new LVM runfile that'll test
only file systems supported by the test machine.

Martin Doucha (3):
  Allow acquiring multiple loop devices
  Add LVM support scripts
  Skip Btrfs in LVM stress tests

 include/old/old_device.h                   | 15 +++-
 lib/tst_device.c                           | 36 ++++++----
 testcases/lib/tst_device.c                 | 14 ++--
 testcases/misc/lvm/Makefile                |  9 +++
 testcases/misc/lvm/cleanup_lvm.sh          | 34 +++++++++
 testcases/misc/lvm/datafiles/Makefile      |  8 +++
 testcases/misc/lvm/datafiles/runfile.tpl   | 36 ++++++++++
 testcases/misc/lvm/generate_lvm_runfile.sh | 30 ++++++++
 testcases/misc/lvm/prepare_lvm.sh          | 83 ++++++++++++++++++++++
 testscripts/lvmtest.sh                     | 18 +++++
 10 files changed, 264 insertions(+), 19 deletions(-)
 create mode 100644 testcases/misc/lvm/Makefile
 create mode 100755 testcases/misc/lvm/cleanup_lvm.sh
 create mode 100644 testcases/misc/lvm/datafiles/Makefile
 create mode 100644 testcases/misc/lvm/datafiles/runfile.tpl
 create mode 100755 testcases/misc/lvm/generate_lvm_runfile.sh
 create mode 100755 testcases/misc/lvm/prepare_lvm.sh
 create mode 100755 testscripts/lvmtest.sh

-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
