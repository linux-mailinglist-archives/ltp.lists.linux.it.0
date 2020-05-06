Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 507041C7030
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 14:20:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E70BB3C57A8
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 14:20:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 7B38E3C2232
 for <ltp@lists.linux.it>; Wed,  6 May 2020 14:20:53 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 8B0781001176
 for <ltp@lists.linux.it>; Wed,  6 May 2020 14:20:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588767650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zHe2cREKjzdys45RnnELDALgsHu0AAqJ/ebVwKW1DYw=;
 b=CYJBMKRNCuNEwSFb/uOeROIqfILpSghql5mpGAWd0hlXIyP1vbMyaNIoGu5BrBTZ3FQQoV
 XbRhgSL2+V3z7lu+rJoNHrh2rmro0eUiARSBEDq3ECA9coeR91RCyrNbx4Ou3O9fT/mdy6
 oanekRfAHr9T3qJBFYq/pVseKFYapdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-CnBJuAT0O1mcQDHwf__HEw-1; Wed, 06 May 2020 08:20:46 -0400
X-MC-Unique: CnBJuAT0O1mcQDHwf__HEw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E75E98014D5;
 Wed,  6 May 2020 12:20:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAF816C760;
 Wed,  6 May 2020 12:20:44 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF1A854D00;
 Wed,  6 May 2020 12:20:44 +0000 (UTC)
Date: Wed, 6 May 2020 08:20:44 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <885202649.11490925.1588767644801.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200506121704.GA8586@dell5510>
References: <20200505101625.25020-1-rpalethorpe@suse.com>
 <877dxpsb4n.fsf@our.domain.is.not.set>
 <1106041841.11477901.1588762195733.JavaMail.zimbra@redhat.com>
 <CAEemH2coDuWHPt8SMosAtpjNd4VxmkGw3FWWajUOYXaNN7o0og@mail.gmail.com>
 <1352538726.11479675.1588763647954.JavaMail.zimbra@redhat.com>
 <20200506113817.GA5409@dell5510>
 <1139985312.11485617.1588766778300.JavaMail.zimbra@redhat.com>
 <20200506121704.GA8586@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.17]
Thread-Topic: pty04: Use guarded buffers for transmission
Thread-Index: hXImf8ABCDWxBfmQQobckjIn0yaKuQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
> Hi Jan,
> 
> > > > -#if defined(HAVE_LINUX_IF_PACKET_H) && defined(HAVE_LINUX_IF_ETHER_H)
> > > > +#include <linux/version.h>
> > > Shouldn't we also check for <linux/version.h> with autotools? Or are
> > > kernel
> > > headers mandatory for LTP build?
> 
> > We already include this header in some syscalls tests, so I assumed it
> > won't be an issue.
> 
> OK, no problem.
> 
> > > > +
> > > > +#if defined(HAVE_LINUX_IF_PACKET_H) && defined(HAVE_LINUX_IF_ETHER_H)
> > > > \
> > > > +       && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 10, 0)
> 
> > > >  #include <linux/if_packet.h>
> > > >  #include <linux/if_ether.h>
> > > > @@ -373,6 +376,6 @@ static struct tst_test test = {
> 
> > > >  #else
> 
> > > > -TST_TEST_TCONF("Need <linux/if_packet.h> and <linux/if_ether.h>");
> > > > +TST_TEST_TCONF("Need <linux/if_packet.h> and <linux/if_ether.h> and
> > > > 4.10+");
> 
> > > +1.
> 
> > > BTW, why this tests requires 4.10 for runtime?
> 
> > It's for compilation. struct can_frame fields it's using were introduced in
> > 4.10.
> 
> Do you mean a2f11835994e ("can.h: make padding given by gcc explicit") from
> v4.2-rc1? + there is no change for include/uapi/linux/can.h in 4.10.

You're right, I didn't sort the tags correctly.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
