Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B03298731
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 08:01:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2AEF43C561C
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 08:01:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 97B6C3C3125
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 08:01:50 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4387D600782
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 08:01:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 84666AD2F;
 Mon, 26 Oct 2020 07:01:49 +0000 (UTC)
Date: Mon, 26 Oct 2020 08:01:48 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201026070148.GC21306@dell5510>
References: <1603361548-1534-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <e0bdc892-6ade-f694-7c14-ca7ef7cb052f@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e0bdc892-6ade-f694-7c14-ca7ef7cb052f@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] route{4,6}-rmmod: Filter out ":" and fix typos
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey, Feiyu,

> On 22.10.2020 13:12, Feiyu Zhu wrote:
> > Reported-by: Jin Cao <caoj.fnst@cn.fujitsu.com>
> > Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
> > ---
> >  testcases/network/stress/route/route4-rmmod | 4 ++--
> >  testcases/network/stress/route/route6-rmmod | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)

> > diff --git a/testcases/network/stress/route/route4-rmmod b/testcases/network/stress/route/route4-rmmod
> > index 7aa1958..1ba255e 100644
> > --- a/testcases/network/stress/route/route4-rmmod
> > +++ b/testcases/network/stress/route/route4-rmmod
> > @@ -164,14 +164,14 @@ do_setup()
> >      lhost_module=`ethtool -i $lhost_ifname | grep driver | sed "s/driver:[[:blank:]]*//"`

> >      # Chack the other active interface uses the same driver
> > -    for ifname in `ifconfig | grep ^eth | awk '{ print $1}'`; do
> > +    for ifname in `ifconfig | grep ^eth | awk '{print $1}' | sed "s/://"`; do

> Thanks for fixing it, but it is not enough here. This command is wrong,
> not only does it use obsolete tool, but also assumes that interface
> names start with 'eth'. So it skips the check for active connections
> that already in use with the driver (it is going to remove) for all
> modern systems.
+1

> I think we should at least remove this test from the runtest file
> until the proper fix.
Good idea, I've sent a patch for this.
https://patchwork.ozlabs.org/project/ltp/patch/20201026070006.25298-1-pvorel@suse.cz/

> Also this test and route4{6}-redirect are
> really need to be rewritten with new test API, please have a look
> at route-change-*.sh.

Kind regards,
Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
