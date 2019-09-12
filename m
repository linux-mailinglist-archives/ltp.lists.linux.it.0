Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEF6B104E
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 15:48:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A2E53C2090
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 15:48:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E43AC3C0428
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 15:48:29 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 68E28616E21
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 15:48:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 02513ACA0;
 Thu, 12 Sep 2019 13:48:27 +0000 (UTC)
Date: Thu, 12 Sep 2019 15:48:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20190912134826.GB22246@dell5510>
References: <20190903141610.28887-1-pvorel@suse.cz>
 <df197557-8f95-52d5-813e-a5abc73a1af6@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <df197557-8f95-52d5-813e-a5abc73a1af6@oracle.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 0/7] net/route: rewrite route-change-{dst, gw,
 if} into new API
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

first, thanks for your review.

..
> > this version address functionality problems you pointed out.
> > But yet there might need to be another version as I'm not sure about
> > tst_ipaddr_un() API changes.

> > Changes v3-v4:
> > * enhanced tst_ipaddr_un() with -b, -h -l, -m, -n and -p options (-p was
> > previous -m)
> > * use tst_ipaddr_un() options to fix address clash on host_id, net_id clash fix
> > by adjusting $1 in test (this is really inconsistent, see note at 3/7).
> > * added tests for tst_ipaddr_un()
> > * quiet EXPECT_PASS ping$TST_IPV6


> The patch-set looks good, the only concerns are:

> * complicated tst_ipaddr_un(), may be add another high-level function
>   to use raw tst_ipadd_un(), if -b, -f, -n options are really needed?
Sure. I'll keep only -l and -m and drop -b, -f, -n and -h as not needed ATM.
And add them via high-level function only if needed.

In that case I'd like to have -l and -m functionality also for NET_ID (already
needed in route-change-dst.sh). But not sure which options would be for it
(it'd be easy with long opts, but we don't want to depend on /usr/bin/getopt,
nor to parse it manually although of course doable)

Another option is to have single option for adding both MAX and MIN:

-h MIN,MAX # for HOST_ID
-n MIN,MAX # for NET_ID

(e.g. -n5,255 -h1,255)

But it looks to me a bit uncomfortable having to always to add both min and max.

> * if NS_TIMES is large, there are a lot of messages in a test output
>   (it seems NS_TIMES * 4), could we minimize the number of them?

I can add -q option to tst_add_ipaddr() which usage will make it NS_TIMES * 2. (1)
If it's still too much I'll drop "testing route over ..." (2)
Other option would be to print only even Nth iteration (I don't think it's a
good idea) or even has only single TPASS/TFAIL.

BTW don't we want end testing on first failure?


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
