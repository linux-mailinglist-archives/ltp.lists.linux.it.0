Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3F6D7294
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 11:54:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A4043C225A
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 11:54:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 2D6573C2215
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 11:54:07 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BEC201A0115C
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 11:54:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2A03AADD5;
 Tue, 15 Oct 2019 09:54:06 +0000 (UTC)
Date: Tue, 15 Oct 2019 11:54:05 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20191015095405.GB14021@rei>
References: <20191014112522.24548-1-chrubis@suse.cz>
 <20191014112522.24548-2-chrubis@suse.cz>
 <CAEemH2e+xD2OCFZs14ejmppKu2rLXKsr16Vfc3tqw-YoesWuJg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2e+xD2OCFZs14ejmppKu2rLXKsr16Vfc3tqw-YoesWuJg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: Add support for test tags
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
> > +static void print_test_info(void)
> >
> 
> print_test_info sounds like general information for the test, maybe
> print_tags() is a better/precise name?

I named it as such in a case that we will add anything else there, but I
do not have a strong opinion, I can change that if you insist.

> > +static void print_failure_hints(void)
> > +{
> > +       unsigned int i;
> > +       const struct tst_tag *tags = tst_test->tags;
> > +
> > +       if (!tags)
> > +               return;
> > +
> > +       for (i = 0; tags[i].name; i++) {
> > +               if (!strcmp(tags[i].name, "linux-git")) {
> > +                       printf("\n");
> > +                       print_colored("HINT: ");
> 
> +                       printf("This is a regression test for linux kernel,
> > see commit:\n\n"
> > +                              LINUX_GIT_URL "%s\n", tags[i].value);
> >
> 
> This sentence 'HINT: This is a ...' will be printed many times if there are
> many commits in tags, I prefer to see only once in front of these
> linux-kernel links.

Good catch, I will do something about this.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
