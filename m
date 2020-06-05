Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AE71EF39E
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 11:02:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E0EF3C2F58
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 11:02:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2EBFF3C209F
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 11:02:34 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 59EBB141762D
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 11:02:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591347751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type;
 bh=69fFrjt87hWRRMCnUCOzhcyZWISrwS2dRdIfGUAsUCg=;
 b=hUp2uW7bK4pAc7UEzt/LjHmAVVUtQooGRrXHsFvdoj6S5z16mSyVtT/+ICrGh/ySTHIquf
 49bhTij3qQzURzblNf8CavINLNOFQ4Q44i/YjyXnp25Ru3lsQuZsBZcrWsvlIoJlFxI4zq
 n9wRj6RJumO9KEfHRovj0cM46RW7Ci4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-zbuunf5DPy2Umk2fCT-sew-1; Fri, 05 Jun 2020 05:02:29 -0400
X-MC-Unique: zbuunf5DPy2Umk2fCT-sew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D556800685
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 09:02:28 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7DED60E1C
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 09:02:27 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Fri,  5 Jun 2020 11:02:19 +0200
Message-Id: <9b9e3d35b4fddb668b02595e418a997332f98491.1591347655.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] lapi/syscalls: add setns to hppa
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

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 include/lapi/syscalls/hppa.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/lapi/syscalls/hppa.in b/include/lapi/syscalls/hppa.in
index e00d2dc6d37d..7f9b5e0a01b9 100644
--- a/include/lapi/syscalls/hppa.in
+++ b/include/lapi/syscalls/hppa.in
@@ -17,6 +17,7 @@ splice 291
 tee 293
 vmsplice 294
 syncfs 327
+setns 328
 process_vm_readv 330
 process_vm_writev 331
 memfd_create 340
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
