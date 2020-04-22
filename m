Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 261251B389B
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 09:13:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19C113C298D
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 09:13:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id AB7973C20DE
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 09:13:36 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id C24AA200B0D
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 09:13:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587539614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VfV68ONlbyAX6AKOnh82szlo+DHh2u3tIDtRDdb08p0=;
 b=EA88jEqKh99u22E+2xTWw7dDopc4DqioZZzgP9kmLcX1E8Uc0fukExffTbw+6hrVjhJLJc
 TnnmwSVenjjOLRO5eSJUFUVwjDYD9x59i+SloVKe4AwiFEBPysxycm4tYt5ABuvqVvu054
 gjYPeGyrIovgnT1RtnfD3I8v399s3Lg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-ZHGZp9wbP7aG5QUiT96Lxg-1; Wed, 22 Apr 2020 03:13:32 -0400
X-MC-Unique: ZHGZp9wbP7aG5QUiT96Lxg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 954D7107ACCD;
 Wed, 22 Apr 2020 07:13:31 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1F16B3A66;
 Wed, 22 Apr 2020 07:13:27 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 22 Apr 2020 09:13:21 +0200
Message-Id: <bc3c52ff5b97feefa4200c3d87002de5a61ee360.1587539566.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_hugepage: TCONF when huge pages are not
 supported
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

/sys/kernel/mm/hugepages is not present when there are no
supported hugepage sizes. This is common for ppc64le KVM guests,
when hypervisor does not enable hugepages. Guest will boot with:
  hugetlbfs: disabling because there are no supported hugepage sizes

  # cat /proc/filesystems  | grep huge; echo $?
  1

End the test with TCONF to avoid TBROK on mmap, set_sys_tune, etc.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 lib/tst_hugepage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_hugepage.c b/lib/tst_hugepage.c
index 52667a14e8ff..eb66c4fbbc91 100644
--- a/lib/tst_hugepage.c
+++ b/lib/tst_hugepage.c
@@ -18,7 +18,7 @@ unsigned long tst_request_hugepages(unsigned long hpages)
 
 	if (access(PATH_HUGEPAGES, F_OK)) {
 		tst_hugepages = 0;
-		goto out;
+		tst_brk(TCONF, "Huge pages not supported.");
 	}
 
 	if (nr_opt)
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
