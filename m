Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 719961B4533
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 14:32:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 301993C2977
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 14:32:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 2A0513C2964
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 14:31:58 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id A89851001348
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 14:31:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587558716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2p+4uEJWJsp7tKwV/qO5BhXsfhOI1YX8tNXVJybTlGo=;
 b=V7MBojRiJhCq/5h4pG+EzlZaOGjuKPukEMFSvnw8qqJOTlNSvA5ZKwn3juGjykcXjRrZ0m
 C8zvMBi2M+/MS/3D2ckawAXEWcTCdcvcKgKUFXvL8z2adRvbA6Nn2H8azTjECC0MrKGH95
 /u2t+JQkM3WPPkhAYDQBONup9CRCWro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-f5EwNHPSNPi-Pp1AZ2qOyQ-1; Wed, 22 Apr 2020 08:31:54 -0400
X-MC-Unique: f5EwNHPSNPi-Pp1AZ2qOyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56671100CC86;
 Wed, 22 Apr 2020 12:31:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BA0660C99;
 Wed, 22 Apr 2020 12:31:53 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F363941BE;
 Wed, 22 Apr 2020 12:31:53 +0000 (UTC)
Date: Wed, 22 Apr 2020 08:31:53 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <329264999.9436008.1587558713031.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2e_h+4_nMTaVVtu9ngewvV_qrzVvtnKrqhQPCzZxDY80w@mail.gmail.com>
References: <bc3c52ff5b97feefa4200c3d87002de5a61ee360.1587539566.git.jstancek@redhat.com>
 <3529bb886952f26fa38095ce99ceef115f71cb18.1587554860.git.jstancek@redhat.com>
 <CAEemH2e_h+4_nMTaVVtu9ngewvV_qrzVvtnKrqhQPCzZxDY80w@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.10]
Thread-Topic: hugetlb: check for requested huge pages first
Thread-Index: HnxUhKUsGAiFc8A5zQRmX8LMEekmDw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] hugetlb: check for requested huge pages first
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
> On Wed, Apr 22, 2020 at 7:40 PM Jan Stancek <jstancek@redhat.com> wrote:
> 
> > /sys/kernel/mm/hugepages is not present when there are no
> > supported hugepage sizes. This is common for ppc64le KVM guests,
> > when hypervisor does not enable hugepages. Guest will boot with:
> >   hugetlbfs: disabling because there are no supported hugepage sizes
> >
> >   # cat /proc/filesystems  | grep huge; echo $?
> >   1
> >
> > Move the check up in setup to check it as first thing to avoid
> > running into TBROK on mount or set_sys_tune when hugetlbfs is
> > not available:
> >   safe_macros.c:766: BROK: hugemmap01.c:82: mount(none,
> > /mnt/testarea/ltp-07Kg6lCOmm/Ai9D0M, hugetlbfs, 0, (nil)) failed: ENODEV
> > (19)
> >   safe_macros.c:766: BROK: hugemmap02.c:129: mount(none,
> > /mnt/testarea/ltp-07Kg6lCOmm/Cxf7A6, hugetlbfs, 0, (nil)) failed: ENODEV
> > (19)
> >   safe_macros.c:766: BROK: hugemmap04.c:100: mount(none,
> > /mnt/testarea/ltp-07Kg6lCOmm/kS60Mk, hugetlbfs, 0, (nil)) failed: ENODEV
> > (19)
> >   safe_file_ops.c:219: BROK: Expected 1 conversions got 0 at
> > hugemmap06.c:42
> >   safe_file_ops.c:155: BROK: The FILE '/proc/sys/vm/nr_hugepages' ended
> > prematurely at mem.c:836
> >   safe_file_ops.c:219: BROK: Expected 1 conversions got 0 at
> > hugeshmat05.c:39
> >
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> >
> Acked-by: Li Wang <liwang@redhat.com>
> 
> This is obviously right! ACK.

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
