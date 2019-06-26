Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B47925660F
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 11:59:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F1143C104D
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 11:59:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E89AC3C0271
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 11:59:43 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 87DF16018A8
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 11:59:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 176B6C045770
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 09:59:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ED281001925
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 09:59:42 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 06DBB206D1;
 Wed, 26 Jun 2019 09:59:42 +0000 (UTC)
Date: Wed, 26 Jun 2019 05:59:37 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1695359151.30173908.1561543177520.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2d_7fq2RxEwZEMSUgErM7XG26RTsV1ogLTiLvALc810Gw@mail.gmail.com>
References: <20190626071538.29486-1-liwang@redhat.com>
 <20190626071538.29486-2-liwang@redhat.com>
 <285629943.30156546.1561537194409.JavaMail.zimbra@redhat.com>
 <CAEemH2d_7fq2RxEwZEMSUgErM7XG26RTsV1ogLTiLvALc810Gw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.205.74, 10.4.195.11]
Thread-Topic: pkey: add test for memory protection keys
Thread-Index: AjaxwaeEjHR2NestLXSodmgSDCfSOg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 26 Jun 2019 09:59:42 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
> On Wed, Jun 26, 2019 at 4:20 PM Jan Stancek <jstancek@redhat.com> wrote:
> 
> >
> > ----- Original Message -----
> > > +
> > > +static void setup(void)
> > > +{
> > > +     int i, fd;
> > > +
> > > +     if (access(PATH_VM_NRHPS, F_OK)) {
> > > +             tst_res(TINFO, "Huge page is not supported");
> > > +             size = getpagesize();
> > > +             no_hugepage = 1;
> > > +     } else {
> > > +             int val;
> > > +
> > > +             SAFE_FILE_PRINTF(PATH_VM_NRHPS, "%d", 1);
> >
> > This is still SAFE write, which may trigger TBROK:
> >
> > # ./pkey01
> > tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
> > safe_file_ops.c:301: BROK: Failed to close FILE
> > '/proc/sys/vm/nr_hugepages' at pkey01.c:67: EOPNOTSUPP
> > safe_macros.c:773: WARN: pkey01.c:91: umount(tmp_pkey) failed: ENOENT
> > safe_macros.c:184: WARN: pkey01.c:92: rmdir(tmp_pkey) failed: ENOENT
> >
> 
> Er, sorry about still not working here.
> 
> If a system(e.g PowerKVM guest) configured with NO huge page support, then
> the file '/proc/sys/vm/nr_hugepages' exist but EOPNOTSUPP to read/write. In
> this key01, perhaps I shouldn't use the "/proc/.../nr_hugepages" to detect
> that at the beginning.
> 
> Seems the correct way is to use "/sys/kernel/mm/hugepages/" for huge page
> detecting and leave the SAFE_FILE_* still in setup(). Because we need to
> catch the "/proc/.../nr_hugepages" open/close or read/write issue in
> testing.

That should work, I see we used that in some tests already.

> 
> What do you think? Should we mask the EOPNOTSUPP as a TCONF skipping or
> others?
> 
> --
> Regards,
> Li Wang
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
