Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCE6372D46
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 17:49:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0EBD23C58B5
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 17:49:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D99633C582A
 for <ltp@lists.linux.it>; Tue,  4 May 2021 17:48:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3D5451A00936
 for <ltp@lists.linux.it>; Tue,  4 May 2021 17:48:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 579BBB13B
 for <ltp@lists.linux.it>; Tue,  4 May 2021 15:48:36 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  4 May 2021 17:48:35 +0200
Message-Id: <20210504154835.24881-6-mdoucha@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504154835.24881-1-mdoucha@suse.cz>
References: <20210504154835.24881-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 6/6] Add test for CVE 2020-25705
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

Fixes #742

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1: New patch

 testcases/cve/cve-2020-25705.c | 262 +++++++++++++++++++++++++++++++++
 1 file changed, 262 insertions(+)
 create mode 100644 testcases/cve/cve-2020-25705.c

diff --git a/testcases/cve/cve-2020-25705.c b/testcases/cve/cve-2020-25705.c
new file mode 100644
index 000000000..7d6bbafa8
--- /dev/null
+++ b/testcases/cve/cve-2020-25705.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 SUSE LLC
+ * Author: Nicolai Stange <nstange@suse.de>
+ * LTP port: Martin Doucha <mdoucha@suse.cz>
+ *
+ * CVE-2020-25705
+ *
+ * Test of ICMP rate limiting behavior that may be abused for DNS cache
+ * poisoning attack. Send a few batches of 100 packets to a closed UDP port
+ * and count the ICMP errors. If the number of errors is always the same
+ * for each batch (not randomized), the system is vulnerable. Send packets
+ * from multiple IP addresses to bypass per-address ICMP throttling.
+ *
+ * Fixed in:
+ *
+ *  commit b38e7819cae946e2edf869e604af1e65a5d241c5
+ *  Author: Eric Dumazet <edumazet@google.com>
+ *  Date:   Thu Oct 15 11:42:00 2020 -0700
+ *
+ *  icmp: randomize the global rate limiter
+ */
+
+#include <sys/socket.h>
+#include <netinet/in.h>
+#include <arpa/inet.h>
+#include <linux/if_addr.h>
+#include <linux/errqueue.h>
+
+#include <sched.h>
+#include <limits.h>
+#include "tst_test.h"
+#include "tst_netdevice.h"
+
+#define DSTADDR 0xfa444e02 /* 250.68.78.2 */
+#define SRCADDR_BASE 0xfa444e41 /* 250.68.78.65 */
+#define SRCADDR_COUNT 50
+#define BATCH_COUNT 8
+#define BUFSIZE 1024
+
+static int parentns = -1, childns = -1;
+static int fds[SRCADDR_COUNT];
+
+static void setup(void)
+{
+	struct sockaddr_in ipaddr = { .sin_family = AF_INET };
+	uint32_t addr;
+	int i;
+	int real_uid = getuid();
+	int real_gid = getgid();
+
+	for (i = 0; i < SRCADDR_COUNT; i++)
+		fds[i] = -1;
+
+	SAFE_UNSHARE(CLONE_NEWUSER);
+	SAFE_UNSHARE(CLONE_NEWNET);
+	SAFE_FILE_PRINTF("/proc/self/setgroups", "deny");
+	SAFE_FILE_PRINTF("/proc/self/uid_map", "0 %d 1\n", real_uid);
+	SAFE_FILE_PRINTF("/proc/self/gid_map", "0 %d 1\n", real_gid);
+
+	/*
+	 * Create network namespace to hide the destination interface from
+	 * the test process.
+	 */
+	parentns = SAFE_OPEN("/proc/self/ns/net", O_RDONLY);
+	SAFE_UNSHARE(CLONE_NEWNET);
+
+	/* Do NOT close this FD, or both interfaces will be destroyed */
+	childns = SAFE_OPEN("/proc/self/ns/net", O_RDONLY);
+
+	/* Configure child namespace */
+	CREATE_VETH_PAIR("ltp_veth1", "ltp_veth2");
+	addr = DSTADDR;
+	NETDEV_ADD_ADDRESS_INET("ltp_veth2", htonl(addr), 26,
+		IFA_F_NOPREFIXROUTE);
+	NETDEV_SET_STATE("ltp_veth2", 1);
+	NETDEV_ADD_ROUTE_INET("ltp_veth2", 0, 0, htonl(0xfa444e40), 26,
+		0);
+
+	/* Configure parent namespace */
+	NETDEV_CHANGE_NS_FD("ltp_veth1", parentns);
+	SAFE_SETNS(parentns, CLONE_NEWNET);
+	addr = SRCADDR_BASE; /* 250.68.78.65 */
+
+	for (i = 0; i < SRCADDR_COUNT; i++, addr++) {
+		NETDEV_ADD_ADDRESS_INET("ltp_veth1", htonl(addr), 26,
+			IFA_F_NOPREFIXROUTE);
+	}
+
+	NETDEV_SET_STATE("ltp_veth1", 1);
+	NETDEV_ADD_ROUTE_INET("ltp_veth1", 0, 0, htonl(0xfa444e00), 26, 0);
+	SAFE_FILE_PRINTF("/proc/sys/net/ipv4/conf/ltp_veth1/forwarding", "1");
+
+	/* Open test sockets */
+	for (i = 0; i < SRCADDR_COUNT; i++) {
+		ipaddr.sin_addr.s_addr = htonl(SRCADDR_BASE + i);
+		fds[i] = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
+		SAFE_SETSOCKOPT_INT(fds[i], IPPROTO_IP, IP_RECVERR, 1);
+		SAFE_BIND(fds[i], (struct sockaddr *)&ipaddr, sizeof(ipaddr));
+	}
+}
+
+static int count_icmp_errors(int fd)
+{
+	int error_count = 0;
+	ssize_t len;
+	char msgbuf[BUFSIZE], errbuf[BUFSIZE];
+	struct sockaddr_in addr;
+	struct cmsghdr *cmsg;
+	struct sock_extended_err exterr;
+	struct iovec iov = {
+		.iov_base = msgbuf,
+		.iov_len = BUFSIZE
+	};
+
+	while (1) {
+		struct msghdr msg = {
+			.msg_name = (struct sockaddr *)&addr,
+			.msg_namelen = sizeof(addr),
+			.msg_iov = &iov,
+			.msg_iovlen = 1,
+			.msg_flags = 0,
+			.msg_control = errbuf,
+			.msg_controllen = BUFSIZE
+		};
+
+		memset(errbuf, 0, BUFSIZE);
+		errno = 0;
+		len = recvmsg(fd, &msg, MSG_ERRQUEUE);
+
+		if (len == -1) {
+			if (errno == EWOULDBLOCK || errno == EAGAIN)
+				break;
+
+			tst_brk(TBROK | TERRNO, "recvmsg() failed");
+		}
+
+		if (len < 0) {
+			tst_brk(TBROK | TERRNO,
+				"Invalid recvmsg() return value %zd", len);
+		}
+
+		for (cmsg = CMSG_FIRSTHDR(&msg); cmsg;
+			cmsg = CMSG_NXTHDR(&msg, cmsg)) {
+			if (cmsg->cmsg_level != SOL_IP)
+				continue;
+
+			if (cmsg->cmsg_type != IP_RECVERR)
+				continue;
+
+			memcpy(&exterr, CMSG_DATA(cmsg), sizeof(exterr));
+
+			if (exterr.ee_origin != SO_EE_ORIGIN_ICMP)
+				tst_brk(TBROK, "Unexpected non-ICMP error");
+
+			if (exterr.ee_errno != ECONNREFUSED) {
+				TST_ERR = exterr.ee_errno;
+				tst_brk(TBROK | TTERRNO,
+					"Unexpected ICMP error");
+			}
+
+			error_count++;
+		}
+	}
+
+	return error_count;
+}
+
+static int packet_batch(const struct sockaddr *addr, socklen_t addrsize)
+{
+	int i, j, error_count = 0;
+	char data = 0;
+
+	for (i = 0; i < SRCADDR_COUNT; i++) {
+		for (j = 0; j < 2; j++) {
+			error_count += count_icmp_errors(fds[i]);
+			TEST(sendto(fds[i], &data, sizeof(data), 0, addr,
+				addrsize));
+
+			if (TST_RET == -1) {
+				if (TST_ERR == ECONNREFUSED) {
+					j--; /* flush ICMP errors and retry */
+					continue;
+				}
+
+				tst_brk(TBROK | TTERRNO, "sento() failed");
+			}
+
+			if (TST_RET < 0) {
+				tst_brk(TBROK | TTERRNO,
+					"Invalid sento() return value %ld",
+					TST_RET);
+			}
+		}
+	}
+
+	/* Wait and collect pending ICMP errors */
+	sleep(2);
+
+	for (i = 0; i < SRCADDR_COUNT; i++)
+		error_count += count_icmp_errors(fds[i]);
+
+	return error_count;
+}
+
+static void run(void)
+{
+	int i, errors_baseline, errors;
+	struct sockaddr_in addr = {
+		.sin_family = AF_INET,
+		.sin_port = TST_GET_UNUSED_PORT(AF_INET, SOCK_DGRAM),
+		.sin_addr = { htonl(DSTADDR) }
+	};
+
+	errors_baseline = packet_batch((struct sockaddr *)&addr, sizeof(addr));
+	errors = errors_baseline;
+	tst_res(TINFO, "Batch 0: Got %d ICMP errors", errors);
+
+	for (i = 1; i < BATCH_COUNT && errors == errors_baseline; i++) {
+		errors = packet_batch((struct sockaddr *)&addr, sizeof(addr));
+		tst_res(TINFO, "Batch %d: Got %d ICMP errors", i, errors);
+	}
+
+	if (errors == errors_baseline) {
+		tst_res(TFAIL,
+			"ICMP rate limit not randomized, system is vulnerable");
+		return;
+	}
+
+	tst_res(TPASS, "ICMP rate limit is randomized");
+}
+
+static void cleanup(void)
+{
+	int i;
+
+	for (i = 0; i < SRCADDR_COUNT; i++)
+		if (fds[i] >= 0)
+			SAFE_CLOSE(fds[i]);
+
+	if (childns >= 0)
+		SAFE_CLOSE(childns);
+
+	if (parentns >= 0)
+		SAFE_CLOSE(parentns);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_USER_NS=y",
+		"CONFIG_NET_NS=y",
+		NULL
+	},
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "b38e7819cae9"},
+		{"CVE", "2020-25705"},
+		{}
+	}
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
