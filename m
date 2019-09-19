Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A74E1B7D60
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 16:59:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5E3373C2179
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 16:59:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8AFA53C20E3
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 16:59:21 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 440E1601B0D
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 16:59:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 755CBB6D2
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 14:59:19 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 19 Sep 2019 16:59:11 +0200
Message-Id: <20190919145911.22278-3-mdoucha@suse.cz>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190919145911.22278-1-mdoucha@suse.cz>
References: <20190919145911.22278-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] Add connection tests for bind()
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

Add two new test programs to verify that bind() will open sockets for incoming
connections. Both programs follow the same test scenario:
- Create and bind() a socket
- Wait for connection from peer thread
- Send request to peer thread
- Receive and verify response from peer thread

bind04 tests stream-oriented sockets (SOCK_STREAM and SOCK_SEQPACKET).
bind05 tests datagram-oriented sockets (SOCK_DGRAM).

Both programs test the following socket types:
- AF_UNIX (pathname and abstract addresses)
- AF_INET (loopback)
- AF_INET6 (loopback)

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 runtest/syscalls                          |   2 +
 testcases/kernel/syscalls/bind/.gitignore |   2 +
 testcases/kernel/syscalls/bind/Makefile   |   5 +
 testcases/kernel/syscalls/bind/bind04.c   | 206 ++++++++++++++++++++
 testcases/kernel/syscalls/bind/bind05.c   | 219 ++++++++++++++++++++++
 testcases/kernel/syscalls/bind/libbind.c  |  47 +++++
 testcases/kernel/syscalls/bind/libbind.h  |  15 ++
 7 files changed, 496 insertions(+)
 create mode 100644 testcases/kernel/syscalls/bind/bind04.c
 create mode 100644 testcases/kernel/syscalls/bind/bind05.c
 create mode 100644 testcases/kernel/syscalls/bind/libbind.c
 create mode 100644 testcases/kernel/syscalls/bind/libbind.h

diff --git a/runtest/syscalls b/runtest/syscalls
index 874ae4d4f..2738193a8 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -31,6 +31,8 @@ alarm07 alarm07
 bind01 bind01
 bind02 bind02
 bind03 bind03
+bind04 bind04
+bind05 bind05
 
 bpf_map01 bpf_map01
 bpf_prog01 bpf_prog01
diff --git a/testcases/kernel/syscalls/bind/.gitignore b/testcases/kernel/syscalls/bind/.gitignore
index 4ebea9ee7..e18ceea56 100644
--- a/testcases/kernel/syscalls/bind/.gitignore
+++ b/testcases/kernel/syscalls/bind/.gitignore
@@ -1,3 +1,5 @@
 /bind01
 /bind02
 /bind03
+/bind04
+/bind05
diff --git a/testcases/kernel/syscalls/bind/Makefile b/testcases/kernel/syscalls/bind/Makefile
index bd617d806..ec57d134c 100644
--- a/testcases/kernel/syscalls/bind/Makefile
+++ b/testcases/kernel/syscalls/bind/Makefile
@@ -20,4 +20,9 @@ top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
+FILTER_OUT_MAKE_TARGETS		:= libbind
+bind04 bind05:	LDLIBS		+= -lpthread
+
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
+
+$(MAKE_TARGETS): %: %.o libbind.o
diff --git a/testcases/kernel/syscalls/bind/bind04.c b/testcases/kernel/syscalls/bind/bind04.c
new file mode 100644
index 000000000..52473285c
--- /dev/null
+++ b/testcases/kernel/syscalls/bind/bind04.c
@@ -0,0 +1,206 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   Copyright (c) 2019 Martin Doucha <mdoucha@suse.cz>
+ */
+
+/*
+ * Create and bind socket for various standard stream protocols.
+ * Then connect to it and send some test data.
+ */
+
+#include <string.h>
+#include <stdlib.h>
+#include <time.h>
+#include <sys/types.h>
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <arpa/inet.h>
+#include <netinet/in.h>
+#include <netinet/ip.h>
+#include <pthread.h>
+
+#include "tst_test.h"
+#include "tst_safe_pthread.h"
+#include "libbind.h"
+
+#define SOCKET_FILE "test.sock"
+#define ABSTRACT_SOCKET_PATH "\0test.sock"
+#define IPV4_ADDRESS "127.0.0.1"
+#define IPV6_ADDRESS "::1"
+#define BUFFER_SIZE 128
+
+static struct sockaddr_un unix_addr = {
+	.sun_family = AF_UNIX,
+	.sun_path = SOCKET_FILE
+};
+static struct sockaddr_un abstract_addr = {
+	.sun_family = AF_UNIX,
+	.sun_path = ABSTRACT_SOCKET_PATH
+};
+static struct sockaddr_in ipv4_addr;
+static struct sockaddr_in ipv4_any_addr;
+static struct sockaddr_in6 ipv6_addr;
+static struct sockaddr_in6 ipv6_any_addr;
+
+static struct test_case {
+	int type, protocol;
+	struct sockaddr *address;
+	socklen_t addrlen;
+	const char *description;
+} testcase_list[] = {
+	// UNIX sockets
+	{SOCK_STREAM, 0, (struct sockaddr*)&unix_addr, sizeof(unix_addr),
+		"AF_UNIX pathname stream"},
+	{SOCK_SEQPACKET, 0, (struct sockaddr*)&unix_addr, sizeof(unix_addr),
+		"AF_UNIX pathname seqpacket"},
+	{SOCK_STREAM, 0, (struct sockaddr*)&abstract_addr,
+		sizeof(abstract_addr), "AF_UNIX abstract stream"},
+	{SOCK_SEQPACKET, 0, (struct sockaddr*)&abstract_addr,
+		sizeof(abstract_addr), "AF_UNIX abstract seqpacket"},
+
+	// IPv4 sockets
+	{SOCK_STREAM, 0, (struct sockaddr*)&ipv4_addr, sizeof(ipv4_addr),
+		"IPv4 loop TCP variant 1"},
+	{SOCK_STREAM, IPPROTO_TCP, (struct sockaddr*)&ipv4_addr,
+		sizeof(ipv4_addr), "IPv4 loop TCP variant 2"},
+	{SOCK_STREAM, 0, (struct sockaddr*)&ipv4_any_addr,
+		sizeof(ipv4_any_addr), "IPv4 any TCP variant 1"},
+	{SOCK_STREAM, IPPROTO_TCP, (struct sockaddr*)&ipv4_any_addr,
+		sizeof(ipv4_any_addr), "IPv4 any TCP variant 2"},
+
+	// IPv6 sockets
+	{SOCK_STREAM, 0, (struct sockaddr*)&ipv6_addr, sizeof(ipv6_addr),
+		"IPv6 loop TCP variant 1"},
+	{SOCK_STREAM, IPPROTO_TCP, (struct sockaddr*)&ipv6_addr,
+		sizeof(ipv6_addr), "IPv6 loop TCP variant 2"},
+	{SOCK_STREAM, 0, (struct sockaddr*)&ipv6_any_addr,
+		sizeof(ipv6_any_addr), "IPv6 any TCP variant 1"},
+	{SOCK_STREAM, IPPROTO_TCP, (struct sockaddr*)&ipv6_any_addr,
+		sizeof(ipv6_any_addr), "IPv6 any TCP variant 2"}
+};
+
+static void setup(void)
+{
+	srand(time(0));
+
+	// Configure listen address for AF_INET test cases
+	memset(&ipv4_addr, 0, sizeof(ipv4_addr));
+	ipv4_addr.sin_family = AF_INET;
+	ipv4_addr.sin_port = htons(0);
+	ipv4_addr.sin_addr.s_addr = inet_addr(IPV4_ADDRESS);
+
+	memset(&ipv4_any_addr, 0, sizeof(ipv4_any_addr));
+	ipv4_any_addr.sin_family = AF_INET;
+	ipv4_any_addr.sin_port = htons(0);
+	ipv4_any_addr.sin_addr.s_addr = htonl(INADDR_ANY);
+
+	// Configure listen address for AF_INET6 test cases
+	memset(&ipv6_addr, 0, sizeof(ipv6_addr));
+	ipv6_addr.sin6_family = AF_INET6;
+	ipv6_addr.sin6_port = htons(0);
+	memcpy(&ipv6_addr.sin6_addr, &in6addr_loopback,
+		sizeof(struct in6_addr));
+
+	memset(&ipv6_any_addr, 0, sizeof(ipv6_any_addr));
+	ipv6_any_addr.sin6_family = AF_INET6;
+	ipv6_any_addr.sin6_port = htons(0);
+	memcpy(&ipv6_any_addr.sin6_addr, &in6addr_any,
+		sizeof(struct in6_addr));
+}
+
+static void *peer_thread(void *tc_ptr)
+{
+	const struct test_case *tc = (struct test_case*)tc_ptr;
+	int sock;
+	unsigned request;
+	const char *response;
+
+	sock = SAFE_SOCKET(tc->address->sa_family, tc->type, tc->protocol);
+	SAFE_CONNECT(sock, tc->address, tc->addrlen);
+	SAFE_READ(1, sock, &request, sizeof(request));
+
+	if (request < ARRAY_SIZE(testcase_list)) {
+		response = testcase_list[request].description;
+	} else {
+		response = "Invalid request value";
+	}
+
+	SAFE_WRITE(1, sock, response, strlen(response) + 1);
+	SAFE_CLOSE(sock);
+	return NULL;
+}
+
+static void test_bind(unsigned int n)
+{
+	struct test_case tc_copy, *tc = testcase_list + n;
+	struct sockaddr_storage listen_addr, remote_addr;
+	struct sockaddr_un *tmp_addr;
+	socklen_t remote_len = sizeof(struct sockaddr_storage);
+	int listen_sock, sock, size;
+	unsigned rand_index;
+	pthread_t thread_id;
+	char buffer[BUFFER_SIZE];
+	const char *exp_data;
+
+	// Create listen socket
+	tst_res(TINFO, "Testing %s", tc->description);
+	listen_sock = SAFE_SOCKET(tc->address->sa_family, tc->type,
+		tc->protocol);
+
+	TEST(bind(listen_sock, tc->address, tc->addrlen));
+
+	if (TST_RET) {
+		tst_res(TFAIL | TERRNO, "bind() failed");
+		close(listen_sock);
+		return;
+	}
+
+	// IPv4/IPv6 tests use wildcard addresses, resolve a valid connection
+	// address for peer thread
+	memcpy(&tc_copy, tc, sizeof(struct test_case));
+	tc_copy.addrlen = get_connect_address(listen_sock, &listen_addr);
+	tc_copy.address = (struct sockaddr*)&listen_addr;
+
+	// Start peer thread and wait for connection
+	SAFE_LISTEN(listen_sock, 1);
+	SAFE_PTHREAD_CREATE(&thread_id, NULL, peer_thread, &tc_copy);
+	sock = accept(listen_sock, (struct sockaddr*)&remote_addr,
+		&remote_len);
+
+	if (sock < 0) {
+		tst_brk(TBROK | TERRNO, "accept() failed");
+	}
+
+	// Send request
+	rand_index = rand() % ARRAY_SIZE(testcase_list);
+	SAFE_WRITE(1, sock, &rand_index, sizeof(rand_index));
+
+	// Read response
+	size = SAFE_READ(0, sock, buffer, BUFFER_SIZE - 1);
+	buffer[size] = '\0';
+	exp_data = testcase_list[rand_index].description;
+
+	if (!strcmp(buffer, exp_data)) {
+		tst_res(TPASS, "Communication successful");
+	} else {
+		tst_res(TFAIL, "Received invalid data. Expected: \"%s\". "
+			"Received: \"%s\"", exp_data, buffer);
+	}
+
+	// Cleanup
+	SAFE_CLOSE(sock);
+	SAFE_CLOSE(listen_sock);
+	pthread_join(thread_id, NULL);
+	tmp_addr = (struct sockaddr_un*)tc->address;
+
+	if (tc->address->sa_family == AF_UNIX && tmp_addr->sun_path[0]) {
+		SAFE_UNLINK(tmp_addr->sun_path);
+	}
+}
+
+static struct tst_test test = {
+	.test = test_bind,
+	.tcnt = ARRAY_SIZE(testcase_list),
+	.needs_tmpdir = 1,
+	.setup = setup,
+};
diff --git a/testcases/kernel/syscalls/bind/bind05.c b/testcases/kernel/syscalls/bind/bind05.c
new file mode 100644
index 000000000..986ef258d
--- /dev/null
+++ b/testcases/kernel/syscalls/bind/bind05.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   Copyright (c) 2019 Martin Doucha <mdoucha@suse.cz>
+ */
+
+/*
+ * Create and bind socket for various standard datagram protocols.
+ * Then connect to it and send some test data.
+ */
+
+#include <string.h>
+#include <stdlib.h>
+#include <time.h>
+#include <sys/types.h>
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <arpa/inet.h>
+#include <netinet/in.h>
+#include <netinet/ip.h>
+#include <pthread.h>
+
+#include "tst_test.h"
+#include "tst_safe_pthread.h"
+#include "libbind.h"
+
+#define MAIN_SOCKET_FILE "test.sock"
+#define ABSTRACT_SOCKET_PATH "\0test.sock"
+#define PEER_SOCKET_FILE "peer.sock"
+#define IPV4_ADDRESS "127.0.0.1"
+#define IPV6_ADDRESS "::1"
+#define BUFFER_SIZE 128
+
+static struct sockaddr_un unix_addr = {
+	.sun_family = AF_UNIX,
+	.sun_path = MAIN_SOCKET_FILE
+};
+static struct sockaddr_un abstract_addr = {
+	.sun_family = AF_UNIX,
+	.sun_path = ABSTRACT_SOCKET_PATH
+};
+static struct sockaddr_un peer_addr = {
+	.sun_family = AF_UNIX,
+	.sun_path = PEER_SOCKET_FILE
+};
+static struct sockaddr_in ipv4_addr;
+static struct sockaddr_in ipv4_any_addr;
+static struct sockaddr_in6 ipv6_addr;
+static struct sockaddr_in6 ipv6_any_addr;
+
+static struct test_case {
+	int type, protocol;
+	struct sockaddr *address;
+	socklen_t addrlen;
+	const char *description;
+} testcase_list[] = {
+	// UNIX sockets
+	{SOCK_DGRAM, 0, (struct sockaddr*)&unix_addr, sizeof(unix_addr),
+		"AF_UNIX pathname datagram"},
+	{SOCK_DGRAM, 0, (struct sockaddr*)&abstract_addr,
+		sizeof(abstract_addr), "AF_UNIX abstract datagram"},
+
+	// IPv4 sockets
+	{SOCK_DGRAM, 0, (struct sockaddr*)&ipv4_addr, sizeof(ipv4_addr),
+		"IPv4 loop UDP variant 1"},
+	{SOCK_DGRAM, IPPROTO_UDP, (struct sockaddr*)&ipv4_addr,
+		sizeof(ipv4_addr), "IPv4 loop UDP variant 2"},
+	{SOCK_DGRAM, 0, (struct sockaddr*)&ipv4_any_addr,
+		sizeof(ipv4_any_addr), "IPv4 any UDP variant 1"},
+	{SOCK_DGRAM, IPPROTO_UDP, (struct sockaddr*)&ipv4_any_addr,
+		sizeof(ipv4_any_addr), "IPv4 any UDP variant 2"},
+
+	// IPv6 sockets
+	{SOCK_DGRAM, 0, (struct sockaddr*)&ipv6_addr, sizeof(ipv6_addr),
+		"IPv6 loop UDP variant 1"},
+	{SOCK_DGRAM, IPPROTO_UDP, (struct sockaddr*)&ipv6_addr,
+		sizeof(ipv6_addr), "IPv6 loop UDP variant 2"},
+	{SOCK_DGRAM, 0, (struct sockaddr*)&ipv6_any_addr,
+		sizeof(ipv6_any_addr), "IPv6 any UDP variant 1"},
+	{SOCK_DGRAM, IPPROTO_UDP, (struct sockaddr*)&ipv6_any_addr,
+		sizeof(ipv6_any_addr), "IPv6 any UDP variant 2"}
+};
+
+static void setup(void)
+{
+	srand(time(0));
+
+	// Configure listen address for AF_INET test cases
+	memset(&ipv4_addr, 0, sizeof(ipv4_addr));
+	ipv4_addr.sin_family = AF_INET;
+	ipv4_addr.sin_port = htons(0);
+	ipv4_addr.sin_addr.s_addr = inet_addr(IPV4_ADDRESS);
+
+	memset(&ipv4_any_addr, 0, sizeof(ipv4_any_addr));
+	ipv4_any_addr.sin_family = AF_INET;
+	ipv4_any_addr.sin_port = htons(0);
+	ipv4_any_addr.sin_addr.s_addr = htonl(INADDR_ANY);
+
+	// Configure listen address for AF_INET6 test cases
+	memset(&ipv6_addr, 0, sizeof(ipv6_addr));
+	ipv6_addr.sin6_family = AF_INET6;
+	ipv6_addr.sin6_port = htons(0);
+	memcpy(&ipv6_addr.sin6_addr, &in6addr_loopback,
+		sizeof(struct in6_addr));
+
+	memset(&ipv6_any_addr, 0, sizeof(ipv6_any_addr));
+	ipv6_any_addr.sin6_family = AF_INET6;
+	ipv6_any_addr.sin6_port = htons(0);
+	memcpy(&ipv6_any_addr.sin6_addr, &in6addr_any,
+		sizeof(struct in6_addr));
+}
+
+static void *peer_thread(void *tc_ptr)
+{
+	const struct test_case *tc = (struct test_case*)tc_ptr;
+	int sock;
+	unsigned request = 0;
+	const char *response;
+
+	sock = SAFE_SOCKET(tc->address->sa_family, tc->type, tc->protocol);
+
+	// Both sides of AF_UNIX/SOCK_DGRAM socket must be bound for
+	// bidirectional communication
+	if (tc->address->sa_family == AF_UNIX) {
+		SAFE_BIND(sock, (struct sockaddr*)&peer_addr,
+			sizeof(struct sockaddr_un));
+	}
+
+	SAFE_CONNECT(sock, tc->address, tc->addrlen);
+	SAFE_WRITE(1, sock, &request, sizeof(request));
+	SAFE_READ(1, sock, &request, sizeof(request));
+
+	if (request < ARRAY_SIZE(testcase_list)) {
+		response = testcase_list[request].description;
+	} else {
+		response = "Invalid request value";
+	}
+
+	SAFE_WRITE(1, sock, response, strlen(response) + 1);
+	SAFE_CLOSE(sock);
+
+	if (tc->address->sa_family == AF_UNIX) {
+		SAFE_UNLINK(PEER_SOCKET_FILE);
+	}
+
+	return NULL;
+}
+
+static void test_bind(unsigned int n)
+{
+	struct test_case tc_copy, *tc = testcase_list + n;
+	struct sockaddr_storage listen_addr, remote_addr;
+	struct sockaddr_un *tmp_addr;
+	socklen_t remote_len = sizeof(struct sockaddr_storage);
+	int sock, size;
+	unsigned rand_index;
+	pthread_t thread_id;
+	char buffer[BUFFER_SIZE];
+	const char *exp_data;
+
+	// Create listen socket
+	tst_res(TINFO, "Testing %s", tc->description);
+	sock = SAFE_SOCKET(tc->address->sa_family, tc->type, tc->protocol);
+
+	TEST(bind(sock, tc->address, tc->addrlen));
+
+	if (TST_RET) {
+		tst_res(TFAIL | TERRNO, "bind() failed");
+		close(sock);
+		return;
+	}
+
+	// IPv4/IPv6 tests use wildcard addresses, resolve a valid connection
+	// address for peer thread
+	memcpy(&tc_copy, tc, sizeof(struct test_case));
+	tc_copy.addrlen = get_connect_address(sock, &listen_addr);
+	tc_copy.address = (struct sockaddr*)&listen_addr;
+
+	// Start peer thread and wait for connection
+	SAFE_PTHREAD_CREATE(&thread_id, NULL, peer_thread, &tc_copy);
+	size = recvfrom(sock, &rand_index, sizeof(rand_index), 0,
+		(struct sockaddr*)&remote_addr, &remote_len);
+
+	if (size != sizeof(rand_index)) {
+		tst_brk(TBROK | TERRNO, "Error while waiting for connection");
+	}
+
+	// Send request
+	rand_index = rand() % ARRAY_SIZE(testcase_list);
+	SAFE_SENDTO(1, sock, &rand_index, sizeof(rand_index), 0,
+		(struct sockaddr*)&remote_addr, remote_len);
+
+	// Read test data
+	size = SAFE_READ(0, sock, buffer, BUFFER_SIZE - 1);
+	buffer[size] = '\0';
+	exp_data = testcase_list[rand_index].description;
+
+	if (!strcmp(buffer, exp_data)) {
+		tst_res(TPASS, "Communication successful");
+	} else {
+		tst_res(TFAIL, "Received invalid data. Expected: \"%s\". "
+			"Received: \"%s\"", exp_data, buffer);
+	}
+
+	// Cleanup
+	SAFE_CLOSE(sock);
+	pthread_join(thread_id, NULL);
+	tmp_addr = (struct sockaddr_un*)tc->address;
+
+	if (tc->address->sa_family == AF_UNIX && tmp_addr->sun_path[0]) {
+		SAFE_UNLINK(tmp_addr->sun_path);
+	}
+}
+
+static struct tst_test test = {
+	.test = test_bind,
+	.tcnt = ARRAY_SIZE(testcase_list),
+	.needs_tmpdir = 1,
+	.setup = setup,
+};
diff --git a/testcases/kernel/syscalls/bind/libbind.c b/testcases/kernel/syscalls/bind/libbind.c
new file mode 100644
index 000000000..0f6e5c6a5
--- /dev/null
+++ b/testcases/kernel/syscalls/bind/libbind.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   Copyright (c) 2019 Martin Doucha <mdoucha@suse.cz>
+ */
+
+#include <string.h>
+
+#include "tst_safe_net.h"
+#include "libbind.h"
+
+socklen_t get_connect_address(int sock, struct sockaddr_storage *addr)
+{
+	struct sockaddr_in *inet_ptr;
+	struct sockaddr_in6 *inet6_ptr;
+	size_t tmp_size;
+	socklen_t ret = sizeof(*addr);
+
+	SAFE_GETSOCKNAME(sock, (struct sockaddr*)addr, &ret);
+
+	// Sanitize wildcard addresses
+	switch (addr->ss_family) {
+	case AF_INET:
+		inet_ptr = (struct sockaddr_in*)addr;
+
+		switch (ntohl(inet_ptr->sin_addr.s_addr)) {
+		case INADDR_ANY:
+		case INADDR_BROADCAST:
+			inet_ptr->sin_addr.s_addr = htonl(INADDR_LOOPBACK);
+			break;
+		}
+
+		break;
+
+	case AF_INET6:
+		inet6_ptr = (struct sockaddr_in6*)addr;
+		tmp_size = sizeof(struct in6_addr);
+
+		if (!memcmp(&inet6_ptr->sin6_addr, &in6addr_any, tmp_size)) {
+			memcpy(&inet6_ptr->sin6_addr, &in6addr_loopback,
+				tmp_size);
+		}
+
+		break;
+	}
+
+	return ret;
+}
diff --git a/testcases/kernel/syscalls/bind/libbind.h b/testcases/kernel/syscalls/bind/libbind.h
new file mode 100644
index 000000000..8a9e1e3a8
--- /dev/null
+++ b/testcases/kernel/syscalls/bind/libbind.h
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   Copyright (c) 2019 Martin Doucha <mdoucha@suse.cz>
+ */
+
+#include <sys/types.h>
+#include <arpa/inet.h>
+#include <netinet/in.h>
+#include <netinet/ip.h>
+
+/*
+ * Find valid address for connect()ing to a given bound socket
+ * Wildcard addresses like INADDR_ANY will be replaced with localhost
+ */
+socklen_t get_connect_address(int sock, struct sockaddr_storage *addr);
-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
