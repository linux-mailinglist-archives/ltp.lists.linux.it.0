Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FE86A698
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 12:31:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C83F3C1D24
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 12:31:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 81A143C02C2
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 12:31:54 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6A9D01401451
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 12:31:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7632BAE20;
 Tue, 16 Jul 2019 10:31:52 +0000 (UTC)
Date: Tue, 16 Jul 2019 12:31:51 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190716103151.GA14629@rei>
References: <20190711141026.14705-1-mmoese@suse.de>
 <CAEemH2cjr23TZUDNLAt2Vvk03W8sHNy+eaJT6YYXSFU+KxmTvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cjr23TZUDNLAt2Vvk03W8sHNy+eaJT6YYXSFU+KxmTvQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] Add a regression test for CVE-2017-1000380
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
> > +static void setup(void)
> > +{
> > +       tst_fzsync_pair_init(&fzsync_pair);
> > +       tst_taint_init(TST_TAINT_W | TST_TAINT_D);
> > +       snd_fd = SAFE_OPEN("/dev/snd/timer",
> > +                       O_RDONLY|O_CREAT|O_NOCTTY|O_SYNC|O_LARGEFILE, 0);
> >
> 
> Should we check if the file exists before opening it?

Yes we should. We should add access("/dev/snd/timer", F_OK) to the test
setup.

> Otherwise, snd_timer01 failed as:
> 
> # ./snd_timer01
> tst_test.c:1100: INFO: Timeout per run is 0h 05m 00s
> safe_macros.c:225: BROK: snd_timer01.c:73: open(/dev/snd/timer,1052992,00)
> failed: ENOENT
> 
> # lsmod |grep -i snd
> 
> # grep -i snd /boot/config-4.18.0-107.el8.s390x
> 
> # ls /dev/snd/timer
> ls: cannot access '/dev/snd/timer': No such file or directory

I guess that there is no soundcard on mainframe :-).

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
