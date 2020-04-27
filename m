Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D55F21B9F58
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 11:07:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 86C3F3C2864
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 11:07:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 184CC3C226E
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 11:07:04 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id BAF7F600846
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 11:07:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587978422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dln6W6DzYxkXAnojzX2V3relTpnh+7RcdDb9hiYTQWk=;
 b=gEzktfUqDg0ueKMt2Pi20SG54+EH+o/0MVfVwNNxnn/IIrRrId9Q4gSK3Dwhz8tFiNKVwo
 5C+X4YfM3sh9dJksF3dxeyhO3Ca/Kg5oBDXKLtWYgMUNbFaq1iiTUhua9D1whArZpaPczi
 poKQ8bknFrHVmRMCsB+QhB6Dcf9Eqxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-d4IIZrJdNM6go6WhKsp95g-1; Mon, 27 Apr 2020 05:07:00 -0400
X-MC-Unique: d4IIZrJdNM6go6WhKsp95g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7743B1009440;
 Mon, 27 Apr 2020 09:06:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DFB15D9DA;
 Mon, 27 Apr 2020 09:06:59 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64D5918095FF;
 Mon, 27 Apr 2020 09:06:59 +0000 (UTC)
Date: Mon, 27 Apr 2020 05:06:58 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <96306598.10298812.1587978418983.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2daE69UT7mFGXOFQaj3bjqq8CRJr6bnhssyK3_7JPdHng@mail.gmail.com>
References: <20200424150422.17467-1-mdoucha@suse.cz>
 <20200427053125.GA21164@dell5510>
 <951270734.10286613.1587972682386.JavaMail.zimbra@redhat.com>
 <CAEemH2daE69UT7mFGXOFQaj3bjqq8CRJr6bnhssyK3_7JPdHng@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.22]
Thread-Topic: Add env variable as workaround for test issues in VMs
Thread-Index: 5axwbjrL69eY6JihrM+OKDW45/MYgA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add env variable as workaround for test issues in
 VMs
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
> On Mon, Apr 27, 2020 at 3:31 PM Jan Stancek <jstancek@redhat.com> wrote:
> 
> >
> >
> > ----- Original Message -----
> > > Hi Martin,
> > >
> > > > Timer tests often fail on sleep overrun when LTP is running inside a
> > VM.
> > > > The main cause is usually that the VM doesn't get enough CPU time to
> > wake
> > > > up
> > > > the test process in time.
> > > Cannot we detect presence of "hypervisor" in flags in /proc/cpuinfo?
> > > I though it was quite reliable for detecting VM.
> >
> > We have tst_is_virt().
> >
> 
> I take a rough look and doubt there is a bug in try_systemd_detect_virt().
> Shouldn't strncmp() return zero the 'kvm'/'xen' is found?  I guess they
> wanted:

Yes, that looks like bug.

> 
> --- a/lib/tst_virt.c
> +++ b/lib/tst_virt.c
> @@ -93,10 +93,10 @@ static int try_systemd_detect_virt(void)
>         if (ret)
>                 return 0;
> 
> -       if (strncmp("kvm", virt_type, 3))
> +       if (!strncmp("kvm", virt_type, 3))
>                 return VIRT_KVM;
> 
> -       if (strncmp("xen", virt_type, 3))
> +       if (!strncmp("xen", virt_type, 3))
>                 return VIRT_XEN;
> 
>         return 0;
> 
> Apart from that two(kvm/xen) , we need to detect more virtualization tech
> for ppc/s390 I think.

We could return VIRT_OTHER by default. We don't really need to
differentiate which one it is for purpose of this patch.



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
