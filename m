Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C567D3F22
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 14:02:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C39523C2273
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 14:02:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id CCFA93C1447
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 14:02:05 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4177760214F
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 14:02:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 94BC5B43E;
 Fri, 11 Oct 2019 12:02:04 +0000 (UTC)
Date: Fri, 11 Oct 2019 14:02:03 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
Message-ID: <20191011120201.GA26698@dell5510>
References: <20190911085536.25546-1-cfamullaconrad@suse.de>
 <20190911165225.2122-1-cfamullaconrad@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911165225.2122-1-cfamullaconrad@suse.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] tst_test.sh: Use LTP_TIMEOUT_MUL in
 TST_RETRY_FN()
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

Hi Clemens,

> Because of timeout problems when using TST_RETRY_FN() we do now use
> LTP_TIMEOUT_MUL to adopt the timeout value.

> Introduced tst_adjut_timeout function to have a generic place to
> adopt timeout values.

@Li, Cyril, Jan acking this?

Acked-by: Petr Vorel <pvorel@suse.cz>
for whole patchset, with suggestion to use $(( )) instead of $(expr ) [1].
(was used originaly, but when you're touching the code, could you please change it?)

I'm for merging this patchset, but I'd rather merge my "v5 shell: Introduce
TST_TIMEOUT variable" [2] [3] patchset first.
I can rebase this patchset before merge.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1161157/#2258600
[2] https://patchwork.ozlabs.org/patch/1175082/
[3] https://patchwork.ozlabs.org/project/ltp/list/?series=135548&state=*

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
