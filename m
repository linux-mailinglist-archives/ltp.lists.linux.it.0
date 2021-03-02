Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9BB329940
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 11:17:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 832063C56EE
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 11:17:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 4B8213C0BCB
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 11:17:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F0BE51A00CC7
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 11:17:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 43FDBABF4;
 Tue,  2 Mar 2021 10:17:20 +0000 (UTC)
Date: Tue, 2 Mar 2021 11:17:18 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YD4QrlVCIJOYj0ze@pevik>
References: <20210301220222.22705-1-pvorel@suse.cz>
 <20210301220222.22705-6-pvorel@suse.cz>
 <CAEemH2cr0TFvFiis_05Fh4bEe1ZUmFtMO5ysYFped5ZQYucvAg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cr0TFvFiis_05Fh4bEe1ZUmFtMO5ysYFped5ZQYucvAg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/7] tst_test.sh: Introduce
 tst_set_timeout(timeout)
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

...
> > +tst_set_timeout()
> > +{
> > +       TST_TIMEOUT="$1"


> Not sure if we should check "$1" is valid again before using it.
General check for int is done in _tst_setup_timer, but that's not what you mean.

> I guess in most scenarios, the function is invoked by tests, so
> just needs to guarantee $1 > $TST_TIMEOUT, otherwise, it
> looks meaningless to reset TST_TIMEOUT?
> (especially to avoid people set a smaller value by a typo)

I thought it's not necessary. TST_TIMEOUT is meant to be set in the test. But we
currently don't check for that (it can be wrongly set as environment variable)
and it'd be difficult to check that (I'd prefer not grep $TST_TEST_PATH, because
that would not work for shell libraries (e.g. zram_lib.sh).

The main reason for me is that C API allows to set lower value in the code, thus
I didn't want to prevent it in the shell => it'd be a diverse from C API.
We could add warning: "don't set TST_TIMEOUT" in docs and print warning/reset it
in runltp and runltp-ng, but that would not protect when running test itself.
It's really hard trying to have at least similar API with two fairly different
languages :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
