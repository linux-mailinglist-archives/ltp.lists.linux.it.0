Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 966926C955
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 08:38:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DC643C1D0F
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 08:38:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A1ECB3C07AD
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 08:38:49 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 080D31000946
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 08:38:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4E2B3ABCD;
 Thu, 18 Jul 2019 06:38:47 +0000 (UTC)
Date: Thu, 18 Jul 2019 08:38:51 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190718063851.GA22263@dell5510>
References: <20190712134328.20528-1-pvorel@suse.cz>
 <CAEemH2cdOO1XxmMUm+2VqaExGAPJbxSep4JXHjSZzT48_49Q-A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cdOO1XxmMUm+2VqaExGAPJbxSep4JXHjSZzT48_49Q-A@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_test.sh: Use $LTP_TIMEOUT_MUL also in
 TST_RETRY_FN_EXP_BACKOFF()
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

Hi Li,

> Hi Petr,

> If timeout occurred in the exp backoff macro, we could pass a bit more time
> to it and use prototype directly.

>     e.g.   TST_RETRY_FN_EXP_BACKOFF "$1" "$2" "more_time"

> And yes, we actually can't guarantee a proper time value for all kinds of
> platforms. So I agree on involve $LTP_TIMEOUT_MUL to exp backoff macro.

> Btw, shouldn't we also apply this change to the C prototype too?
> On Fri, Jul 12, 2019 at 9:43 PM Petr Vorel <pvorel@suse.cz> wrote:
Yes, you're right.

> > ...

> -                       tst_brk TBROK "\"$tst_fun\" timed out"
> > +                       tst_brk TBROK "\"$tst_fun\" timed out! If you are
> > running on slow machine, try exporting LTP_TIMEOUT_MUL"


> "..., try exporting LTP_TIMEOUT_MUL > 1" ?
Yes, that's better description.

=> I'll prepare v2.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
