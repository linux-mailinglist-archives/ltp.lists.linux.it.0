Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9451F3746
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 11:51:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A9623C2E50
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 11:51:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 853663C2E6A
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 11:51:13 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id D7F0120116C
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 11:51:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591696271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UTz+r9ZQtFKCpb8oFl0jewtU8u62a4TUk5koZzTraEw=;
 b=bgiRKR2S0gQK3/RHgeAM2ZdeR1fnwt23BdIkeyUSzhClXvurHYNbYKk2lLgQ6JFp0PqHU2
 HHERraYfWXKpuueoz2lQPAtbRqVu6X9K53E68FZupPmoxeILteip67K2EJZlsrg//O4s1q
 T3VgW7PQCthgO01XMUo1V3mPLWlfS8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-bo-XSnTAOt-p9wF3cuUzRg-1; Tue, 09 Jun 2020 05:51:10 -0400
X-MC-Unique: bo-XSnTAOt-p9wF3cuUzRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 214071800D42
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 09:51:09 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FB8B891E2
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 09:51:08 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue,  9 Jun 2020 17:51:02 +0800
Message-Id: <20200609095102.21153-4-liwang@redhat.com>
In-Reply-To: <20200609095102.21153-1-liwang@redhat.com>
References: <20200609095102.21153-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 4/4] mm: add cpuset01 to runtest file
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

This test was moved to stress test since commit ae8fa55a8, but stress
runtest has been removed from commit e752f7c19674 :).

Here adding back it as a general memory test without '-I 3600'.

Signed-off-by: Li Wang <liwang@redhat.com>
---
 runtest/mm | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/runtest/mm b/runtest/mm
index a09f39c1e..612a4d066 100644
--- a/runtest/mm
+++ b/runtest/mm
@@ -73,6 +73,8 @@ ksm06 ksm06
 ksm06_1 ksm06 -n 10
 ksm06_2 ksm06 -n 10000
 
+cpuset01 cpuset01
+
 oom01 oom01
 oom02 oom02
 oom03 oom03
-- 
2.21.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
