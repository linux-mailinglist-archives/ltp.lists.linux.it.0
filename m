Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B224F2E37
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 13:31:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D866D3C2269
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 13:31:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 13B5D3C104D
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 13:31:54 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 118662016AC
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 13:31:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573129911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t1eBwbTJ5JRYa2LPeswdoy7EATFJqzCwHs7TjDKZU5A=;
 b=PLdQG1iyT2h1oXPjV8TuQH+DRvzSbmcBe8uI+bqi6/ucNc8rlucDY58UeGVJOcldgdNVpz
 5q6PhLzoV8cFbjjB2ZRUTkgk1uVUcTfqow2khyRt5O6NP+z78wS0mkG0a9mD9sCR8KBHuc
 TCes0TkrzglbtF4X+ro3+zU9niWUbaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-fCkuKVpIPX-qLYMJTu-loQ-1; Thu, 07 Nov 2019 07:31:48 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A2F0477;
 Thu,  7 Nov 2019 12:31:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00043600CE;
 Thu,  7 Nov 2019 12:31:47 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id E73D718095FF;
 Thu,  7 Nov 2019 12:31:47 +0000 (UTC)
Date: Thu, 7 Nov 2019 07:31:47 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <181797128.10929989.1573129907706.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191107121520.GC22352@rei.lan>
References: <48e9d0f8ed25dd69dc97fe31c4446a30cd990b06.1572954996.git.jstancek@redhat.com>
 <598814762.10700788.1573034381847.JavaMail.zimbra@redhat.com>
 <20191107121520.GC22352@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.21]
Thread-Topic: tst_process_state_wait: wait for schedstats to settle when state
 == S
Thread-Index: sRLkkdVnrQNwUtB7I821hvyOAoJoTg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: fCkuKVpIPX-qLYMJTu-loQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH/RFC] tst_process_state_wait: wait for schedstats
 to settle when state == S
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
> > hb->lock is locked at this point, and requeue takes it too, so I'm not
> > sure what makes it fail. I've seen testcase fail in at least
> > 2 different ways now. Here's the other one:
> 
> Here is another theory, some of the processes may be sleeping in a
> different place in the kernel, somewhere between the fork() and the
> futex(), and hence we think that they have been suspended on the futex
> but aren't.
> 
> I guess that what we can do is to put a counter in a piece of shared
> memory and increment it from each child just before the futex_wait()
> call and wait in the parent until the counter reached num_waiters.

It does look related to spurious wake ups and fact that test doesn't
change futex value. I raised it on lkml, here's important part:

"If there is an actual use case for keeping the uaddr1 value the same across
a requeue then this needs to be described properly and also needs to be
handled differently and consistently in all cases not just for a spurious
wakeup."

https://lore.kernel.org/lkml/alpine.DEB.2.21.1911070009040.1869@nanos.tec.linutronix.de/T/#m5662b71d7e0d14b6d74137c1da81d774e5035f9a


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
