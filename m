Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA60EFD1D
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 13:24:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6CE483C23A6
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 13:24:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id EA67F3C22CD
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 13:23:59 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id F0EDA600C96
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 13:23:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572956637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DNOgwidt64+P3TcvnrJGc2GEY5JtVK2ciIDuy8Rop10=;
 b=Dh8m0KMChS/XpIJnBZc/KyX+AVg4Bu01LSEmxhvJa5PQqXXRo00ikyr/wdEZVz1NzH9SpV
 aP4SVgyafLnq7ywtTiaZgBuxjfSkOmrPTRlD6CiXPksGOB9Nui1QMjPAqyh4+IKTWxSIQS
 lR/BiAW+Aco4D3XnJYWQOWS6svmUx9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-wLgr0MbIP9eE_Ofod1rWig-1; Tue, 05 Nov 2019 07:23:55 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50006107ACC2;
 Tue,  5 Nov 2019 12:23:54 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95ED260FFB;
 Tue,  5 Nov 2019 12:23:53 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue,  5 Nov 2019 13:23:43 +0100
Message-Id: <2796ab4f800aefe17dda60ccc8d2cc5b06c6341e.1572956488.git.jstancek@redhat.com>
In-Reply-To: <4647b3bced96c66c040078a32c13dab65558816d.1572956488.git.jstancek@redhat.com>
References: <4647b3bced96c66c040078a32c13dab65558816d.1572956488.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: wLgr0MbIP9eE_Ofod1rWig-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] read_all_sys: skip debugfs
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
index 46f88af2270c..68fc7d031f80 100644
--- a/testcases/kernel/fs/read_all/read_all.c
+++ b/testcases/kernel/fs/read_all/read_all.c
@@ -83,6 +83,7 @@ static char *drop_privs;
 static char *blacklist[] = {
 	NULL, /* reserved for -e parameter */
 	"/sys/power/wakeup_count",
+	"/sys/kernel/debug/*",
 };
 
 static struct tst_option options[] = {
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
