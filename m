Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0A433F0D3
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 14:02:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 365643C3100
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 14:02:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 7A2A53C2D07
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 14:02:18 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 22FF91400F91
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 14:02:17 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4E0CEAC23;
 Wed, 17 Mar 2021 13:02:17 +0000 (UTC)
Date: Wed, 17 Mar 2021 14:02:15 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <YFH910rpcVjzDuEI@pevik>
References: <20210317100154.20389-1-zhaogongyi@huawei.com>
 <YFHghQWbAmjmKDx3@pevik>
 <OS0PR01MB6371A1E607BDFBC2421E6788836A9@OS0PR01MB6371.jpnprd01.prod.outlook.com>
 <YFHpSspnD52A8N0P@pevik> <YFHxcgN/3TG2Y9Mx@yuki.lan>
 <YFHyg8m3CmU8as2C@pevik>
 <32fcff9e-54d4-a4ed-0d4c-3b703921d035@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32fcff9e-54d4-a4ed-0d4c-3b703921d035@163.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] ??????: [PATCH v2] cleanup: Unify the annotation style
 and remove Redundant code
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
Cc: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On 3/17/21 8:13 PM, Petr Vorel wrote:
> > Hi,

> > > Hi!
> > > > I'd keep both: this is for cleanup of old approach, conversion in testinfo.pl in
> > > > case there is inconsistency in the future.
> > > If we agree on a certain format I would vote for docparse to fail the
> > > build if the format is wrong, that will force us to maintain the
> > > metadata correctly.
> +1
> > Make sense. But being the one who often fixes docparse failures I'm not sure if
> > I want to implement extra work for myself :).

> > (It'd help to implement https://github.com/linux-test-project/ltp/issues/599,
> > but I don't have any server to run it).

> This issue is about docparse, I think we can merge the patch itself
> directly.
Agree, rebased and merged with updated commit message.

Not sure when I update testinfo.pl to Cyril's suggestion,
anyone feel free to implement it.

Kind regards,
Petr

> Best Regards,

> Xiao Yang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
