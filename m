Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1BEA660E
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 11:51:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E2A403C20F9
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 11:51:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 066A23C20B3
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 11:51:25 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 33032200C23
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 11:51:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6A706307D945;
 Tue,  3 Sep 2019 09:51:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60B111001947;
 Tue,  3 Sep 2019 09:51:23 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5792F41F4D;
 Tue,  3 Sep 2019 09:51:23 +0000 (UTC)
Date: Tue, 3 Sep 2019 05:51:23 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <234819244.9657867.1567504283131.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190903085814.GA23372@rei.lan>
References: <20190826111024.19053-1-chrubis@suse.cz>
 <1492475067.8173800.1566829761941.JavaMail.zimbra@redhat.com>
 <20190902145524.GB10860@rei.lan>
 <494040796.9629252.1567489841971.JavaMail.zimbra@redhat.com>
 <20190903085814.GA23372@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.12]
Thread-Topic: Basic eBPF tests
Thread-Index: tl9T123aZq1makSPoETH3pe7MbX1Ug==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 03 Sep 2019 09:51:23 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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



----- Original Message -----
> Hi!
> > > > There's one EPERM I can reproduce reliably with bpf_map test, which
> > > > appears
> > > > to originate from "bpf_charge_memlock".
> > > > 
> > > > There's a deferred component to map freeing, and unchange appears to be
> > > > part of it:
> > > >   bpf_map_release
> > > >     bpf_map_put
> > > >       INIT_WORK(&map->work, bpf_map_free_deferred);
> > > >         (deferred) bpf_uncharge_memlock
> > > > 
> > > > When I lower max locked memory, it's easy to hit:
> > > > # ulimit  -l 128; ./bpf_map01 -i 100
> > > > ...
> > > > bpf_map01.c:52: CONF: bpf() requires CAP_SYS_ADMIN on this system:
> > > > EPERM
> > > > 
> > > > Can you try bumping max locked memory to some high value and check
> > > > if that helps your case?
> > > 
> > > Looks like this was the case, with high enough value the tests works
> > > without a problem. The question is if and/or what should be done about
> > > this...
> > 
> > We can try asking on bpf@vger.kernel.org, if they see it as bug.
> 
> Let's start with this, it would be a bit nicer if it returned EAGAIN
> instead of EPERM at least. Will you send the email or should I?

If you don't mind please send the email. You know those tests better,
and your environment seems to have lower (/lowest) default value.

> 
> > I'd push tests with a comment. Or setup() that bumps the limit: whatever
> > current limit is, add 2MB to it, so single/few iteration(s) should always
> > work.
> 
> Let's go with a comment for now, we can add code later on once we are
> clear on what is the expected outcome.

Sounds good.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
