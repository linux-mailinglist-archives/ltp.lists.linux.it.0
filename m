Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9341CACFF
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 14:58:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F7DE3C26C3
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 14:58:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 5D70A3C2410
 for <ltp@lists.linux.it>; Fri,  8 May 2020 14:58:44 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 79C8C1401AFB
 for <ltp@lists.linux.it>; Fri,  8 May 2020 14:58:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588942721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Pl9SOuRjjeMK+ICQ7WBVmTuf965vgrR3J4xrCvkApxc=;
 b=DsPfA881drpmmLZBy89a150vddOsBFdwymnAGpYtYAP14AjH4+JN1mptKXRcPYanhwH5on
 N0hGH1Od1eS3Q3VjziK0x5fWIE0kX0csLpkMNupQtVahHHP7WA8sVNV83/UI6Qvc2zFxVq
 aGLr/OBaOZkKzNSkRURl4lqZeF6tvBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-Ud7q8mzWOwGrouvtXD0BSg-1; Fri, 08 May 2020 08:58:40 -0400
X-MC-Unique: Ud7q8mzWOwGrouvtXD0BSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 099CC1054F98;
 Fri,  8 May 2020 12:58:39 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55E21707C8;
 Fri,  8 May 2020 12:58:38 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Fri,  8 May 2020 14:58:32 +0200
Message-Id: <797dd5eeadd81fae30635dd66d0a715cc213c51e.1588942651.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] nm01: fix regex matching internal symbols
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

Current regex matches any word character followed by space
and one of letters "abdft". So it doesn't match only symbol type,
but can match for example value and size:
  $ grep "\w [a,b,d,f,t]" nm.out
  __libc_csu_init T 10000640 b4
                   matches ^ ^

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/commands/nm/nm01.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/commands/nm/nm01.sh b/testcases/commands/nm/nm01.sh
index fd9d3d92262f..873126d20945 100755
--- a/testcases/commands/nm/nm01.sh
+++ b/testcases/commands/nm/nm01.sh
@@ -47,7 +47,7 @@ test2()
 {
 	EXPECT_PASS $NM -f posix -g $TST_DATAROOT/f1 \> nm.out
 
-	if grep -q "\w [a,b,d,f,t]" nm.out; then
+	if grep -q "^[^ ]\+ [abdft]" nm.out; then
 		tst_res TFAIL "Got internal symbols with -g"
 		cat nm.out
 	else
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
