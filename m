Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 508D21C6F15
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 13:14:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B85C53C579F
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 13:14:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0BB083C2609
 for <ltp@lists.linux.it>; Wed,  6 May 2020 13:14:13 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 9B42914016BB
 for <ltp@lists.linux.it>; Wed,  6 May 2020 13:14:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588763651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ma73UFR8pyOP3nNmD2jfEdMUzAgnK4qDzdzk8fv5e8Y=;
 b=NV73Jb1q0PzZbUpdmVshpf7qs2wOvS7YCbsbHEwc0Ybr03MIjJYB1UOmFz9cOVKk/zZk9L
 /cqxgZvsPEcb5zAvqlqSzNAOeUWQq77ZycJ6AExrMhf+LvN/RFuNGuICWyi3rYIQUS7BYO
 F1FQDXLo//6reg6/zjdNZDcRK3aFDCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-QAFHl3i3Oj-iNc6Ko_uoLg-1; Wed, 06 May 2020 07:14:09 -0400
X-MC-Unique: QAFHl3i3Oj-iNc6Ko_uoLg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50F8380058A;
 Wed,  6 May 2020 11:14:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 458075D9C5;
 Wed,  6 May 2020 11:14:08 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 310974CA94;
 Wed,  6 May 2020 11:14:08 +0000 (UTC)
Date: Wed, 6 May 2020 07:14:07 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1352538726.11479675.1588763647954.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2coDuWHPt8SMosAtpjNd4VxmkGw3FWWajUOYXaNN7o0og@mail.gmail.com>
References: <20200505101625.25020-1-rpalethorpe@suse.com>
 <20200505133746.GB21884@dell5510> <87d07isaka.fsf@our.domain.is.not.set>
 <877dxpsb4n.fsf@our.domain.is.not.set>
 <1106041841.11477901.1588762195733.JavaMail.zimbra@redhat.com>
 <CAEemH2coDuWHPt8SMosAtpjNd4VxmkGw3FWWajUOYXaNN7o0og@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.15]
Thread-Topic: pty04: Use guarded buffers for transmission
Thread-Index: w01n8b1rPkbIig1+0/OBq9D0babaUg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] pty04: Use guarded buffers for transmission
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> > > Probably the best thing todo for now is to remove the test before the
> > > release as this requires some more investigation.
> >
> > We can keep it in tree, I'd just disable it in runtest file(s), so it's not
> > run by default.
> >
> 
> But we still facing the compiled errors in the old kernels, that will break
> the LTP build in the compiling phase.

I see, that will fail on anything older than 4.10. I don't have strong
preference how to deal with that, just want to avoid running pty04 for now.

diff --git a/testcases/kernel/pty/pty04.c b/testcases/kernel/pty/pty04.c
index eaf172504a64..55923a0af006 100644
--- a/testcases/kernel/pty/pty04.c
+++ b/testcases/kernel/pty/pty04.c
@@ -38,7 +38,10 @@
 #include "tst_buffers.h"
 #include "config.h"

-#if defined(HAVE_LINUX_IF_PACKET_H) && defined(HAVE_LINUX_IF_ETHER_H)
+#include <linux/version.h>
+
+#if defined(HAVE_LINUX_IF_PACKET_H) && defined(HAVE_LINUX_IF_ETHER_H) \
+       && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 10, 0)

 #include <linux/if_packet.h>
 #include <linux/if_ether.h>
@@ -373,6 +376,6 @@ static struct tst_test test = {

 #else

-TST_TEST_TCONF("Need <linux/if_packet.h> and <linux/if_ether.h>");
+TST_TEST_TCONF("Need <linux/if_packet.h> and <linux/if_ether.h> and 4.10+");


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
