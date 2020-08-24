Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D87D224FD80
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 14:10:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80B053C2EF2
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 14:10:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3888D3C136A
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 14:10:20 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id C691410009F5
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 14:10:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598271018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=ULr4qdpc3/149begCDfR7xKPZYJfmBQYAjaRVBKnW+o=;
 b=cjavujCoTpKZVsipejsgs7DOrEmvVOrkyAIBIbMhcqMNMdhUqHaZU+2BsdvHboDnKMq7LE
 9dGFVkFIn+7cVLk8s8pE0TqhYPycHu/AnsQALsQTuYkcq86n7Vw9a/nbzoo4U5fM+HO4be
 JgPVKoEEfbwRxn1GJhMuTwLMJjmLhiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-9YaM0RXIPRamqsrjq8IAJQ-1; Mon, 24 Aug 2020 08:10:16 -0400
X-MC-Unique: 9YaM0RXIPRamqsrjq8IAJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98E9A81F008;
 Mon, 24 Aug 2020 12:10:15 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFB301972A;
 Mon, 24 Aug 2020 12:10:14 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 24 Aug 2020 14:10:11 +0200
Message-Id: <c73f6b2e1232d6a892ecef76370ea2cf6c7dd044.1598270814.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/setsockopt05: associate receiver with
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

to avoid sporadic ECONNREFUSED errors:
  safe_net.c:202: BROK: setsockopt05.c:70: send(6, 0x3ffcaf7d828, 4000, 32768) failed: ECONNREFUSED (111)

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/setsockopt/setsockopt05.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt05.c b/testcases/kernel/syscalls/setsockopt/setsockopt05.c
index e78ef236e337..469e5a64bf71 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt05.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt05.c
@@ -37,6 +37,7 @@ static void setup(void)
 	int real_uid = getuid();
 	int real_gid = getgid();
 	int sock;
+	int port = TST_GET_UNUSED_PORT(AF_INET, SOCK_DGRAM);
 	struct ifreq ifr;
 
 	SAFE_UNSHARE(CLONE_NEWUSER);
@@ -45,14 +46,14 @@ static void setup(void)
 	SAFE_FILE_PRINTF("/proc/self/uid_map", "0 %d 1", real_uid);
 	SAFE_FILE_PRINTF("/proc/self/gid_map", "0 %d 1", real_gid);
 
-	tst_init_sockaddr_inet_bin(&addr, INADDR_LOOPBACK, 12345);
+	tst_init_sockaddr_inet_bin(&addr, INADDR_LOOPBACK, port);
 	sock = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
 	strcpy(ifr.ifr_name, "lo");
 	ifr.ifr_mtu = 1500;
 	SAFE_IOCTL(sock, SIOCSIFMTU, &ifr);
 	ifr.ifr_flags = IFF_UP;
 	SAFE_IOCTL(sock, SIOCSIFFLAGS, &ifr);
-	SAFE_CLOSE(sock);
+	SAFE_BIND(sock, (struct sockaddr *)&addr, sizeof(struct sockaddr));
 }
 
 static void run(void)
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
