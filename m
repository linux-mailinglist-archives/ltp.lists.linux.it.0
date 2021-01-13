Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0032F4CB9
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 15:08:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 400BB3C5DC2
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 15:08:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 2321E3C319B
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 15:08:02 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3D1E010007B9
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 15:08:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4923DAC24;
 Wed, 13 Jan 2021 14:08:00 +0000 (UTC)
Date: Wed, 13 Jan 2021 15:07:58 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <X/7+vk6WsJ2LDJlC@pevik>
References: <20210107120247.31465-1-pvorel@suse.cz>
 <d7eba485-08db-1cc7-abe6-38d23c244bfb@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7eba485-08db-1cc7-abe6-38d23c244bfb@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] if-mtu-change.sh: Lower CHANGE_INTERVAL to 1
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

Hi Alexey,

> On 07.01.2021 15:02, Petr Vorel wrote:
> > to make testing faster.

> > Tested only on netns based testing.


> Hi Petr,

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Hi Alexey,

> > any reason why CHANGE_INTERVAL was set 5s?

> It's more or less safe time for default setup. Not sure why we don't
> have tst_sleep in if_updown.sh though. I think this is for preventing
> link-flap errors on the switch...
Thanks for info.

BTW do you consider sleep $NS_DURATION as needed in
testcases/network/stress/multicast/{packet-flood,query-flood}?
It's before killing utils (ns-mcast_receiver, ns-udpsender),
thus it could be removed during rewrite [1]

> For netns it's can be set far less of cause by overriding CHANGE_INTERVAL.

> > It'd be nice to speedup the tests, which were slow even before
> > 2d422edbf ("if-mtu-change.sh: Add max packet size detection for IPv4")
> > which added 25% slowdown.

> > Could you please test this on two host based setup?

> > Kind regards,
> > Petr

> >  testcases/network/stress/interface/if-mtu-change.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)

> > diff --git a/testcases/network/stress/interface/if-mtu-change.sh b/testcases/network/stress/interface/if-mtu-change.sh
> > index d2816606b..3efe00461 100755
> > --- a/testcases/network/stress/interface/if-mtu-change.sh
> > +++ b/testcases/network/stress/interface/if-mtu-change.sh
> > @@ -11,7 +11,7 @@ TST_CLEANUP="do_cleanup"
> >  . if-lib.sh

> >  # The interval of the mtu change [second]
> > -CHANGE_INTERVAL=${CHANGE_INTERVAL:-5}
> > +CHANGE_INTERVAL=${CHANGE_INTERVAL:-1}

> >  TST_TIMEOUT=$(((CHANGE_INTERVAL + 30) * MTU_CHANGE_TIMES))


> It's better to remove TST_TIMEOUT so that CHANGE_INTERVAL can be set,
> for example, to "100ms" for netns setup.
How about keeping it, but consider CHANGE_INTERVAL as 1 if not a number
(i.e. containing "ms", check with tst_is_int would be IMHO enough).
I'll send a patch.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/list/?series=216562

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
