Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CA119DC2C
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 18:54:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17BF43C2FAE
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 18:54:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8FE483C2F91
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 18:54:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 05C7C140113A
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 18:54:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BDC4CAA7C;
 Fri,  3 Apr 2020 16:54:38 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  3 Apr 2020 18:54:30 +0200
Message-Id: <20200403165432.19358-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v3 0/2] Route tests using netlink API (dst,gw)
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

another attempt to add netlink C based tests.

This lazy approach does not create end point on rhost, thus port is
unreachable:

17:26:16.235937 IP 10.23.0.1 > 10.23.1.1: ICMP 10.23.0.1 udp port 49893 unreachable, length 44

Compare shell based tests:
17:26:32.879209 IP 10.23.1.1 > 10.23.0.1: ICMP echo request, id 17161, seq 1, length 64
17:26:32.879244 IP 10.23.0.1 > 10.23.1.1: ICMP echo reply, id 17161, seq 1, length 64

I used this approach as we agreed that both approaches are useful.

BTW I guess NS_TIMES=10 is not really much for route stress tests.
Maybe we want to increase it again. If yes, not sure if there should be
special variable just for route tests.

Maybe route-change-netlink.c should just exit 0 or 1, to get rid of
verbose output:

route-change-netlink-dst 1 TINFO: initialize 'lhost' 'ltp_ns_veth2' interface
route-change-netlink-dst 1 TINFO: add local addr 10.0.0.2/24
route-change-netlink-dst 1 TINFO: add local addr fd00:1:1:1::2/64
route-change-netlink-dst 1 TINFO: initialize 'rhost' 'ltp_ns_veth1' interface
route-change-netlink-dst 1 TINFO: add remote addr 10.0.0.1/24
route-change-netlink-dst 1 TINFO: add remote addr fd00:1:1:1::1/64
route-change-netlink-dst 1 TINFO: Network config (local -- remote):
route-change-netlink-dst 1 TINFO: ltp_ns_veth2 -- ltp_ns_veth1
route-change-netlink-dst 1 TINFO: 10.0.0.2/24 -- 10.0.0.1/24
route-change-netlink-dst 1 TINFO: fd00:1:1:1::2/64 -- fd00:1:1:1::1/64
route-change-netlink-dst 1 TINFO: timeout per run is 0h 5m 0s
route-change-netlink-dst 1 TINFO: change IPv4 route destination 10 times
tst_test.c:1239: INFO: Timeout per run is 0h 05m 00s
route-change-netlink.c:311: INFO: adding and deleting route with different destination 10 times
route-change-netlink.c:336: PASS: routes created and deleted

Summary:
passed   1
failed   0
skipped  0
warnings 0
route-change-netlink-dst 1 TPASS: route-change-netlink -c 10 -d ltp_ns_veth2 -p 49075 -l 10.0.0.2 -r '10.23.4.1^10.23.3.1^10.23.2.1^10.23.1.1^10.23.0.1^' passed as expected
route-change-netlink-dst 2 TINFO: initialize 'lhost' 'ltp_ns_veth2' interface
route-change-netlink-dst 2 TINFO: add local addr 10.0.0.2/24
route-change-netlink-dst 2 TINFO: add local addr fd00:1:1:1::2/64
route-change-netlink-dst 2 TINFO: initialize 'rhost' 'ltp_ns_veth1' interface
route-change-netlink-dst 2 TINFO: add remote addr 10.0.0.1/24
route-change-netlink-dst 2 TINFO: add remote addr fd00:1:1:1::1/64

Summary:
passed   1
failed   0
skipped  0
warnings 0


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
 .../network/stress/route/route-change-gw.sh   |  10 +-
 .../network/stress/route/route-change-if.sh   |   1 +
 .../stress/route/route-change-netlink-dst.sh  |  33 ++
 .../stress/route/route-change-netlink-gw.sh   |  30 ++
 .../stress/route/route-change-netlink.c       | 348 ++++++++++++++++++
 testcases/network/stress/route/route-lib.sh   |  34 +-
 travis/debian.cross-compile.sh                |   1 +
 travis/debian.sh                              |   1 +
 travis/fedora.sh                              |   3 +
 travis/tumbleweed.sh                          |   1 +
 22 files changed, 518 insertions(+), 74 deletions(-)
 create mode 100644 m4/ltp-libmnl.m4
 create mode 100644 testcases/network/stress/route/.gitignore
 create mode 100755 testcases/network/stress/route/route-change-netlink-dst.sh
 create mode 100755 testcases/network/stress/route/route-change-netlink-gw.sh
 create mode 100644 testcases/network/stress/route/route-change-netlink.c

-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
