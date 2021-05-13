Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F97B37F2F1
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 08:23:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DE3F3C4AF9
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 08:23:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2FBD53C2B3A
 for <ltp@lists.linux.it>; Thu, 13 May 2021 08:23:53 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A922F10007C1
 for <ltp@lists.linux.it>; Thu, 13 May 2021 08:23:51 +0200 (CEST)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FghNS37M3zQmjm
 for <ltp@lists.linux.it>; Thu, 13 May 2021 14:20:24 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Thu, 13 May 2021 14:23:42 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 13 May 2021 14:23:39 +0800
Message-ID: <20210513062341.83852-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2 v2] Add SPDX in Makefile and use tabs instead of
 spaces
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
Reply-To: 20210512084904.35159-1-xieziyao@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

v1->v2:
1. Fix errors in patch application;
2. Add unrelated changes in replacing spaces with tabs into a separate patch.

Xie Ziyao (2):
  Makefile: Use SPDX in Makefile
  open_posix_testsuite/Makefile: Use tabs instead of spaces

 doc/Makefile                                  | 22 ++-------------
 include/Makefile                              | 22 ++-------------
 lib/Makefile                                  | 22 ++-------------
 lib/newlib_tests/Makefile                     |  1 +
 testcases/Makefile                            | 27 +++----------------
 testcases/commands/Makefile                   | 24 +++--------------
 testcases/commands/ar/Makefile                | 22 ++-------------
 testcases/commands/cp/Makefile                | 22 ++-------------
 testcases/commands/cpio/Makefile              | 22 ++-------------
 testcases/commands/df/Makefile                | 23 +++-------------
 testcases/commands/du/Makefile                | 18 +------------
 testcases/commands/eject/Makefile             | 22 ++-------------
 testcases/commands/file/Makefile              | 22 ++-------------
 testcases/commands/gdb/Makefile               | 20 ++------------
 testcases/commands/gzip/Makefile              | 22 ++-------------
 testcases/commands/insmod/Makefile            | 17 +++---------
 testcases/commands/keyctl/Makefile            | 19 +++----------
 testcases/commands/ld/Makefile                | 22 ++-------------
 testcases/commands/ldd/Makefile               | 18 ++-----------
 testcases/commands/ln/Makefile                | 22 ++-------------
 testcases/commands/lsmod/Makefile             | 17 +++---------
 testcases/commands/mkdir/Makefile             | 22 ++-------------
 testcases/commands/mkfs/Makefile              | 19 +++----------
 testcases/commands/mkswap/Makefile            | 17 +++---------
 testcases/commands/mv/Makefile                | 22 ++-------------
 testcases/commands/nm/Makefile                | 22 ++-------------
 testcases/commands/sysctl/Makefile            | 16 +----------
 testcases/commands/tar/Makefile               | 22 ++-------------
 testcases/commands/unshare/Makefile           | 13 +--------
 testcases/commands/unzip/Makefile             | 22 ++-------------
 testcases/commands/wc/Makefile                | 17 +++---------
 testcases/commands/which/Makefile             | 17 +++---------
 testcases/cve/Makefile                        | 14 +---------
 testcases/kernel/Makefile                     | 24 +++--------------
 testcases/kernel/connectors/Makefile          | 22 ++-------------
 testcases/kernel/connectors/pec/Makefile      | 22 ++-------------
 testcases/kernel/containers/Makefile          | 17 +-----------
 testcases/kernel/containers/netns/Makefile    | 18 ++-----------
 testcases/kernel/containers/pidns/Makefile    | 21 ++-------------
 testcases/kernel/controllers/Makefile         | 22 ++-------------
 testcases/kernel/controllers/cpuacct/Makefile | 22 ++-------------
 testcases/kernel/controllers/memcg/Makefile   | 22 ++-------------
 .../controllers/memcg/functional/Makefile     | 22 ++-------------
 .../controllers/memcg/regression/Makefile     | 22 ++-------------
 testcases/kernel/controllers/pids/Makefile    | 20 ++------------
 testcases/kernel/crypto/Makefile              | 14 +---------
 testcases/kernel/device-drivers/Makefile      | 15 +----------
 .../kernel/device-drivers/block/Makefile      | 15 +----------
 .../block/block_dev_kernel/Makefile           | 15 +----------
 testcases/kernel/device-drivers/rcu/Makefile  | 15 +----------
 testcases/kernel/device-drivers/rtc/Makefile  | 15 +----------
 testcases/kernel/fs/Makefile                  | 22 ++-------------
 testcases/kernel/fs/fs_fill/Makefile          | 14 +---------
 testcases/kernel/fs/iso9660/Makefile          | 19 ++-----------
 testcases/kernel/fs/lftest/Makefile           | 22 ++-------------
 testcases/kernel/fs/linktest/Makefile         | 22 ++-------------
 testcases/kernel/fs/quota_remount/Makefile    | 19 ++-----------
 testcases/kernel/fs/read_all/Makefile         | 14 +---------
 testcases/kernel/io/Makefile                  | 22 ++-------------
 testcases/kernel/lib/Makefile                 | 21 ++-------------
 testcases/kernel/logging/Makefile             | 19 ++-----------
 testcases/kernel/logging/kmsg/Makefile        | 19 ++-----------
 testcases/kernel/mem/Makefile                 | 22 ++-------------
 testcases/kernel/mem/hugetlb/Makefile         | 19 ++-----------
 .../kernel/mem/hugetlb/hugemmap/Makefile      | 22 ++-------------
 .../kernel/mem/hugetlb/hugeshmat/Makefile     | 22 ++-------------
 .../kernel/mem/hugetlb/hugeshmctl/Makefile    | 22 ++-------------
 .../kernel/mem/hugetlb/hugeshmdt/Makefile     | 22 ++-------------
 .../kernel/mem/hugetlb/hugeshmget/Makefile    | 19 ++-----------
 testcases/kernel/mem/hugetlb/lib/Makefile     | 19 ++-----------
 testcases/kernel/mem/ksm/Makefile             | 19 ++-----------
 testcases/kernel/mem/mmapstress/Makefile      | 19 ++-----------
 testcases/kernel/mem/mtest01/Makefile         | 22 ++-------------
 testcases/kernel/mem/mtest06/Makefile         | 22 ++-------------
 testcases/kernel/mem/mtest07/Makefile         | 22 ++-------------
 testcases/kernel/mem/thp/Makefile             | 20 ++------------
 testcases/kernel/mem/tunable/Makefile         | 20 ++------------
 testcases/kernel/mem/vma/Makefile             | 20 ++------------
 testcases/kernel/numa/Makefile                | 19 ++-----------
 testcases/kernel/pty/Makefile                 | 22 ++-------------
 testcases/kernel/sched/Makefile               | 22 ++-------------
 testcases/kernel/sched/autogroup/Makefile     | 20 +++-----------
 testcases/kernel/security/Makefile            | 22 ++-------------
 testcases/kernel/security/dirtyc0w/Makefile   | 15 +----------
 testcases/kernel/security/integrity/Makefile  | 19 ++-----------
 .../kernel/security/integrity/ima/Makefile    | 22 ++-------------
 .../security/integrity/ima/datafiles/Makefile | 26 +++---------------
 .../security/integrity/ima/src/Makefile       | 22 ++-------------
 .../security/integrity/ima/tests/Makefile     | 22 ++-------------
 testcases/kernel/syscalls/pwritev/Makefile    | 21 +++------------
 .../kernel/syscalls/set_mempolicy/Makefile    |  1 +
 testcases/kernel/tracing/Makefile             |  1 +
 .../kernel/tracing/dynamic_debug/Makefile     | 20 ++------------
 testcases/lib/Makefile                        | 22 ++-------------
 testcases/misc/Makefile                       | 24 +++--------------
 testcases/network/Makefile                    |  1 +
 testcases/network/can/Makefile                | 21 ++-------------
 testcases/network/can/filter-tests/Makefile   | 18 ++-----------
 testcases/network/dhcp/Makefile               | 15 +----------
 testcases/network/iproute/Makefile            | 22 ++-------------
 testcases/network/lib6/Makefile               | 24 ++---------------
 testcases/network/netstress/Makefile          | 14 +---------
 testcases/network/rpc/Makefile                | 22 ++-------------
 testcases/network/rpc/rpc-tirpc/Makefile      | 19 ++-----------
 .../network/rpc/rpc-tirpc/tests_pack/Makefile |  1 +
 testcases/network/sctp/Makefile               | 14 +---------
 testcases/network/sockets/Makefile            | 22 ++-------------
 testcases/network/stress/Makefile             | 22 ++-------------
 testcases/network/stress/dccp/Makefile        | 14 +---------
 testcases/network/stress/icmp/Makefile        | 22 ++-------------
 testcases/network/stress/interface/Makefile   | 22 ++-------------
 testcases/network/stress/ipsec/Makefile       | 19 +------------
 testcases/network/stress/multicast/Makefile   | 22 ++-------------
 .../stress/multicast/grp-operation/Makefile   | 22 ++-------------
 .../stress/multicast/packet-flood/Makefile    | 22 ++-------------
 .../stress/multicast/query-flood/Makefile     | 22 ++-------------
 testcases/network/stress/sctp/Makefile        | 14 +---------
 testcases/network/stress/tcp/Makefile         | 22 ++-------------
 testcases/network/stress/udp/Makefile         | 22 ++-------------
 testcases/network/tcp_cc/Makefile             | 14 +---------
 testcases/network/tcp_cmds/Makefile           | 24 +++--------------
 testcases/network/tcp_cmds/host/Makefile      | 22 ++-------------
 testcases/network/tcp_cmds/ipneigh/Makefile   | 22 ++-------------
 testcases/network/tcp_cmds/netstat/Makefile   | 22 ++-------------
 testcases/network/tcp_cmds/sendfile/Makefile  | 22 ++-------------
 testcases/network/tcp_cmds/tracepath/Makefile | 14 +---------
 testcases/network/tcp_fastopen/Makefile       | 15 +----------
 testcases/network/traceroute/Makefile         | 22 ++-------------
 testcases/network/virt/Makefile               | 15 +----------
 testcases/network/xinetd/Makefile             | 22 ++-------------
 testcases/open_posix_testsuite/Makefile       | 17 +++++-------
 .../open_posix_testsuite/conformance/Makefile |  5 +---
 .../conformance/interfaces/Makefile           |  5 +---
 testscripts/Makefile                          | 22 ++-------------
 utils/Makefile                                | 21 ++-------------
 utils/sctp/Makefile                           | 22 ++-------------
 utils/sctp/func_tests/Makefile                | 23 ++--------------
 137 files changed, 266 insertions(+), 2357 deletions(-)

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
