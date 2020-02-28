Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 938D2173330
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 09:46:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BD563C6ABF
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 09:46:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 1BF343C22CB
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 09:46:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 48B7E605628
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 09:46:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A2E91B25D;
 Fri, 28 Feb 2020 08:46:42 +0000 (UTC)
Date: Fri, 28 Feb 2020 09:46:41 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200228084641.GA8041@dell5510>
References: <20200227163922.317-1-pvorel@suse.cz>
 <CAEemH2fQ_oc8iEaKQV9pJgbfeOoq3yT7hqcGCmWK2JwMeRkzCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fQ_oc8iEaKQV9pJgbfeOoq3yT7hqcGCmWK2JwMeRkzCQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] Avoid using tst_res(TBROK)
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

> This patch looks good.
Thanks, I'll add your ack.

> But something wrong in patch applying, you probably need to do git rebase:).
>     error: patch failed:
> testcases/kernel/syscalls/gettimeofday/gettimeofday02.c:48
>     error: testcases/kernel/syscalls/gettimeofday/gettimeofday02.c: patch
> does not apply

I've also noticed (my night push conflicted).
I've rebased it in my LTP fork.
https://github.com/pevik/ltp/commits/tst_res-allowed-flags

I didn't want to sent v2 until we agree about docs
(or I could push this rebased one if others ack it).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
