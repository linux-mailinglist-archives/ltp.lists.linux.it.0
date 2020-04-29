Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D867A1BE747
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 21:24:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C6013C28F0
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 21:24:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 0A12A3C5ED3
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 21:23:50 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CB95660098A
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 21:23:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0ABF0AD88;
 Wed, 29 Apr 2020 19:23:45 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 29 Apr 2020 21:23:37 +0200
Message-Id: <20200429192340.14252-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v6 0/3]	Route tests using netlink API (dst,gw,if)
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

Hi Alexey, Cyril,

changes v5->v6:

* new commit: Add $ROUTE_CHANGE_IP and $ROUTE_CHANGE_NETLINK variables
(increase, but better not affect $NS_TIMES as used by other tests)

* route-change-netlink.c: Better error handling with
brk_on_route_error() (Alexey), use global prefix
variable in rtnl_route().

Kind regards,
Petr

Petr Vorel (3):
  net: Add SAFE_GETADDRINFO()
  net/route: Add netlink based route change tests
  route: Increase default loop values

 configure.ac                                  |   1 +
 include/mk/config.mk.in                       |   2 +
 include/tst_net.h                             |   9 +-
 include/tst_private.h                         |   1 +
 include/tst_safe_net.h                        |   6 +
 lib/tst_net.c                                 |  15 +
 m4/ltp-libmnl.m4                              |   8 +
 runtest/net_stress.route                      |   6 +
 testcases/lib/tst_net.sh                      |   2 +
 testcases/network/netstress/netstress.c       |  20 +-
 testcases/network/stress/route/.gitignore     |   1 +
 .../network/stress/route/00_Descriptions.txt  |  40 +--
 testcases/network/stress/route/Makefile       |  30 +-
 .../network/stress/route/route-change-dst.sh  |   7 +-
 .../network/stress/route/route-change-gw.sh   |  14 +-
 .../network/stress/route/route-change-if.sh   |  59 +---
 .../stress/route/route-change-netlink-dst.sh  |  36 ++
 .../stress/route/route-change-netlink-gw.sh   |  33 ++
 .../stress/route/route-change-netlink-if.sh   |  39 +++
 .../stress/route/route-change-netlink.c       | 327 ++++++++++++++++++
 testcases/network/stress/route/route-lib.sh   | 103 +++++-
 travis/debian.cross-compile.sh                |   1 +
 travis/debian.sh                              |   1 +
 travis/fedora.sh                              |   3 +
 travis/tumbleweed.sh                          |   1 +
 25 files changed, 632 insertions(+), 133 deletions(-)
 create mode 100644 m4/ltp-libmnl.m4
 create mode 100644 testcases/network/stress/route/.gitignore
 create mode 100755 testcases/network/stress/route/route-change-netlink-dst.sh
 create mode 100755 testcases/network/stress/route/route-change-netlink-gw.sh
 create mode 100755 testcases/network/stress/route/route-change-netlink-if.sh
 create mode 100644 testcases/network/stress/route/route-change-netlink.c

-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
