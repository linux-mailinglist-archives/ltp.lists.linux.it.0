Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 112511830B0
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:55:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80B2C3C5EA3
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 13:55:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 2D0CB3C5E5A
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:55:48 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B2ACF14016AD
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 13:55:47 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1483BABEF
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 12:55:47 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 12 Mar 2020 13:55:42 +0100
Message-Id: <20200312125545.3976-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/3] Increase bind() coverage - GH#538
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

This patchset adds a test that bind() opens sockets for incoming connections.
The test is split into two programs, one for stream-oriented sockets and
the other for datagram-oriented sockets.

This is a v3 resubmission of a patchset from last year. I had more important
patches to write for a while but I've dusted this code off now because I'll
need some of the helper functions in an upcoming CVE test.

Martin Doucha (3):
  Create separate .c file for include/tst_net.h
  Add socket address initialization functions to tst_net library
  Add connection tests for bind()

 include/tst_net.h                         | 136 ++------------
 lib/tst_net.c                             | 217 ++++++++++++++++++++++
 runtest/syscalls                          |   2 +
 testcases/kernel/syscalls/bind/.gitignore |   2 +
 testcases/kernel/syscalls/bind/Makefile   |   2 +
 testcases/kernel/syscalls/bind/bind04.c   | 172 +++++++++++++++++
 testcases/kernel/syscalls/bind/bind05.c   | 186 +++++++++++++++++++
 testcases/kernel/syscalls/bind/libbind.h  |  29 +++
 testcases/lib/tst_net_iface_prefix.c      |   9 +-
 testcases/lib/tst_net_ip_prefix.c         |  10 +-
 testcases/lib/tst_net_vars.c              |  64 +++----
 11 files changed, 671 insertions(+), 158 deletions(-)
 create mode 100644 lib/tst_net.c
 create mode 100644 testcases/kernel/syscalls/bind/bind04.c
 create mode 100644 testcases/kernel/syscalls/bind/bind05.c
 create mode 100644 testcases/kernel/syscalls/bind/libbind.h

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
