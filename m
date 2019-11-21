Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 56507104E4D
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 09:48:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24B343C1CA3
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 09:48:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C4F8E3C0738
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 09:48:29 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 5D686601D5A
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 09:48:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574326107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3B6GPBrKaWILXGumZIC2Oo/HazyPwHf3bj9o36IRys=;
 b=GrriIby7HlXdDvtjUsdwUORHWLjnwRJ8WnUlXj6S+dmXgX7isq0r5q5RYm5PB+7SYK5LkY
 56xMqbSxSQxDwF1XqmaD8FBfmMZeCQ4It6O/hakdJxW8KZmMNgHvzGrKxYdN0qGV+6CTPL
 7GhdaJOSJo2gUrJX+S/rrxqPPkSALS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-5Xlj6qUcNmaSxJ3LkwLx0w-1; Thu, 21 Nov 2019 03:48:25 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E169107ACC5;
 Thu, 21 Nov 2019 08:48:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84519348C6;
 Thu, 21 Nov 2019 08:48:24 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B0494BB5B;
 Thu, 21 Nov 2019 08:48:24 +0000 (UTC)
Date: Thu, 21 Nov 2019 03:48:24 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <820987732.13285590.1574326104465.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191120123339.GE14963@rei.lan>
References: <cover.1574087532.git.jstancek@redhat.com>
 <5b0f2a837117f3af1351d8b3da357cacecaa1463.1574087532.git.jstancek@redhat.com>
 <20191120123339.GE14963@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.30]
Thread-Topic: perf_event_open02: make do_work() run for specified time
Thread-Index: Ka6xz1m6j12bZF5xEl7rxPI1Jigt4g==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 5Xlj6qUcNmaSxJ3LkwLx0w-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] perf_event_open02: make do_work() run for
 specified time
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
> > -static void do_work(void)
> > +void alarm_handler(int sig LTP_ATTRIBUTE_UNUSED)
> 
> static void ?

Yes

> 
> > +{
> > +	work_done = 1;
> > +}
> > +
> > +static void do_work(int time_ms)
> >  {
> >  	int i;
> > +	struct sigaction sa;
> > +	struct itimerval val;
> >  
> > -	for (i = 0; i < LOOPS; ++i)
> > -		asm volatile (""::"g" (i));
> > -}
> > +	work_done = 0;
> > +	memset(&val, 0, sizeof(val));
> > +	val.it_value.tv_sec = time_ms / 1000;
> > +	val.it_value.tv_usec = (time_ms % 1000) * 1000;
> >  
> > +	sa.sa_handler = alarm_handler;
> > +	sa.sa_flags = SA_RESETHAND;
> > +	SAFE_SIGACTION(SIGALRM, &sa, NULL);
> 
> I would have set up the signal handler just once in the test setup.

I'll move it.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
