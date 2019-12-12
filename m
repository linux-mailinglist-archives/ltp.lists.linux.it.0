Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9873E11CD46
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Dec 2019 13:35:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50B323C237E
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Dec 2019 13:35:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8CF373C243A
 for <ltp@lists.linux.it>; Thu, 12 Dec 2019 13:35:19 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 8633D100608D
 for <ltp@lists.linux.it>; Thu, 12 Dec 2019 13:35:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576154117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qkgGw3DJPz+0GEMHaAZw+YbItUVwxArSNyXIqCIz14o=;
 b=FOTTwcjnay6UKU50ViV8LuprxOGWd71PaRSLllWEfV8bt7K2iINdJk+yZn6XVFtB3vXZ33
 0aHG+7XVdGJZX8rCMfa6jJkbkI7DPd9Gw4IJIJub3zsT/OSGwWDYWAuTX6h5BGUk/EESkT
 AIFrcVTXpioE1tTIZV42Pxt5/oRxdnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-L3mFZ0lANeGxjm_Q-Tc2PQ-1; Thu, 12 Dec 2019 07:35:16 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A9911005516
 for <ltp@lists.linux.it>; Thu, 12 Dec 2019 12:35:15 +0000 (UTC)
Received: from dustball.usersys.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B7D15D9C9;
 Thu, 12 Dec 2019 12:35:14 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 12 Dec 2019 13:35:04 +0100
Message-Id: <853f6938da5d133800dc6bf1d490937b50c2e059.1576154034.git.jstancek@redhat.com>
In-Reply-To: <cd51199b87580a138fa9c7669e61bdb7611ab204.1576154034.git.jstancek@redhat.com>
References: <cd51199b87580a138fa9c7669e61bdb7611ab204.1576154034.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: L3mFZ0lANeGxjm_Q-Tc2PQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] statx07: handle ETIMEDOUT when rpcbind.socket is
 not started
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

Recent Fedora distros (kernel-5.3.7-301.fc31.x86_64,
nfs-utils-2.4.1-1.rc1.fc31.x86_64), by default don't start rpcbind
service, where rpcbind.socket is a dependency.

This leads to test failing with ETIMEDOUT:
  # ./statx07
  tst_test.c:1215: INFO: Timeout per run is 0h 05m 00s
  statx07.c:149: BROK: mount() nfs failed: ETIMEDOUT (110)

  # systemctl start rpcbind.socket
  # ./statx07
  tst_test.c:1215: INFO: Timeout per run is 0h 05m 00s
  statx07.c:148: CONF: nfs server not set up?: EOPNOTSUPP (95)

Watch for ETIMEDOUT as well.

Fixes: #622
Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/statx/statx07.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/statx/statx07.c b/testcases/kernel/syscalls/statx/statx07.c
index a18f253bc7d4..ec1cdd19087b 100644
--- a/testcases/kernel/syscalls/statx/statx07.c
+++ b/testcases/kernel/syscalls/statx/statx07.c
@@ -144,7 +144,8 @@ static void setup(void)
 		tst_brk(TBROK | TST_ERR, "failed to exportfs");
 
 	if (mount(server_path, CLI_PATH, "nfs", 0, "addr=127.0.0.1")) {
-		if (errno == EOPNOTSUPP || errno == ECONNREFUSED)
+		if (errno == EOPNOTSUPP || errno == ECONNREFUSED
+			|| errno == ETIMEDOUT)
 			tst_brk(TCONF | TERRNO, "nfs server not set up?");
 		tst_brk(TBROK | TERRNO, "mount() nfs failed");
 	}
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
