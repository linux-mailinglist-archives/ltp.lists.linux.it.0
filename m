Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C030A6486
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 10:58:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19DBD3C2100
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 10:58:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id D042D3C0889
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 10:58:19 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EEB2A1000C69
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 10:58:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EF1C7B63D;
 Tue,  3 Sep 2019 08:58:16 +0000 (UTC)
Date: Tue, 3 Sep 2019 10:58:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190903085814.GA23372@rei.lan>
References: <20190826111024.19053-1-chrubis@suse.cz>
 <1492475067.8173800.1566829761941.JavaMail.zimbra@redhat.com>
 <20190902145524.GB10860@rei.lan>
 <494040796.9629252.1567489841971.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <494040796.9629252.1567489841971.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 0/4] Basic eBPF tests
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > There's one EPERM I can reproduce reliably with bpf_map test, which appears
> > > to originate from "bpf_charge_memlock".
> > > 
> > > There's a deferred component to map freeing, and unchange appears to be
> > > part of it:
> > >   bpf_map_release
> > >     bpf_map_put
> > >       INIT_WORK(&map->work, bpf_map_free_deferred);
> > >         (deferred) bpf_uncharge_memlock
> > > 
> > > When I lower max locked memory, it's easy to hit:
> > > # ulimit  -l 128; ./bpf_map01 -i 100
> > > ...
> > > bpf_map01.c:52: CONF: bpf() requires CAP_SYS_ADMIN on this system: EPERM
> > > 
> > > Can you try bumping max locked memory to some high value and check
> > > if that helps your case?
> > 
> > Looks like this was the case, with high enough value the tests works
> > without a problem. The question is if and/or what should be done about
> > this...
> 
> We can try asking on bpf@vger.kernel.org, if they see it as bug.

Let's start with this, it would be a bit nicer if it returned EAGAIN
instead of EPERM at least. Will you send the email or should I?

> I'd push tests with a comment. Or setup() that bumps the limit: whatever
> current limit is, add 2MB to it, so single/few iteration(s) should always work.

Let's go with a comment for now, we can add code later on once we are
clear on what is the expected outcome.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
