Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 70729EE594
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 18:09:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A7883C269D
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 18:09:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 4C7FD3C2579
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 18:09:23 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id C4B131A0015C
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 18:09:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572887361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wqbGPbVPNu4nH/ZaSFEmfCbLBOVqCd7k/T4zJSsaz74=;
 b=FUQUzmakLcXp4BKwNdjGnqn1FVhU8/AFDoDBmsTi54YbjORiPguSFHs7Cam8DfN9d4i0IZ
 PKJkEiukab2FaIBpt1eNmPTK5p6UdEaHo/eDhWUmglaHlzXLF2audMtEkngmMAw2Ex5AKD
 yHPdj/ZRShsy6O3wcVIPJmqSKhYg/PI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-Pu2Ye8ypPF6omcxOH9HPiw-1; Mon, 04 Nov 2019 12:09:19 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97D991800D53
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 17:09:18 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20B2D5DA66
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 17:09:17 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Mon,  4 Nov 2019 18:09:08 +0100
Message-Id: <ca8367553e721a5ef39491dc37d606877d51cfa7.1572887015.git.jstancek@redhat.com>
In-Reply-To: <2086f9d5a3ce152780833993e6e21d3fbd074441.1572887015.git.jstancek@redhat.com>
References: <2086f9d5a3ce152780833993e6e21d3fbd074441.1572887015.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Pu2Ye8ypPF6omcxOH9HPiw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] read_all_sys: skip debugfs
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

debugfs is meant for debugging, it exposes also device registers
and can pretty much do anything:
  https://lore.kernel.org/linux-arm-kernel/1507592549.3785589.1570404050459.JavaMail.zimbra@redhat.com/
  https://lore.kernel.org/stable/2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com/

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/fs/read_all/read_all.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/fs/read_all/read_all.c b/testcases/kernel/fs/read_all/read_all.c
index cef55e20d671..8e83009a5d4d 100644
--- a/testcases/kernel/fs/read_all/read_all.c
+++ b/testcases/kernel/fs/read_all/read_all.c
@@ -83,6 +83,7 @@ static char *drop_privs;
 
 static char *blacklist[] = {
 	"/sys/power/wakeup_count",
+	"/sys/kernel/debug/*",
 };
 static unsigned int blacklist_sz = ARRAY_SIZE(blacklist);
 
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
