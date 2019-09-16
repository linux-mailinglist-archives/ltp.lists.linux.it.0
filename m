Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0DCB3851
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Sep 2019 12:38:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00D273C2077
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Sep 2019 12:38:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C790D3C1774
 for <ltp@lists.linux.it>; Mon, 16 Sep 2019 12:38:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3DD5C600070
 for <ltp@lists.linux.it>; Mon, 16 Sep 2019 12:38:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B0913ABD0;
 Mon, 16 Sep 2019 10:38:40 +0000 (UTC)
Message-ID: <1568630275.3028.23.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
In-Reply-To: <20190913125823.17314-1-pvorel@suse.cz>
References: <20190913125823.17314-1-pvorel@suse.cz>
Date: Mon, 16 Sep 2019 12:37:55 +0200
Mime-Version: 1.0
X-Mailer: Evolution 3.26.6 
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/3] LTP_TIMEOUT for shell API
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
Reply-To: cfamullaconrad@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, 2019-09-13 at 14:58 +0200, Petr Vorel wrote:
<snip>
> Questions:
> * I don't know how to detect TST_TIMEOUT settings made by user.
> That's
> the difference from C, where user cannot overwrite tst_test->test.
> Am I missing something or it's not possible to detect whether
> variable
> was set in code or by user?
> Maybe that was the reason TST_TIMEOUT wasn't set, but rather fixed.

Maybe we could initialize all variables in tst_test.sh. So we overwrite
 values given by user/environment. But I in general I think, if someone
play with TST_* variables, it's up to him what happen.
And you already added this WARNING!

> * Code allowing $LTP_TIMEOUT_MUL being also float making code a bit
> complex. If you don't like it, I suggest to change $LTP_TIMEOUT_MUL
> being for both C and shell integer, but I'd prefer the possibility to
> be float.
> (it's might be handy being able to set timeout 1.33x which is far
> less
> than 2x for int).

I also don't see the need of such fine granular multiplier.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
