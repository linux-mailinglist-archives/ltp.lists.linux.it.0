Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A55A63C4631
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 11:10:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FFAA3C6732
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 11:10:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 52B7F3C75ED
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 11:10:21 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D14D76008DE
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 11:10:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1626081019; i=@fujitsu.com;
 bh=yEjuU4tPIAmdECEBR0nHHpODvQuAdvJQUD2wVbSwd8E=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=DJ+iZHx4D0NoXn2vtB1xDwXyQKZFNYugCWu3mEW+/m8GsATs6lL5TBmyifNf7MUvj
 hP0pOMd+tqTq3m3TAiEtuW6rHrcRu+SIGDjOETV67o1dMq5pftVEcYXpz4+m+HVNb5
 pnP3spgsJ+3XjvbJATypn6CdCsbcrQbmYI+HTHwXrlGQoUgyXT8ZUfNZtGDUjVbWXY
 5wfYGmt5bTRfBytNtz+eqW1EY28xJ76V1k0IHlil8xSkIPKjtsI/YOiq19Ap/fxVeY
 u6+++QRKIwHfqodI26fgKgQqgJJXfKtDBH0x8ll9t4Wn12j9iOAkjcz5kT8PscTNTh
 xGP2wrFlDnOoA==
Received: from [100.112.195.193] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 2A/41-07274-AF60CE06;
 Mon, 12 Jul 2021 09:10:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8MxVfcX25s
 Eg6Vd0hb79s9ntFjxfQejA5PHkRer2T32/V7HGsAUxZqZl5RfkcCa0fFvG1NBy0zGik09Z5gb
 GA90MnYxcnEICbQxSXza2soK4exllDhweDtTFyMnB5uApsSzzgXMILaIgKJE14wb7CA2s4Ctx
 POHl9hAbGEBV4mXDe2MIDaLgKrEob1/WUFsXgFPiS2nj4DVSAgoSEx5+B5oDgcHp4CXxPZD8S
 BhIYFaiWebprNAlAtKnJz5hAVivITEwRcvmCFaFSUudXxjhLArJfbM6meawMg/C0nLLCQtCxi
 ZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6RpamgCxkV5ilW6iXmqpbnlqcYmuoV5iebFecWVuck6K
 Xl5qySZGYJimFBw6sINx2ZsPeocYJTmYlER5dS6/ThDiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
 WvB+iZBSLAoNT21Ii0zBxgzMGkJDh4lEV4GBqA0b3FBYm5xZjpE6hSjopQ471wWoIQASCKjNA
 +uDRanlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8+4AmcKTmVcCN/0V0GImoMWFO16CLC5
 JREhJNTBtKb39/7JLsezj7/InbtllH9nx/vLpQ0ddz/hV3c66ab91mrwH55vXWjau/XLK9bdd
 HrozfTvS6877p/HTniB7Ng092SW1MZG3brgIzn7+7qFSi+Tm9DR/i2zhW3fuxjBv4xCa3ijf6
 L1QVWJv5guv11lTT+vNqV/3T1Ln7+rWc/+yf0ZY1Hz8qH1h2dPPqYYXov/OKd1/Jld7lo8o99
 6N7fN0s6eXXvnZ4/n836T962K8T25ie3U1r0dserO/b+1bx7uF1UZlXuGxLlkqP4qPh/z289r
 oevl0RNiypdEce8I2TnmqrcS++2rIl8uPJDN+rm/48/3blGPm05TknkiaSWwvSH8749Qrv6iM
 yNptSizFGYmGWsxFxYkA3E/dyk4DAAA=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-10.tower-267.messagelabs.com!1626081018!240200!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4094 invoked from network); 12 Jul 2021 09:10:18 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
 by server-10.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2021 09:10:18 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com
 [10.182.185.121])
 by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16C9AGeC011444
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Mon, 12 Jul 2021 10:10:17 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 12 Jul 2021 10:10:13 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <aleksei.kodanev@bell-sw.com>
Date: Mon, 12 Jul 2021 17:10:29 +0800
Message-ID: <1626081029-11258-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626081029-11258-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <ae2bc43c-1745-a0f1-67a7-b9d5a6691404@bell-sw.com>
 <1626081029-11258-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/2] testcase/network: Remove useless MAKE_TARGETS
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/network/dhcp/Makefile                           | 2 --
 testcases/network/iproute/Makefile                        | 2 --
 testcases/network/multicast/mc_cmds/Makefile              | 2 --
 testcases/network/nfs/nfsstat01/Makefile                  | 2 --
 testcases/network/rpc/basic_tests/rpcinfo/Makefile        | 2 --
 testcases/network/rpc/basic_tests/rup/Makefile            | 2 --
 testcases/network/rpc/basic_tests/rusers/Makefile         | 2 --
 testcases/network/rpc/rpc-tirpc/Makefile                  | 2 --
 testcases/network/stress/broken_ip/Makefile               | 2 --
 testcases/network/stress/dns/Makefile                     | 2 --
 testcases/network/stress/ftp/Makefile                     | 2 --
 testcases/network/stress/http/Makefile                    | 2 --
 testcases/network/stress/icmp/multi-diffip/Makefile       | 2 --
 testcases/network/stress/icmp/multi-diffnic/Makefile      | 2 --
 testcases/network/stress/interface/Makefile               | 2 --
 testcases/network/stress/multicast/grp-operation/Makefile | 2 --
 testcases/network/stress/multicast/packet-flood/Makefile  | 2 --
 testcases/network/stress/multicast/query-flood/Makefile   | 2 --
 testcases/network/stress/tcp/multi-diffip/Makefile        | 2 --
 testcases/network/stress/tcp/multi-diffnic/Makefile       | 2 --
 testcases/network/stress/tcp/multi-diffport/Makefile      | 2 --
 testcases/network/stress/tcp/multi-sameport/Makefile      | 2 --
 testcases/network/stress/tcp/uni-basic/Makefile           | 2 --
 testcases/network/stress/tcp/uni-dsackoff/Makefile        | 2 --
 testcases/network/stress/tcp/uni-pktlossdup/Makefile      | 2 --
 testcases/network/stress/tcp/uni-sackoff/Makefile         | 2 --
 testcases/network/stress/tcp/uni-smallsend/Makefile       | 2 --
 testcases/network/stress/tcp/uni-tso/Makefile             | 2 --
 testcases/network/stress/tcp/uni-winscale/Makefile        | 1 -
 testcases/network/stress/udp/multi-diffip/Makefile        | 2 --
 testcases/network/stress/udp/multi-diffnic/Makefile       | 2 --
 testcases/network/stress/udp/multi-diffport/Makefile      | 2 --
 testcases/network/stress/udp/uni-basic/Makefile           | 2 --
 testcases/network/tcp_cmds/host/Makefile                  | 2 --
 testcases/network/tcp_cmds/ipneigh/Makefile               | 2 --
 testcases/network/tcp_cmds/netstat/Makefile               | 2 --
 testcases/network/tcp_cmds/ping/Makefile                  | 2 --
 testcases/network/tcp_cmds/tcpdump/Makefile               | 2 --
 testcases/network/tcp_cmds/telnet/Makefile                | 2 --
 testcases/network/xinetd/Makefile                         | 2 --
 40 files changed, 79 deletions(-)

diff --git a/testcases/network/dhcp/Makefile b/testcases/network/dhcp/Makefile
index 3750e698b..399301910 100644
--- a/testcases/network/dhcp/Makefile
+++ b/testcases/network/dhcp/Makefile
@@ -8,6 +8,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= dhcp_lib.sh dhcpd_tests.sh dnsmasq_tests.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/iproute/Makefile b/testcases/network/iproute/Makefile
index a18c7099e..30d8e11ed 100644
--- a/testcases/network/iproute/Makefile
+++ b/testcases/network/iproute/Makefile
@@ -8,6 +8,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= ip_tests.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/multicast/mc_cmds/Makefile b/testcases/network/multicast/mc_cmds/Makefile
index f4142ad0c..4d9e1bea8 100644
--- a/testcases/network/multicast/mc_cmds/Makefile
+++ b/testcases/network/multicast/mc_cmds/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS	:= mc_cmds.sh
 
-MAKE_TARGETS	:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/nfs/nfsstat01/Makefile b/testcases/network/nfs/nfsstat01/Makefile
index 6c6c4fd9c..cfde9aee9 100644
--- a/testcases/network/nfs/nfsstat01/Makefile
+++ b/testcases/network/nfs/nfsstat01/Makefile
@@ -8,6 +8,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= nfsstat01
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/rpc/basic_tests/rpcinfo/Makefile b/testcases/network/rpc/basic_tests/rpcinfo/Makefile
index 6b844038b..8a8a11402 100644
--- a/testcases/network/rpc/basic_tests/rpcinfo/Makefile
+++ b/testcases/network/rpc/basic_tests/rpcinfo/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= rpcinfo01.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/rpc/basic_tests/rup/Makefile b/testcases/network/rpc/basic_tests/rup/Makefile
index a4dee681a..e0ebaaa58 100644
--- a/testcases/network/rpc/basic_tests/rup/Makefile
+++ b/testcases/network/rpc/basic_tests/rup/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= rup01.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/rpc/basic_tests/rusers/Makefile b/testcases/network/rpc/basic_tests/rusers/Makefile
index b5f69f596..345365171 100644
--- a/testcases/network/rpc/basic_tests/rusers/Makefile
+++ b/testcases/network/rpc/basic_tests/rusers/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= rusers01.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/rpc/rpc-tirpc/Makefile b/testcases/network/rpc/rpc-tirpc/Makefile
index 4fb080965..d2e1318c6 100644
--- a/testcases/network/rpc/rpc-tirpc/Makefile
+++ b/testcases/network/rpc/rpc-tirpc/Makefile
@@ -7,6 +7,4 @@ include	$(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= rpc_test.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_trunk_target.mk
diff --git a/testcases/network/stress/broken_ip/Makefile b/testcases/network/stress/broken_ip/Makefile
index e530c7c13..0a5207a94 100644
--- a/testcases/network/stress/broken_ip/Makefile
+++ b/testcases/network/stress/broken_ip/Makefile
@@ -8,6 +8,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= broken_ip*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/dns/Makefile b/testcases/network/stress/dns/Makefile
index a345f12fa..4c34ee24b 100644
--- a/testcases/network/stress/dns/Makefile
+++ b/testcases/network/stress/dns/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= *.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/ftp/Makefile b/testcases/network/stress/ftp/Makefile
index 38cbd13a5..9257ef9c6 100644
--- a/testcases/network/stress/ftp/Makefile
+++ b/testcases/network/stress/ftp/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= *.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/http/Makefile b/testcases/network/stress/http/Makefile
index 4529865e1..f354293b0 100644
--- a/testcases/network/stress/http/Makefile
+++ b/testcases/network/stress/http/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= *.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/icmp/multi-diffip/Makefile b/testcases/network/stress/icmp/multi-diffip/Makefile
index d0bfb3701..5fd73aadf 100644
--- a/testcases/network/stress/icmp/multi-diffip/Makefile
+++ b/testcases/network/stress/icmp/multi-diffip/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= icmp*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/icmp/multi-diffnic/Makefile b/testcases/network/stress/icmp/multi-diffnic/Makefile
index 5eb10125f..63389ab55 100644
--- a/testcases/network/stress/icmp/multi-diffnic/Makefile
+++ b/testcases/network/stress/icmp/multi-diffnic/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= icmp*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/interface/Makefile b/testcases/network/stress/interface/Makefile
index 4ae3e7b6d..7ebeec142 100644
--- a/testcases/network/stress/interface/Makefile
+++ b/testcases/network/stress/interface/Makefile
@@ -8,6 +8,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= *.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/multicast/grp-operation/Makefile b/testcases/network/stress/multicast/grp-operation/Makefile
index a31290115..267dca06a 100644
--- a/testcases/network/stress/multicast/grp-operation/Makefile
+++ b/testcases/network/stress/multicast/grp-operation/Makefile
@@ -8,6 +8,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= mcast*.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/multicast/packet-flood/Makefile b/testcases/network/stress/multicast/packet-flood/Makefile
index e99a8efce..e6c8115f4 100644
--- a/testcases/network/stress/multicast/packet-flood/Makefile
+++ b/testcases/network/stress/multicast/packet-flood/Makefile
@@ -8,6 +8,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= mcast*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/multicast/query-flood/Makefile b/testcases/network/stress/multicast/query-flood/Makefile
index e99a8efce..e6c8115f4 100644
--- a/testcases/network/stress/multicast/query-flood/Makefile
+++ b/testcases/network/stress/multicast/query-flood/Makefile
@@ -8,6 +8,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= mcast*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/tcp/multi-diffip/Makefile b/testcases/network/stress/tcp/multi-diffip/Makefile
index ccf58633d..727b2ccb7 100644
--- a/testcases/network/stress/tcp/multi-diffip/Makefile
+++ b/testcases/network/stress/tcp/multi-diffip/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= tcp*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/tcp/multi-diffnic/Makefile b/testcases/network/stress/tcp/multi-diffnic/Makefile
index b0894ac67..936562841 100644
--- a/testcases/network/stress/tcp/multi-diffnic/Makefile
+++ b/testcases/network/stress/tcp/multi-diffnic/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= tcp*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/tcp/multi-diffport/Makefile b/testcases/network/stress/tcp/multi-diffport/Makefile
index cfd508502..4f1b77beb 100644
--- a/testcases/network/stress/tcp/multi-diffport/Makefile
+++ b/testcases/network/stress/tcp/multi-diffport/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= tcp*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/tcp/multi-sameport/Makefile b/testcases/network/stress/tcp/multi-sameport/Makefile
index dd6f269e3..be2472f92 100644
--- a/testcases/network/stress/tcp/multi-sameport/Makefile
+++ b/testcases/network/stress/tcp/multi-sameport/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= tcp*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/tcp/uni-basic/Makefile b/testcases/network/stress/tcp/uni-basic/Makefile
index 310e8f047..f5e692091 100644
--- a/testcases/network/stress/tcp/uni-basic/Makefile
+++ b/testcases/network/stress/tcp/uni-basic/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= tcp*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/tcp/uni-dsackoff/Makefile b/testcases/network/stress/tcp/uni-dsackoff/Makefile
index 4b858b1d6..f8fe935b9 100644
--- a/testcases/network/stress/tcp/uni-dsackoff/Makefile
+++ b/testcases/network/stress/tcp/uni-dsackoff/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= tcp*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/tcp/uni-pktlossdup/Makefile b/testcases/network/stress/tcp/uni-pktlossdup/Makefile
index d6511f753..10525cf3c 100644
--- a/testcases/network/stress/tcp/uni-pktlossdup/Makefile
+++ b/testcases/network/stress/tcp/uni-pktlossdup/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= tcp*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/tcp/uni-sackoff/Makefile b/testcases/network/stress/tcp/uni-sackoff/Makefile
index ef469d633..0d8735872 100644
--- a/testcases/network/stress/tcp/uni-sackoff/Makefile
+++ b/testcases/network/stress/tcp/uni-sackoff/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= tcp*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/tcp/uni-smallsend/Makefile b/testcases/network/stress/tcp/uni-smallsend/Makefile
index ba5fbbb43..de4bb0cd5 100644
--- a/testcases/network/stress/tcp/uni-smallsend/Makefile
+++ b/testcases/network/stress/tcp/uni-smallsend/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= tcp*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/tcp/uni-tso/Makefile b/testcases/network/stress/tcp/uni-tso/Makefile
index 7aafd1613..cd70ed22f 100644
--- a/testcases/network/stress/tcp/uni-tso/Makefile
+++ b/testcases/network/stress/tcp/uni-tso/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= tcp*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/tcp/uni-winscale/Makefile b/testcases/network/stress/tcp/uni-winscale/Makefile
index 895848604..b29a4b2ef 100644
--- a/testcases/network/stress/tcp/uni-winscale/Makefile
+++ b/testcases/network/stress/tcp/uni-winscale/Makefile
@@ -26,6 +26,5 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= tcp*
 
-MAKE_TARGETS		:=
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/udp/multi-diffip/Makefile b/testcases/network/stress/udp/multi-diffip/Makefile
index 654704021..2592c71b1 100644
--- a/testcases/network/stress/udp/multi-diffip/Makefile
+++ b/testcases/network/stress/udp/multi-diffip/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= udp*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/udp/multi-diffnic/Makefile b/testcases/network/stress/udp/multi-diffnic/Makefile
index d542555a2..5bc2107a7 100644
--- a/testcases/network/stress/udp/multi-diffnic/Makefile
+++ b/testcases/network/stress/udp/multi-diffnic/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= udp*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/udp/multi-diffport/Makefile b/testcases/network/stress/udp/multi-diffport/Makefile
index 66714c95c..118e54cb6 100644
--- a/testcases/network/stress/udp/multi-diffport/Makefile
+++ b/testcases/network/stress/udp/multi-diffport/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= udp*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/stress/udp/uni-basic/Makefile b/testcases/network/stress/udp/uni-basic/Makefile
index 4f9c91e01..7f6ae674d 100644
--- a/testcases/network/stress/udp/uni-basic/Makefile
+++ b/testcases/network/stress/udp/uni-basic/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= udp*
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/tcp_cmds/host/Makefile b/testcases/network/tcp_cmds/host/Makefile
index 53eed9861..453951e0d 100644
--- a/testcases/network/tcp_cmds/host/Makefile
+++ b/testcases/network/tcp_cmds/host/Makefile
@@ -8,6 +8,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= host01.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/tcp_cmds/ipneigh/Makefile b/testcases/network/tcp_cmds/ipneigh/Makefile
index 64cc87b92..cf3f731a8 100644
--- a/testcases/network/tcp_cmds/ipneigh/Makefile
+++ b/testcases/network/tcp_cmds/ipneigh/Makefile
@@ -8,6 +8,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= ipneigh01.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/tcp_cmds/netstat/Makefile b/testcases/network/tcp_cmds/netstat/Makefile
index 9b46ebb18..b29bea50c 100644
--- a/testcases/network/tcp_cmds/netstat/Makefile
+++ b/testcases/network/tcp_cmds/netstat/Makefile
@@ -8,6 +8,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= netstat01.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/tcp_cmds/ping/Makefile b/testcases/network/tcp_cmds/ping/Makefile
index f8293e573..ed00eb16a 100644
--- a/testcases/network/tcp_cmds/ping/Makefile
+++ b/testcases/network/tcp_cmds/ping/Makefile
@@ -10,6 +10,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 INSTALL_TARGETS		:= ping01.sh \
 			   ping02.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/tcp_cmds/tcpdump/Makefile b/testcases/network/tcp_cmds/tcpdump/Makefile
index ed06cb81f..747d1e5e9 100644
--- a/testcases/network/tcp_cmds/tcpdump/Makefile
+++ b/testcases/network/tcp_cmds/tcpdump/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= tcpdump01.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/tcp_cmds/telnet/Makefile b/testcases/network/tcp_cmds/telnet/Makefile
index fefdf6be8..90e879de2 100644
--- a/testcases/network/tcp_cmds/telnet/Makefile
+++ b/testcases/network/tcp_cmds/telnet/Makefile
@@ -26,6 +26,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= telnet01.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/network/xinetd/Makefile b/testcases/network/xinetd/Makefile
index f0ddf1446..b789b2a3a 100644
--- a/testcases/network/xinetd/Makefile
+++ b/testcases/network/xinetd/Makefile
@@ -8,6 +8,4 @@ include $(top_srcdir)/include/mk/env_pre.mk
 
 INSTALL_TARGETS		:= xinetd_tests.sh
 
-MAKE_TARGETS		:=
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
