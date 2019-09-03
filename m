Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DE5A60D1
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 07:50:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A1083C2100
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 07:50:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3998F3C1CCC
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 07:50:46 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 932FE2001D6
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 07:50:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A92C218F3508;
 Tue,  3 Sep 2019 05:50:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A047960BE0;
 Tue,  3 Sep 2019 05:50:42 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7337A1802216;
 Tue,  3 Sep 2019 05:50:42 +0000 (UTC)
Date: Tue, 3 Sep 2019 01:50:41 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <494040796.9629252.1567489841971.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190902145524.GB10860@rei.lan>
References: <20190826111024.19053-1-chrubis@suse.cz>
 <1492475067.8173800.1566829761941.JavaMail.zimbra@redhat.com>
 <20190902145524.GB10860@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.24]
Thread-Topic: Basic eBPF tests
Thread-Index: QwqBBQAReWwSCsfl+UgF/3moC2Z1Og==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Tue, 03 Sep 2019 05:50:42 +0000 (UTC)
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
> > There's one EPERM I can reproduce reliably with bpf_map test, which appears
> > to originate from "bpf_charge_memlock".
> > 
> > There's a deferred component to map freeing, and unchange appears to be
> > part of it:
> >   bpf_map_release
> >     bpf_map_put
> >       INIT_WORK(&map->work, bpf_map_free_deferred);
> >         (deferred) bpf_uncharge_memlock
> > 
> > When I lower max locked memory, it's easy to hit:
> > # ulimit  -l 128; ./bpf_map01 -i 100
> > ...
> > bpf_map01.c:52: CONF: bpf() requires CAP_SYS_ADMIN on this system: EPERM
> > 
> > Can you try bumping max locked memory to some high value and check
> > if that helps your case?
> 
> Looks like this was the case, with high enough value the tests works
> without a problem. The question is if and/or what should be done about
> this...

We can try asking on bpf@vger.kernel.org, if they see it as bug.

I'd push tests with a comment. Or setup() that bumps the limit: whatever
current limit is, add 2MB to it, so single/few iteration(s) should always work.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
