Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE271A8291
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 17:24:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BEA4D3C2B5B
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 17:24:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id F07C83C2B62
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 17:24:22 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5711B200986
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 17:24:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D4D17AD57;
 Tue, 14 Apr 2020 15:24:17 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 14 Apr 2020 17:24:10 +0200
Message-Id: <20200414152412.8278-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/2] Route tests using netlink API (dst,gw)
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

Hi Alexey,

Changes v3->v4:
* fix TCONF not handled in EXPECT_PASS()
* use ROUTE_RHOST_PORT variable for port
* use TST_SETUP="setup_gw" in route-change-gw.sh
* fix double TINFO report in route-change-gw.sh and route-change-netlink-gw.sh

For fixing TCONF not handled in EXPECT_PASS() I copy pasted solution
from tst_netload(). Discussing this with Cyril I'm planning to implement
his tip to use mapped memory to increment counter also in shell API.
That should simplify shell API as there will be just single "Summary:"
report.

Kind regards,
Petr

Petr Vorel (2):
  net: Move setup_addrinfo() into tst_net.h
  net/route: Add netlink based route change gw/dest tests

 configure.ac                                  |   1 +
 include/mk/config.mk.in                       |   2 +
 include/tst_net.h                             |   9 +-
 include/tst_private.h                         |   1 +
 lib/tst_net.c                                 |  14 +
 m4/ltp-libmnl.m4                              |   8 +
 runtest/net_stress.route                      |   4 +
 testcases/network/netstress/netstress.c       |  20 +-
 testcases/network/stress/route/.gitignore     |   1 +
 .../network/stress/route/00_Descriptions.txt  |  39 +-
 testcases/network/stress/route/Makefile       |  30 +-
 .../network/stress/route/route-change-dst.sh  |   1 +
 .../network/stress/route/route-change-gw.sh   |  15 +-
 .../network/stress/route/route-change-if.sh   |   1 +
 .../stress/route/route-change-netlink-dst.sh  |  33 ++
 .../stress/route/route-change-netlink-gw.sh   |  28 ++
 .../stress/route/route-change-netlink.c       | 348 ++++++++++++++++++
 testcases/network/stress/route/route-lib.sh   |  44 ++-
 travis/debian.cross-compile.sh                |   1 +
 travis/debian.sh                              |   1 +
 travis/fedora.sh                              |   3 +
 travis/tumbleweed.sh                          |   1 +
 22 files changed, 526 insertions(+), 79 deletions(-)
 create mode 100644 m4/ltp-libmnl.m4
 create mode 100644 testcases/network/stress/route/.gitignore
 create mode 100755 testcases/network/stress/route/route-change-netlink-dst.sh
 create mode 100755 testcases/network/stress/route/route-change-netlink-gw.sh
 create mode 100644 testcases/network/stress/route/route-change-netlink.c

-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
