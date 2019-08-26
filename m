Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F4D9D134
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 16:01:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2EEB3C1C7B
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 16:01:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E6B853C0E60
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 16:01:25 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 82AED201346
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 16:01:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D95E9B066
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 14:01:24 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Aug 2019 16:01:19 +0200
Message-Id: <20190826140124.24681-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/5] Add basic test for uevent netlink socket
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

This patchset adds three basic test for uevent netlink socket.

v3:

Fixed all problems pointed out by Clemens.

v2:

Finished the input event test, now we match all events.

*** BLURB HERE ***

Cyril Hrubis (5):
  lib/tst_device: Export more functions.
  kernel/uevent: Add uevent01
  kernel/uevent: Add uevent02
  libs/libltpuinput: Add uinput library.
  kernel/uevent: Add uevent03

 include/tst_device.h                |   7 +
 include/tst_uinput.h                |  48 ++++++
 lib/tst_device.c                    |   8 +-
 libs/libltpuinput/Makefile          |  12 ++
 libs/libltpuinput/tst_uinput.c      | 143 ++++++++++++++++
 runtest/uevent                      |   3 +
 scenario_groups/default             |   1 +
 testcases/kernel/uevents/.gitignore |   3 +
 testcases/kernel/uevents/Makefile   |  10 ++
 testcases/kernel/uevents/uevent.h   | 176 ++++++++++++++++++++
 testcases/kernel/uevents/uevent01.c |  98 +++++++++++
 testcases/kernel/uevents/uevent02.c | 143 ++++++++++++++++
 testcases/kernel/uevents/uevent03.c | 248 ++++++++++++++++++++++++++++
 13 files changed, 896 insertions(+), 4 deletions(-)
 create mode 100644 include/tst_uinput.h
 create mode 100644 libs/libltpuinput/Makefile
 create mode 100644 libs/libltpuinput/tst_uinput.c
 create mode 100644 runtest/uevent
 create mode 100644 testcases/kernel/uevents/.gitignore
 create mode 100644 testcases/kernel/uevents/Makefile
 create mode 100644 testcases/kernel/uevents/uevent.h
 create mode 100644 testcases/kernel/uevents/uevent01.c
 create mode 100644 testcases/kernel/uevents/uevent02.c
 create mode 100644 testcases/kernel/uevents/uevent03.c

-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
