Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DC1F78CD
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 17:30:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07BDC3C1815
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 17:30:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 9B4123C0FE7
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 17:30:32 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 79201140181C
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 17:30:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573489830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxtiHhhckPO0Ez6hryldOZDHVKwepCUzzpuSqMQIBnQ=;
 b=NzcUpMn2LLDMsUUEEpD6cL/f7vP7tyjH6IdOy5+wI4lcPhWnsoC9C4iHuXVGtUwoCl2Axb
 48t4pS37hAxGXph042zlJAp7F7qtWd/HCjnc9QLkVU47MgD1N8O+iqvlBsRJwIbw2oQHLC
 AAI6BPV+brg7gwECEFaQdnHbxDlhSow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-RxRvtZXkNaC2U7Lsof2o_Q-1; Mon, 11 Nov 2019 11:30:28 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C09501005509;
 Mon, 11 Nov 2019 16:30:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA1EF600CC;
 Mon, 11 Nov 2019 16:30:27 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 661924BB5B;
 Mon, 11 Nov 2019 16:30:27 +0000 (UTC)
Date: Mon, 11 Nov 2019 11:30:26 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1059626680.11523678.1573489826970.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191111150928.GA16894@rei.lan>
References: <18ef4352ad8e03719e5bd470825d912569813aa4.1573476808.git.jstancek@redhat.com>
 <20191111150928.GA16894@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.4]
Thread-Topic: futex_cmp_requeue01: fix test expectations
Thread-Index: oGOdgVVlEUSwOHgq2X9UcKzVbTDsDw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: RxRvtZXkNaC2U7Lsof2o_Q-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] futex_cmp_requeue01: fix test expectations
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
> Shouldn't these be volatile? Or does the tst_atomic_load() guarantee
> that compiler knows that it could be changed from a different process?

That should be implied. Our fallback functions issue compiler barriers too.

> 
> >  static struct tcase {
> >  	int num_waiters;
> > @@ -37,14 +38,28 @@ static struct tcase {
> >  
> >  static void do_child(void)
> >  {
> > -	struct timespec usec = tst_ms_to_timespec(2000);
> > +	int max_sleep_ms = 5000, slept_for_ms = 0;
> 
> We do have a tst_multiply_timeout() in the test library now, shouldn't
> we use it for the max_sleep_ms here as well?
> 
> Also if we do that it would make sense to keep the timeout in global and
> initialize it in the parent, that would save us some runtime.

OK, I can add that.

> >  	num_requeues = futex_wake(&futexes[1], tc->num_waiters, 0);
> >  	num_waits = futex_wake(&futexes[0], tc->num_waiters, 0);
> >  
> >  	for (i = 0; i < tc->num_waiters; i++) {
> > +		tst_atomic_store(1, test_done);
> 
> What's the point of storing the value in the loop, shouldn't it suffice
> to do it once before the loop?

Yes. I previously used kill() here for each child. When I changed that
I forgot to move it out of loop.

> 
> >  		SAFE_WAITPID(pid[i], &status, 0);
> >  		if (WIFEXITED(status) && !WEXITSTATUS(status))
> >  			num_total++;
> >  	}
> >  
> > +	tst_res(TINFO, "children woken, futex0: %d, futex1: %d, "
> > +		"spurious wakeups: %d",
> > +		num_waits, num_requeues, tst_atomic_load(spurious));
> 
> I guess that we do not need atomic access once all the children are
> waited for.

Strictly no, but it seems more consistent. I don't think we care about
performance impact of it.

> >  
> >  static void cleanup(void)
> >  {
> >  	if (futexes)
> >  		SAFE_MUNMAP((void *)futexes, sizeof(futex_t) * 2);
> > +	if (spurious)
> > +		SAFE_MUNMAP((void *)spurious, sizeof(int) * 2);
> 
> Can't we just use a single page? It should be large enough for both
> futexes and counters...
> 
> I guess that we can as well define a structure with all the parameters
> so that we do only a single mmap() later on.

I'll put it into single struct and single mmap.

Thanks,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
