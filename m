Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 844862CEEF7
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 14:47:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 367ED3C4C12
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 14:47:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 239F03C2B6E
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 14:47:58 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C8A7A601439
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 14:47:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 116E5AC9A;
 Fri,  4 Dec 2020 13:47:57 +0000 (UTC)
Date: Fri, 4 Dec 2020 14:47:55 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <X8o+C0WZV8f8VONT@pevik>
References: <20201201174214.24625-1-pvorel@suse.cz>
 <20201201174214.24625-5-pvorel@suse.cz>
 <20201202154604.GD12342@yuki.lan> <X8fXG3ix4oq2Gab6@pevik>
 <CAOQ4uxhdW2x=gUD1D39Pc3Ke3QmkDUZswcLuA4djH6jcQZP_=w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhdW2x=gUD1D39Pc3Ke3QmkDUZswcLuA4djH6jcQZP_=w@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 04/10] fanotify: Add helper for FAN_REPORT_FID
 support on fs
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

...
> > > Maybe this would be just easier to read as a macro:

> > > #define FANOTIFY_FAN_REPORT_FID_ERR_MSG(res_func, fail) do { \
> > >       if (fail == -1) \
> > >               res_func(TCONF, "FAN_REPORT_FID not supported in kernel?"); \
> > >       if (fail == -2) \
> > >               res_func(TCONF, ...); \
> > >       } while (0)


> Sorry, I ended up reverting that back to a function.
np, probably better anyway.

...
> > > The rest is good.

> > Both your comments fixed, patchset merged.

> > Thank you both for your patient review,

> > Amir, I'm sorry it took me that long.

> No worries.
> I know there was a lot of black magic behind all the flag checks
> that needed explanations.

> > Looking forward to your patchset :).


> Posted.
Thanks!

> Note that I only tested upstream, v5.8, v4.20 and not kernels
> without permission events support and not exfat.

> I trust you will help to fill those testing gaps.
Sure! I should get into that early next week.

> If I am not mistaken, before my fixes, fanotify10 was going to fail
> instead of TCONF on exfat/ntfs and kernel >= v5.9, but I did not check.
Don't fail on master on my openSUSE kernel 5.10.0-rc5-2.ge84a0b5-default

> Thanks,
> Amir.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
