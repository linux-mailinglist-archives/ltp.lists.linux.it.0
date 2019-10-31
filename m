Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D56EEAC5A
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 10:09:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D5493C22C9
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 10:09:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B7CE43C229C
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 10:09:36 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 839A01001195
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 10:09:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DE223B63D;
 Thu, 31 Oct 2019 09:09:35 +0000 (UTC)
Date: Thu, 31 Oct 2019 10:09:34 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191031090934.GB15784@dell5510>
References: <20190925094721.18932-1-chrubis@suse.cz>
 <20190925135634.GA32581@dell5510>
 <575273995.9684474.1572426415443.JavaMail.zimbra@redhat.com>
 <1665612504.9724602.1572440600772.JavaMail.zimbra@redhat.com>
 <20191030144649.GA25642@dell5510>
 <116299070.9793183.1572457283737.JavaMail.zimbra@redhat.com>
 <CAEemH2dO95d2_CZyMpE4fM8CcC+p0ou9XfA43sS9fX0LmQBWoQ@mail.gmail.com>
 <2003376860.9886044.1572511989903.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2003376860.9886044.1572511989903.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/acct02: Check read size.
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

Hi Jan,

> > How much time of the ac_btime shaking to be tolerated is proper?

> I wanted to go with 1 sec:

> @@ -83,7 +83,7 @@ static int verify_acct(void *acc, int elap_time)
>                 ret = 1;
>         }

> -       if (ACCT_MEMBER(ac_btime) < start_time) {
> +       if (ACCT_MEMBER(ac_btime) + 1 < start_time) {
>                 tst_res(TINFO, "ac_btime < %d (%d)", start_time,
>                         ACCT_MEMBER(ac_btime));
>                 ret = 1;

Ack.

> > > race-y in environments with higher steal time:


> > I'm sorry, what does it mean here?

> I was referring to failed check below. s390 is scarce resource
> and when over-committed, sleeps are less consistent.
> E.g. sleep(1) taking 2+ seconds:
>   nanosleep({1, 0}, NULL) = 0 <1.926617>

Lol :)

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
