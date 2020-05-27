Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C65C1E3D5F
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 11:15:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 515703C324E
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 11:15:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E7CA03C2466
 for <ltp@lists.linux.it>; Wed, 27 May 2020 11:15:26 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 5E84A140199C
 for <ltp@lists.linux.it>; Wed, 27 May 2020 11:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590570924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AhXdBsTWbDGHC63fLw+hA6VmsVtpnBDCy261D3EUdu0=;
 b=C0Evg7AgO3WtPqD/aIbSUv88goPguO6LN/cBwpHILQvnl/GEPpCywqqWJH5KdU3jjjq2HW
 wioRDbzCcoSyhWTsRTwhmWba9MO2hfTWEuGCu+yU5Hkr+juZID58k5hzWn/7MtVlvjYjg4
 f1zSk9GT8WTKVx4PumrgB8UzeYQPpg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-5IGSGpfGNr-tHse9dB0rtA-1; Wed, 27 May 2020 05:15:22 -0400
X-MC-Unique: 5IGSGpfGNr-tHse9dB0rtA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81BB6107ACF3
 for <ltp@lists.linux.it>; Wed, 27 May 2020 09:15:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B0422DE60
 for <ltp@lists.linux.it>; Wed, 27 May 2020 09:15:21 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 249EB18095FF;
 Wed, 27 May 2020 09:15:21 +0000 (UTC)
Date: Wed, 27 May 2020 05:15:20 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1306372061.13772311.1590570920909.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2e6Hr7JmdV02P=8SyiVK-q5fHj7=RkF_R8fM+m9b3PrBg@mail.gmail.com>
References: <20200527031430.22144-1-liwang@redhat.com>
 <535677442.13762982.1590565251771.JavaMail.zimbra@redhat.com>
 <CAEemH2e6Hr7JmdV02P=8SyiVK-q5fHj7=RkF_R8fM+m9b3PrBg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.28]
Thread-Topic: add new cgroup test API
Thread-Index: hg849tiSxFOW6P4dxSw3ABaShu2iyA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/4] lib: add new cgroup test API
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
> On Wed, May 27, 2020 at 3:40 PM Jan Stancek <jstancek@redhat.com> wrote:
> 
> >
> >
> >
> > ----- Original Message -----
> > > +
> > > +void tst_cgroup_mem_set_maxbytes(long memsz)
> > > +{
> > > +     tst_cgroup_move_current(TST_CGROUP_MEMCG);
> >
> > It seems a bit unexpected, that setting a limit also moves current
> > process to cgroup. If test forks two processes, it has to set maxbytes
> > twice, to get the desired side-effect.
> >
> 
> Yes, I didn't aware of that before.
> Maybe we can remove the tst_cgroup_move_current() from here and invoke it
> additionally?

Agreed, some cpuset tests already do it that way.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
