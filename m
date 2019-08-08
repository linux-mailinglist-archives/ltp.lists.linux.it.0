Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A339385E3B
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 11:27:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6713F3C1D1B
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 11:27:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id EEDE53C176D
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 11:27:34 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1DE551A00A20
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 11:27:33 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6A6C8AE39;
 Thu,  8 Aug 2019 09:27:33 +0000 (UTC)
Date: Thu, 8 Aug 2019 11:27:32 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190808092732.GB11500@rei.lan>
References: <20190801092616.30553-1-chrubis@suse.cz>
 <20190801092616.30553-3-chrubis@suse.cz>
 <CAEemH2d8dEe0km7FA43S2eQYHE00m9advsAbUbmFfixcV0-qhw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2d8dEe0km7FA43S2eQYHE00m9advsAbUbmFfixcV0-qhw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/9] lib: Add a canary for guarded buffers
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
> > +static void check_canary(struct map *map)
> > +{
> > +       size_t i;
> > +       char *buf = map->addr;
> > +
> > +       for (i = 0; i < map->buf_shift/2; i++) {
> > +               if (buf[map->buf_shift - i - 1] != buf[i]) {
> > +                       tst_res(TWARN,
> > +                               "pid %i: buffer modified before address %p %zu",
> > +                               (char*)map->addr + map->buf_shift, i);
> 
> Here you probably missed the getpid() for printing %i match :).

Ah, right, I guess that this is unfinished last minute modification.

Actually as it is the canaries are checked only for the main library pid
becuase the tst_free_all() is hooked up in the do_test_cleanup().

I guess that we should call it in the run_tests() function before we
call exit(0) for the child processes as well as in the tst_vbrk_() and
after that changes printing pid in the warning makes sense.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
