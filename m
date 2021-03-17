Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EB733EFAE
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 12:34:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 40AE43C2D22
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 12:34:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B2C183C1B76
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 12:34:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 659721400978
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 12:34:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6A32AB8C;
 Wed, 17 Mar 2021 11:34:36 +0000 (UTC)
Date: Wed, 17 Mar 2021 12:34:34 +0100
From: Petr Vorel <pvorel@suse.cz>
To: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>
Message-ID: <YFHpSspnD52A8N0P@pevik>
References: <20210317100154.20389-1-zhaogongyi@huawei.com>
 <YFHghQWbAmjmKDx3@pevik>
 <OS0PR01MB6371A1E607BDFBC2421E6788836A9@OS0PR01MB6371.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OS0PR01MB6371A1E607BDFBC2421E6788836A9@OS0PR01MB6371.jpnprd01.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?b?5Zue5aSNOiAgW1BBVENIIHYyXSBjbGVhbnVwOiBVbmlmeSB0?=
 =?utf-8?q?he_annotation_style_and_remove_Redundant_code?=
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> > Hi Gongyi,

> > > Change 'DESCRIPTION' to 'Description' and change 'ALGORITHM' to 
> > > 'Algorithm', and remove Redundant tst_reap_children since 
> > > tst_reap_children has been called in the test skeleton.

> > Reviewed-by: Petr Vorel <pvorel@suse.cz>

> Hi Petr,

> If we want to unify the format of 'Description' and 'Algorithm' in test, it seems redundant to do the conversion in testinfo.pl, right?

> Can we use either of them(not both of them) because it is unnecessary to do the same thing twice.

I'd keep both: this is for cleanup of old approach, conversion in testinfo.pl in
case there is inconsistency in the future.

But not a strong opinion about it, it's not that important.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
