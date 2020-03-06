Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AF07417BF6E
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 14:45:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2812A3C63CB
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 14:45:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 880333C63A8
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 14:45:04 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E90AC201174
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 14:45:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 30106B2AE;
 Fri,  6 Mar 2020 13:45:03 +0000 (UTC)
References: <20200306120021.19997-1-rpalethorpe@suse.com>
 <20200306132011.GA25572@dell5510>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <20200306132011.GA25572@dell5510>
Date: Fri, 06 Mar 2020 14:45:03 +0100
Message-ID: <87lfodfvhc.fsf@our.domain.is.not.set>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] pty: Test data transmission with SLIP line
 discipline
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Petr Vorel <pvorel@suse.cz> writes:

> Hi Richard,
>
> ...
>> +static int set_ldisc(int tty, struct ldisc_info *ldisc)
>> +{
>> +	TEST(ioctl(tty, TIOCSETD, &ldisc->n));
>> +
>> +	if (!TST_RET)
>> +		return 0;
>> +
>> +	if (TST_ERR == EINVAL) {
>> +		tst_res(TCONF | TTERRNO,
>> +			"You don't appear to have the %s TTY line discipline",
>> +			ldisc->name);
>> +	} else {
>> +		tst_res(TBROK | TTERRNO,
> This must be TFAIL now.
> This can be done by person who merges this patch.
>
> BTW as the same function (with corrected TBROK) is
> already in pty03.c (although struct ldisc_info is different).

HHmm, I suppose this also means I should also either check the return
value in open_pty or use tst_brk.


>
> Kind regards,
> Petr


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
