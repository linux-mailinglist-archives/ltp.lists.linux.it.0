Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB5EEACCB
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 10:45:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57DE23C234D
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 10:45:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E85CF3C2350
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 10:45:17 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 3DAFC600D78
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 10:45:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572515115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bu9mIP/qBtEHU61ns3KGCBSTjKS9x4Zlktfrvdtx6+M=;
 b=W+AENkOLvIJ3zJ3EaXW7cBbv2DQeCu6tK7FktjOyH9wm5A8LCH+zc8qKMwSELJLPYTpOdh
 BhaBgy8DoVX5/X5DpZyznHJVoI8y04l6H/sgco5ZJKMKX1RPMNkAsbfmFcjIPyJOwxN01F
 veb4uf99WMkkeIfI2XjcSjiJ91zIzos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-ljLWD4iMP0mavGDdbiG07w-1; Thu, 31 Oct 2019 05:45:12 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A4F4800D49;
 Thu, 31 Oct 2019 09:45:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3968D60BFB;
 Thu, 31 Oct 2019 09:45:11 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 22B46182B00E;
 Thu, 31 Oct 2019 09:45:11 +0000 (UTC)
Date: Thu, 31 Oct 2019 05:45:10 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <2064120052.9903608.1572515110815.JavaMail.zimbra@redhat.com>
In-Reply-To: <CA+G9fYvOrBPW-8pEDayhNaT1J6g1c4z-_zO3V+G1K5xAMb-T3w@mail.gmail.com>
References: <CA+G9fYv+-dz11fSjMNt8SHaAhRpu1F=8MF7ieS4ZASAwDzH7Eg@mail.gmail.com>
 <1277217234.9839643.1572476520526.JavaMail.zimbra@redhat.com>
 <CA+G9fYvOrBPW-8pEDayhNaT1J6g1c4z-_zO3V+G1K5xAMb-T3w@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.17]
Thread-Topic: accept02: BROK: accept02.c:52: setsockopt(6, 0, 42,
 0xffff9c56df78, 136) failed: ENODEV (19)
Thread-Index: YMWB0/cII0jW9F4Lm3LBQcTTOdvpBg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: ljLWD4iMP0mavGDdbiG07w-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] LTP: accept02: BROK: accept02.c:52: setsockopt(6, 0, 42,
 0xffff9c56df78, 136) failed: ENODEV (19)
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
Cc: lkft-triage@lists.linaro.org, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> Hi Jan,
> 
> On Thu, 31 Oct 2019 at 04:32, Jan Stancek <jstancek@redhat.com> wrote:
> >
> >
> >
> > ----- Original Message -----
> > > LTP syscall accept02 test failed intermittently on hikey arm64 device,
> > > qemu_x86_64 and qemu_i386.
> > >
> > > Do you see this intermittent failure at your end ?
> >
> > I'm not. What does the network look like on these systems?
> > Is there a default route? Is 224.0.0.0 reachable?
> >
> > Can you check with?
> >
> > # ip route
> > # ip route get 224.0.0.0
> 
> on qemu_x86_64,
> 
> + ip route
> + ip route get 224.0.0.0
> RTNETLINK answers: Network is unreachable

That looks like one plausible explanation. I get same failure when I drop default gw:

# uname -r
5.4.0-rc5

# ./accept02 
tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
tst_buffers.c:55: INFO: Test is using guarded buffers
accept02.c:127: INFO: Starting listener on port: 41919
accept02.c:71: PASS: Multicast group was not copied: EADDRNOTAVAIL (99)

# ip r del default via ...
# ./accept02 
tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
tst_buffers.c:55: INFO: Test is using guarded buffers
accept02.c:127: INFO: Starting listener on port: 36517
safe_net.c:186: BROK: accept02.c:52: setsockopt(3, 0, 42, 0x7f1d25aebf78, 136) failed: ENODEV (19)

Not sure why that would be intermittent though. Is it possible
that you sometimes start tests before network is up?

> 
> 
> on hickey device,
> + ip route
> default via 10.66.16.1 dev eth0 proto dhcp metric 100
> 10.66.16.0/23 dev eth0 proto kernel scope link src 10.66.16.28 metric 100
> + ip route get 224.0.0.0
> multicast 224.0.0.0 dev eth0 src 10.66.16.28 uid 0
> cache <mc>
> 
> Link,
> https://lkft.validation.linaro.org/scheduler/job/987925#L609
> 
> - Naresh
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
