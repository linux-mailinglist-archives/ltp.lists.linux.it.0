Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 006336E306
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 11:01:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB7FF3C1D15
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 11:01:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 67C8D3C1C81
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 11:01:32 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0BC536013FC
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 11:01:33 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3297BAF03;
 Fri, 19 Jul 2019 09:01:30 +0000 (UTC)
Date: Fri, 19 Jul 2019 11:01:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190719090133.GB30204@dell5510>
References: <20190718083943.7687-1-pvorel@suse.cz>
 <CAEemH2etXFYC-R1znaKCm_WyQDvAqT0fZafKLJGzTUU6uMEN1A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2etXFYC-R1znaKCm_WyQDvAqT0fZafKLJGzTUU6uMEN1A@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] shell: Use $LTP_TIMEOUT_MUL also in retry
 functions
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

> > + That page is too long and without table of contents (not easy to
> > navigate in it; I tried to add TOC, but without success). Maybe adding
> > TOC or split the page to 3: 1) general info 2) C API 3) shell API would
> > help. WDYT?


> Personally, I think adding TOC may be a better choice, since we don't have
> the whole picture for the guidelines and usually hard to navigate in it.

> To split the guideline that probably leads to the new LTP-user to read more
> document pages. That's an annoying thing for me at least :).
Agree. I'll give TOC next try sooner or later :).

...
> >  _tst_setup_timer()
> >  {
> > -       LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
> > -
> >         local sec=$((300 * LTP_TIMEOUT_MUL))


> Maybe we need to check if the LTP_TIMEOUT_MUL is valid(>1) as what we do
> for C API?
Correct, sorry for omitting that => v3 needed.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
