Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 90657B23D5
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 18:07:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 410143C207B
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 18:07:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D22453C1C9A
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 18:07:17 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B22CE602753
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 18:07:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8328EB6C3;
 Fri, 13 Sep 2019 16:07:15 +0000 (UTC)
Date: Fri, 13 Sep 2019 18:07:13 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190913160713.GA25195@dell5510>
References: <20190906130707.GA7515@rei.lan>
 <CAEemH2frzqyUmgm2mXTG3dusUtggwX4Y3oRBr34p+NCUJFW7_g@mail.gmail.com>
 <20190910130549.GC18210@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910130549.GC18210@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] acct02 failure [was: Re:  LTP Release]
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

Hi,

> > acct02 (s390x):
> > acct02.c:174: INFO: Verifying using 'struct acct_v3'
> > acct02.c:140: INFO: Number of accounting file entries tested: 2
> > acct02.c:145: FAIL: acct() wrote incorrect file contents!

> I can reproduce it here as well, no idea what is wrong there. I guess
> that modifying the test to be more verbose, i.e. to print if we haven't
> matched the pid or if the contents of the structure were wrong would be
> a good start.

I discovered failure on x86_64 on kernel 5.3.0-rc6-3.g8b30bf3-default (openSUSE)
and 5.2.9 (Debian), which or might not be related.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
