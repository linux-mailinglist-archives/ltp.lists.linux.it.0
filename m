Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1230C2E928B
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 10:24:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C74993C3201
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 10:24:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 5FBD53C298E
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 10:24:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F2C09200992
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 10:24:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5F682AD11;
 Mon,  4 Jan 2021 09:24:42 +0000 (UTC)
References: <20201216100121.16683-1-rpalethorpe@suse.com>
 <20201216100121.16683-3-rpalethorpe@suse.com>
 <CAEemH2ddomP4XO=61vNx5=3vQYNj4WOurUX2zcuC-46RxhMk0g@mail.gmail.com>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2ddomP4XO=61vNx5=3vQYNj4WOurUX2zcuC-46RxhMk0g@mail.gmail.com>
Date: Mon, 04 Jan 2021 09:24:41 +0000
Message-ID: <87eej1dpgm.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/5] CGroup API rewrite
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
Reply-To: rpalethorpe@suse.de
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Li,

Li Wang <liwang@redhat.com> writes:

>>
>
> As I was mentioned in 0/5 that maybe we should create test_cgroup_dir
> for different progress so that the test could use the same controller with
> various configurations in parallel.
>
> e.g. child_1 set SIZE to memory.limit_in_bytes
>        child_2 set SIZE/2 to memory.limit_in_bytes
>
> Any possibility to move this to tst_cgroup_move_current?

Yes I suppose we can try this. Is there a test which already requires it?

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
