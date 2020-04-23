Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E211B5C40
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 15:17:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CEC2F3C2981
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 15:17:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 4E55B3C2951
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 15:16:46 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6503214016E4
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 15:16:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 24140AC26;
 Thu, 23 Apr 2020 13:16:42 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 23 Apr 2020 15:16:30 +0200
Message-Id: <20200423131632.20525-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v5 0/2] Route tests using netlink API (dst,gw,if)
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

Hi,

changes v4->v5:
* add implementation for changing interface
* lib: turn setup_addrinfo() into SAFE_GETADDRINFO() (1st commit)

route-change-netlink.c
* remove -l lhost parameter, interfaces are still created
* fixes required by Alexey:
  - use struct addrinfo. I still use char array for printing name, moved
	to the end (better for struct packing)
  - optimize char to numeric address conversion and string manipulation
	to get route destination (moved from test to setup, thus done fewer times)
  - use callback in save_item
  - change delimiter to ','

  - renamed functions

TODO:
* some further code cleanup is probably required.
* NS_TIMES=10 isn't really high enough.
shell tests could have 100 (there are some problems when higher than
300), but C tests could have it much higher (eg. 2000, but I've
tested it with the max 65535). Maybe there could be ROUTE_NS_TIMES and
ROUTE_NETLINK_NS_TIMES variables to not affect other tests which use
NS_TIMES.

Kind regards,
Petr


Petr Vorel (2):
  net: Add SAFE_GETADDRINFO()
  net/route: Add netlink based route change tests

 configure.ac                                  |   1 +
 include/mk/config.mk.in                       |   2 +
 include/tst_net.h                             |   9 +-
 include/tst_private.h                         |   1 +
 include/tst_safe_net.h                        |   6 +
 lib/tst_net.c                                 |  15 +
 m4/ltp-libmnl.m4                              |   8 +
 runtest/net_stress.route                      |   6 +
 testcases/network/netstress/netstress.c       |  20 +-
 testcases/network/stress/route/.gitignore     |   1 +
 .../network/stress/route/00_Descriptions.txt  |  40 +--
 testcases/network/stress/route/Makefile       |  30 +-
 .../network/stress/route/route-change-dst.sh  |   5 +-
 .../network/stress/route/route-change-gw.sh   |  18 +-
 .../network/stress/route/route-change-if.sh   |  61 +---
 .../stress/route/route-change-netlink-dst.sh  |  36 ++
 .../stress/route/route-change-netlink-gw.sh   |  31 ++
 .../stress/route/route-change-netlink-if.sh   |  38 +++
 .../stress/route/route-change-netlink.c       | 320 ++++++++++++++++++
 testcases/network/stress/route/route-lib.sh   | 104 +++++-
 travis/debian.cross-compile.sh                |   1 +
 travis/debian.sh                              |   1 +
 travis/fedora.sh                              |   3 +
 travis/tumbleweed.sh                          |   1 +
 24 files changed, 619 insertions(+), 139 deletions(-)
 create mode 100644 m4/ltp-libmnl.m4
 create mode 100644 testcases/network/stress/route/.gitignore
 create mode 100755 testcases/network/stress/route/route-change-netlink-dst.sh
 create mode 100755 testcases/network/stress/route/route-change-netlink-gw.sh
 create mode 100755 testcases/network/stress/route/route-change-netlink-if.sh
 create mode 100644 testcases/network/stress/route/route-change-netlink.c

-- 
2.26.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
