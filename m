Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0F0A011E
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2019 13:58:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3A1F3C1D01
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Aug 2019 13:58:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1E6703C1C68
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 13:58:10 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 361BB201597
 for <ltp@lists.linux.it>; Wed, 28 Aug 2019 13:58:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 83063B620;
 Wed, 28 Aug 2019 11:58:08 +0000 (UTC)
References: <20190823094621.21747-1-rpalethorpe@suse.com>
 <CAEemH2dVf66_sKT4iBSEOXg+yFhpL7mAp4Uar5OT6vmbiMa0ZQ@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2dVf66_sKT4iBSEOXg+yFhpL7mAp4Uar5OT6vmbiMa0ZQ@mail.gmail.com>
Date: Wed, 28 Aug 2019 13:58:08 +0200
Message-ID: <871rx5mrhr.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] capability: Introduce capability API
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
Reply-To: rpalethorpe@suse.de
Cc: Michael Moese <mmoese@suse.com>, LTP List <ltp@lists.linux.it>,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Li,

Li Wang <liwang@redhat.com> writes:

>> The capability will be dropped in between 'setup' and 'run'.
>
> I'm not sure to put this cap function behind 'setup' is a better
> choice.
>
> Although it provides more capability in different test phase and makes
> test flexible, that also involves more complexity for LTP users,
> sometimes test needs to spawn children in the 'setup' and do more
> testing in next 'run' phase, which obviously makes us have to consider
> more in this case writing.

Children will need to drop and check for privs themselves anyway unless
one uses ambient privileges (which I guess could still be overriden by
the environment).

Maybe it would make sense to check for privileges before setup. However
I can't think of a situation where one would want to drop them before
setup. Meanwhile it seems likely that setup requires privs, but the test
should not have them.

>
> Anyway, the patchset looks good. We can do some improvements in real
> situations then.
>
>     Acked-by: Li Wang <liwang@redhat.com>


--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
