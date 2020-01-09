Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2920135625
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 10:49:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 42F183C24D4
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 10:49:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0BA523C2456
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 10:49:19 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B38D31A00989
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 10:49:18 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0A385C126;
 Thu,  9 Jan 2020 09:49:18 +0000 (UTC)
Date: Thu, 9 Jan 2020 10:49:16 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200109094916.GA31981@rei.lan>
References: <20200107071324.29492-1-liwang@redhat.com>
 <20200107101119.GA22967@rei.lan>
 <CAEemH2fmmQ2a0EVHoqkMwMOjy5EZoiNT+02yYRz-TnWpTQ__0A@mail.gmail.com>
 <20200108112537.GA22954@dell5510> <20200108113535.GA17272@rei.lan>
 <CAEemH2dZ0pVqpaecjO06stw8RiK-hmSUWwo=kndm3EsvoXCW2w@mail.gmail.com>
 <20200108114141.GB17272@rei.lan> <20200108114545.GA28867@dell5510>
 <CAEemH2dUhpixZoorh_-H1CHenk9-XG9ZocjHB30RqzW_Kb0dCw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dUhpixZoorh_-H1CHenk9-XG9ZocjHB30RqzW_Kb0dCw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_device: add new tst_dev_sync
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
> The reason why not use tst_syscall() is that involves a new compile error
> of tst_brk, and it can not get rid of errors only via include tst_test.h
> file.

The problem is that the header is used both for old and new test API, so
until we convert the rest of the oldlib testcases we can't use anything
from the new library there.

We solve that in other places by ifdefs, such as:

#ifdef TST_TEST_H__
	tst_syscall(...);
#else
	ltp_syscall(...);
#endif


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
