Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5054CF70F9
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 10:41:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 21BCC3C1840
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 10:41:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A92AB3C14F2
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 10:41:38 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 05FC8100114C
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 10:41:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573465296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xH9paoH84WAP3S/ATWHs4L3GR0FO8tvE2c1L9kietRg=;
 b=JqdEErT9cwFYr3CMZgBawGC4ZWMKWqG7hNf49a4Zb4h2m5G30ymEJKS8cZVAX2uqGArDE0
 of9xl9Q6q8mFhfMiC9Kga9uiOd3BhvPrXmH0c6PB2jW3VppZy8JjdqC77VjCUK6N05VwKv
 JQmMQJ9YvqrXIaA6TRDQU9ng+ppFejs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-_hgx6tiHOsGX5hz3cbUKkA-1; Mon, 11 Nov 2019 04:41:35 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BA28477;
 Mon, 11 Nov 2019 09:41:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 103AE5DA7D;
 Mon, 11 Nov 2019 09:41:34 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED0854BB5C;
 Mon, 11 Nov 2019 09:41:33 +0000 (UTC)
Date: Mon, 11 Nov 2019 04:41:33 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Message-ID: <475677126.11444968.1573465293662.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191107125559.GI4131@hirez.programming.kicks-ass.net>
References: <a87876829697e1b3c63601b1401a07af79eddae6.1572651216.git.jstancek@redhat.com>
 <20191107123224.GA6315@hirez.programming.kicks-ass.net>
 <alpine.DEB.2.21.1911071335320.4256@nanos.tec.linutronix.de>
 <20191107125559.GI4131@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.4]
Thread-Topic: kernel: use ktime_get_real_ts64() to calculate acct.ac_btime
Thread-Index: j00i/ne0YYWt2EQwNR0Jpc5QU9IvTg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: _hgx6tiHOsGX5hz3cbUKkA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] kernel: use ktime_get_real_ts64() to calculate
 acct.ac_btime
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
Cc: kstewart@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, rfontana@redhat.com, viro@zeniv.linux.org.uk,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> It's wrecked in general. It also jumps around for any REALTIME
> adjustment.
> 
> > So a CLOCK_REALTIME time stamp at fork would at least be correct
> > vs. suspend resume.
> 
> But still wrecked vs REALTIME jumps, as in, when DST flips the clock
> back an hour, your timestamp is in the future.
> 
> Any which way around the whole thing is buggered.  The only real fix is
> not using REALTIME anything. Which is why I'm loath to add that REALTIME
> timestamp at fork(), it just encourages more use.

Thank you for feedback and listing all other problems.
I'll adjust test expectations.

Regards,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
