Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D49D36B245
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 13:19:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1150F3C66ED
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 13:19:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 32E7C3C5E5D
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 13:19:20 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AD0996002D4
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 13:19:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2AE4AD69
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 11:19:18 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Apr 2021 13:19:14 +0200
Message-Id: <20210426111918.4304-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 0/4] RTNetlink and network device management library
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

This patchset is still a work in progress and I've sent it mainly to open
discussion about network management API design. SAFE_REALLOC() and SAFE_RECV()
patches are trivial and can be merge right away, though.

The network management API has two separate parts:
- rtnetlink library (patch 3)
- device management library (patch 4)

The rtnetlink API is stateful. First you need to create a netlink context
(netlink socket with dynamic message buffer), then you can add arbitrary list
of messages and attributes and send them all at once. If you don't need to
process any complex response, you can use the shorthand send function which
automatically receives and validates ACKs for each sent message. You can reuse
the same context for multiple send calls.

Device management API is stateless, only one function call per operation.

Example how to use rtnetlink API (add new IPv4 address to eth0):
================================================================

struct nlmsghdr header = {
	.nlmsg_type = RTM_NEWADDR,
	.nlmsg_flags = NLM_F_REQUEST | NLM_F_CREATE | NLM_F_EXCL | NLM_F_ACK
};
struct ifaddrmsg info = {
	.ifa_family = AF_INET,
	.ifa_prefix = 24,
	.ifa_index = eth0_index
};
in_addr_t addr = inet_addr("192.168.0.1");
ctx = RTNL_CREATE_CONTEXT();
RTNL_ADD_MESSAGE(ctx, &header, &info, sizeof(info));
RTNL_ADD_ATTR(ctx, IFA_LOCAL, &addr, sizeof(addr));
if (!RTNL_SEND_VERIFY(ctx))
	// error handling
RTNL_FREE_CONTEXT(ctx);


Example how to create and configure veth pair using device management API:
==========================================================================

CREATE_VETH_PAIR("veth0", "veth1");
NETDEVICE_ADD_ADDRESS_INET("veth0", inet_addr("192.168.0.1"));
NETDEVICE_ADD_ADDRESS_INET("veth1", inet_addr("192.168.0.2"));
NETDEVICE_ACTIVATE("veth0", 1);
NETDEVICE_ACTIVATE("veth1", 1);
NETDEVICE_ADD_ROUTE_INET("veth0", 0, 0, inet_addr("192.168.1.0"), 24, 0);


Martin Doucha (4):
  Add SAFE_REALLOC() helper function to LTP library
  Add SAFE_RECV() helper function to LTP library
  RFC: Add rtnetlink helper library
  RFC: Add helper functions for managing network interfaces

 include/safe_net_fn.h     |   3 +
 include/tst_netdevice.h   | 120 +++++++++
 include/tst_rtnetlink.h   | 105 ++++++++
 include/tst_safe_macros.h |   5 +
 include/tst_safe_net.h    |   3 +
 lib/safe_net.c            |  25 ++
 lib/tst_netdevice.c       | 506 ++++++++++++++++++++++++++++++++++++++
 lib/tst_rtnetlink.c       | 399 ++++++++++++++++++++++++++++++
 lib/tst_safe_macros.c     |  15 ++
 9 files changed, 1181 insertions(+)
 create mode 100644 include/tst_netdevice.h
 create mode 100644 include/tst_rtnetlink.h
 create mode 100644 lib/tst_netdevice.c
 create mode 100644 lib/tst_rtnetlink.c

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
