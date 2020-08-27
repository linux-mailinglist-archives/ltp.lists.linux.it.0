Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B23D92544D2
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Aug 2020 14:14:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2575E3C2EBD
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Aug 2020 14:14:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 568F63C04C3
 for <ltp@lists.linux.it>; Thu, 27 Aug 2020 14:14:32 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 1829760092F
 for <ltp@lists.linux.it>; Thu, 27 Aug 2020 14:14:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598530470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=68YnZ5iMQa2hzuTloL54vH8pqftHyOxkXGe7wB49cjg=;
 b=GdyoG0sRv6XwsUQVFb1AhTnyFS96G9HpLHrUCMOL/KLm8e3dNvSszht9NQ4izeWJaU3LcR
 kMCOagSYQx8ZiBpkpauydQo/N5X8moy0pNRHjYwED4MT7BB/1IdNLQhzvsPiMpQ3zXvevo
 9vkS3meTyb0yYOIO6AeJdC6DmNtWl9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-lhsaUpfCOb6MDjDHbLtvmw-1; Thu, 27 Aug 2020 08:14:25 -0400
X-MC-Unique: lhsaUpfCOb6MDjDHbLtvmw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38EAE425D1;
 Thu, 27 Aug 2020 12:14:24 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 783AD7B9F5;
 Thu, 27 Aug 2020 12:14:22 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 27 Aug 2020 14:14:20 +0200
Message-Id: <10ca0dc0c59d782bcccd5aedc99dadb5c76fed91.1598530309.git.jstancek@redhat.com>
In-Reply-To: <20200826103913.27678-1-mdoucha@suse.cz>
References: <20200826103913.27678-1-mdoucha@suse.cz>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/setsockopt05: associate receiver with
 destination address
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

to avoid sporadic ECONNREFUSED errors (caused by delayed ICMP):
  safe_net.c:202: BROK: setsockopt05.c:70: send(6, 0x3ffcaf7d828, 4000, 32768) failed: ECONNREFUSED (111)

per man(7) udp:
  ECONNREFUSED
    No receiver was associated with the destination address.
    This might be caused by a previous packet sent over the socket.

per https://tools.ietf.org/html/rfc1122#page-78
  The application is also responsible to avoid confusion from a delayed ICMP
  error message resulting from an earlier use of the same port(s).

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 .../kernel/syscalls/setsockopt/setsockopt05.c | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt05.c b/testcases/kernel/syscalls/setsockopt/setsockopt05.c
index e78ef236e337..0b7ff39d2663 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt05.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt05.c
@@ -31,13 +31,14 @@
 #define BUFSIZE 4000
 
 static struct sockaddr_in addr;
+static int dst_sock = -1;
 
 static void setup(void)
 {
 	int real_uid = getuid();
 	int real_gid = getgid();
-	int sock;
 	struct ifreq ifr;
+	socklen_t addrlen = sizeof(addr);
 
 	SAFE_UNSHARE(CLONE_NEWUSER);
 	SAFE_UNSHARE(CLONE_NEWNET);
@@ -45,14 +46,23 @@ static void setup(void)
 	SAFE_FILE_PRINTF("/proc/self/uid_map", "0 %d 1", real_uid);
 	SAFE_FILE_PRINTF("/proc/self/gid_map", "0 %d 1", real_gid);
 
-	tst_init_sockaddr_inet_bin(&addr, INADDR_LOOPBACK, 12345);
-	sock = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
+	tst_init_sockaddr_inet_bin(&addr, INADDR_LOOPBACK, 0);
+	dst_sock = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
+
 	strcpy(ifr.ifr_name, "lo");
 	ifr.ifr_mtu = 1500;
-	SAFE_IOCTL(sock, SIOCSIFMTU, &ifr);
+	SAFE_IOCTL(dst_sock, SIOCSIFMTU, &ifr);
 	ifr.ifr_flags = IFF_UP;
-	SAFE_IOCTL(sock, SIOCSIFFLAGS, &ifr);
-	SAFE_CLOSE(sock);
+	SAFE_IOCTL(dst_sock, SIOCSIFFLAGS, &ifr);
+
+	SAFE_BIND(dst_sock, (struct sockaddr *)&addr, addrlen);
+	SAFE_GETSOCKNAME(dst_sock, (struct sockaddr*)&addr, &addrlen);
+}
+
+static void cleanup(void)
+{
+	if (dst_sock != -1)
+		SAFE_CLOSE(dst_sock);
 }
 
 static void run(void)
@@ -82,6 +92,7 @@ static void run(void)
 static struct tst_test test = {
 	.test_all = run,
 	.setup = setup,
+	.cleanup = cleanup,
 	.taint_check = TST_TAINT_W | TST_TAINT_D,
 	.needs_kconfigs = (const char *[]) {
 		"CONFIG_USER_NS=y",
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
