Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 71067296A27
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 09:18:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD0033C5673
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Oct 2020 09:18:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 61EDE3C23C7
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 09:18:40 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BBFE1200B3E
 for <ltp@lists.linux.it>; Fri, 23 Oct 2020 09:18:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC10EABD1;
 Fri, 23 Oct 2020 07:18:38 +0000 (UTC)
Date: Fri, 23 Oct 2020 09:18:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20201023071836.GA2310@x230>
References: <5F913024.7050303@cn.fujitsu.com>
 <1603352029-11446-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2enndeLbZ8Kr8EgVEc1OF7znrtB4vJwpacpBxyTY7YdGA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2enndeLbZ8Kr8EgVEc1OF7znrtB4vJwpacpBxyTY7YdGA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Remove ftime and sys/timeb.h
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

Hi all,

> Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

> > The two case uses ftime to get the current milliseconds and it was
> > used to generate random value. Using gettimeofday() to get the microseconds
> > can reach the same aim.

> > This also fixes the travis build error[1] on Fedora:Rawhide because the <sys/timeb.h>
> > has been deprecated[2].

> > [1] https://travis-ci.org/github/linux-test-project/ltp/jobs/737698948
> > [2] https://www.spinics.net/lists/fedora-devel/msg279545.html

> > Reviewed-by: Li Wang <liwang@redhat.com>
> > Acked-by: Jan Stancek <jstancek@redhat.com>
> > Acked-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
> > Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

> Pushed, thanks!
Thanks for handling these!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
