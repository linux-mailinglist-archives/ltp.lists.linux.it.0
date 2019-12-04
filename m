Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7D91129DD
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2019 12:11:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4EE8B3C2500
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2019 12:11:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id EAA1A3C2439
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 12:10:58 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 786561A03FDF
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 12:10:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B7DA0B18D;
 Wed,  4 Dec 2019 11:10:56 +0000 (UTC)
Date: Wed, 4 Dec 2019 12:10:56 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20191204111056.GB32161@rei.lan>
References: <20191128084506.7587-1-liwang@redhat.com>
 <20191203104917.GA2844@rei>
 <CAEemH2d0KJ_oi7j5sjcT=uUo28crB_hCs-gJzvWhczvKOG-mdA@mail.gmail.com>
 <CAEemH2doR7C6J4ROgLw=cJsWfH2-6y8-YwDwdGM8coH6ovM6_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2doR7C6J4ROgLw=cJsWfH2-6y8-YwDwdGM8coH6ovM6_Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.7 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PDS_BTC_ID, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: add tst_request_hugepages
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > if the .needs_hugepages is set to an expected number, we should verify
> > strictly if the system can provide that.
> >
> 
> Oh, I guess maybe I misunderstand your suggestion here. you mean just to
> let .needs_hugepages = 1 but not set an expected number, right? if so, that
> will more easy to achieve.

We do have tests that needs more than 1 hugepage, there are tests that
do numa migration so we likely need the needs_hugepages to be unsigned
integer that represents the number of required hugepages.

> >> Also this fails to cleanup after itself, we have to restore the system
> >> after the test, which is one more reason why we need .needs_hugepages in
> >> the tst_test structure because the test library can cleanup after the
> >> test with that.
> >>
> >
> > Agree, I will add the save/restore part for this.
> >
> 
> Or just go with .save_restore in the testcase?

I guess that best option would be to call tst_sys_conf_save_str() in the
test library if we decided to change the nr_hugepages file.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
