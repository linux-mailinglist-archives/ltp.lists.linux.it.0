Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AF86D5B5AF
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 09:23:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3503A3C1DBD
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 09:23:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id EE07D3C1D7C
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 09:23:31 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E97401A00F75
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 09:23:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7791688305
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 07:23:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DCEE17D32
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 07:23:29 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 625B5206D1;
 Mon,  1 Jul 2019 07:23:29 +0000 (UTC)
Date: Mon, 1 Jul 2019 03:23:26 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <553049750.30838144.1561965806395.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2d-Hyhg5Xo+Q66C3MKvMv3pOnXDKtFYkuZpi6ZUEgC2DA@mail.gmail.com>
References: <20190626071538.29486-1-liwang@redhat.com>
 <20190626071538.29486-2-liwang@redhat.com>
 <285629943.30156546.1561537194409.JavaMail.zimbra@redhat.com>
 <CAEemH2d_7fq2RxEwZEMSUgErM7XG26RTsV1ogLTiLvALc810Gw@mail.gmail.com>
 <1695359151.30173908.1561543177520.JavaMail.zimbra@redhat.com>
 <CAEemH2d-Hyhg5Xo+Q66C3MKvMv3pOnXDKtFYkuZpi6ZUEgC2DA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.28]
Thread-Topic: pkey: add test for memory protection keys
Thread-Index: hrsOzIh14M0VFyplQTM0X9k7fzGDMQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 01 Jul 2019 07:23:29 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/2] pkey: add test for memory protection keys
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
> On Wed, Jun 26, 2019 at 5:59 PM Jan Stancek <jstancek@redhat.com> wrote:
> 
> >
> > ...
> > >
> > > If a system(e.g PowerKVM guest) configured with NO huge page support,
> > then
> > > the file '/proc/sys/vm/nr_hugepages' exist but EOPNOTSUPP to read/write.
> > In
> > > this key01, perhaps I shouldn't use the "/proc/.../nr_hugepages" to
> > detect
> > > that at the beginning.
> > >
> > > Seems the correct way is to use "/sys/kernel/mm/hugepages/" for huge page
> > > detecting and leave the SAFE_FILE_* still in setup(). Because we need to
> > > catch the "/proc/.../nr_hugepages" open/close or read/write issue in
> > > testing.
> >
> > That should work, I see we used that in some tests already.
> >
> 
> Thanks, should I format new patch v5? or any more comments?

Yes, please send v5.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
