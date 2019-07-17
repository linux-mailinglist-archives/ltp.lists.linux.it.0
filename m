Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9136B7BD
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 09:56:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 06D7A3C1D24
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 09:56:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C504A3C1D15
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 09:56:47 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 655A7601D7F
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 09:56:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BEF154E92A;
 Wed, 17 Jul 2019 07:56:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5FB05D968;
 Wed, 17 Jul 2019 07:56:45 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id ACDE618089C8;
 Wed, 17 Jul 2019 07:56:45 +0000 (UTC)
Date: Wed, 17 Jul 2019 03:56:45 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwan@redhat.com>
Message-ID: <32687581.576777.1563350205495.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2dviTYAAcsOgotuOG5gicUVVP2g2RE3MomOp5NVG_4U+Q@mail.gmail.com>
References: <20190705051603.24599-1-liwang@redhat.com>
 <02ade9af1634c4681156dceecfd51721284044e3.1562591065.git.jstancek@redhat.com>
 <20190711123441.GA8709@rei>
 <1337100107.32641000.1562849136661.JavaMail.zimbra@redhat.com>
 <CAEemH2dviTYAAcsOgotuOG5gicUVVP2g2RE3MomOp5NVG_4U+Q@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.19]
Thread-Topic: add tst_no_corefile()
Thread-Index: winMlkRz+nkSujBVFy7yunuVRSRdPg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 17 Jul 2019 07:56:45 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3.1] lib: add tst_no_corefile()
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
> On Thu, Jul 11, 2019 at 8:45 PM Jan Stancek <jstancek@redhat.com> wrote:
> 
> > ...
> > >
> > > because otherwise we will print the mesasge even in cases that the
> > > corefile is not in fact limited.
> >
> > Depends on setup of core_pattern, if it's core-to-file it's already
> > limited.
> > If it's core-to-pipe, then it's no limit, so I agree, we can move it above.
> >
> >
> I helped to push the v3.1 base on Cyril's suggestion. Since I'm going to
> apply the pkey testcase. Thanks.

Thanks Li.

> 
> --
> Regards,
> Li Wang
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
