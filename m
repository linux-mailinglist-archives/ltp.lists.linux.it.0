Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02449D113D
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 16:29:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B7933C228D
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 16:29:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4E32E3C209D
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 16:29:50 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6F6FF1A01520
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 16:29:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DAF1818CCEEF;
 Wed,  9 Oct 2019 14:29:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1D19194B6;
 Wed,  9 Oct 2019 14:29:48 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C899E4E589;
 Wed,  9 Oct 2019 14:29:48 +0000 (UTC)
Date: Wed, 9 Oct 2019 10:29:48 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1367025665.5372558.1570631388627.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191009135656.GD7561@rei.lan>
References: <26d555b1d9deddb5a6f0a93a7c7d3b00e8abc1ff.1570616598.git.jstancek@redhat.com>
 <20191009135656.GD7561@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.157, 10.4.195.19]
Thread-Topic: read_all: retry to queue work for any worker
Thread-Index: rB0Tz7aTIXpBCQD8GEjTw2rAY5yakg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Wed, 09 Oct 2019 14:29:48 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] read_all: retry to queue work for any worker
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
> > +static void work_push_retry(int worker, const char *buf)
> > +{
> > +	int i, ret, worker_min, worker_max;
> > +
> > +	if (worker < 0) {
> > +		/* pick any, try -worker first */
> > +		worker_min = worker * (-1);
> > +		worker_max = worker_count;
> > +	} else {
> > +		/* keep trying worker */
> > +		worker_min = worker;
> > +		worker_max = worker + 1;
> > +	}
> > +	i = worker_min;
> > +
> > +	for (;;) {
> > +		ret = queue_push(workers[i].q, buf);
> > +		if (ret == 1)
> > +			break;
> > +
> > +		if (++i >= worker_max) {
> > +			i = worker_min;
> > +			usleep(100000);
> 
> 
> My only concern is that we sleep for too long here. Maybe we should
> start with smaller sleep here and increase it after a while.
> 
> Or have you checked that the tests runs as fast as if we had smaller
> sleep here?

Small benchmark shows that smaller sleep can complete faster. I'll send v2.

> 
> > +		}
> > +	}
> > +}
> > +
> >  static void stop_workers(void)
> >  {
> >  	const char stop_code[1] = { '\0' };
> > @@ -292,7 +319,7 @@ static void stop_workers(void)
> >  
> >  	for (i = 0; i < worker_count; i++) {
> >  		if (workers[i].q)
> > -			TST_RETRY_FUNC(queue_push(workers[i].q, stop_code), 1);
> > +			work_push_retry(i, stop_code);
> >  	}
> >  
> >  	for (i = 0; i < worker_count; i++) {
> > @@ -310,7 +337,7 @@ static void rep_sched_work(const char *path, int rep)
> >  	for (i = j = 0; i < rep; i++, j++) {
> >  		if (j >= worker_count)
> >  			j = 0;
> > -		TST_RETRY_FUNC(queue_push(workers[j].q, path), 1);
> > +		work_push_retry(-j, path);
> >  	}
> >  }
> >  
> > --
> > 1.8.3.1
> > 
> > 
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
> 
> --
> Cyril Hrubis
> chrubis@suse.cz
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
