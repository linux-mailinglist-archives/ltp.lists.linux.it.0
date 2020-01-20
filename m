Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4F51428A0
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 11:57:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B99E3C2445
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 11:57:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 468B03C2259
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 11:57:05 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id D45B41000482
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 11:57:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579517823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AfJ1o27z5xIYIC0JCVhZwwWFE/OYtZhBxKxCGE6TLXA=;
 b=EysIHHRAgethKxXRiPN9fWV8/iwE/EFFsAknl7myOW5rAS57ne/lddIUh6lw0l6/HaQqlW
 tgzgTGELuJPI7S+x7Vsj1Dl3PFgO0ZQtYogWvPglHySu5N6EYYiJsuegsR00PYLuuWobL3
 HRAQa8qSuDXuZ8q0dHUSWzK+X/n/X98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-9R5ssVFPNNKkIBYsx9KxTQ-1; Mon, 20 Jan 2020 05:57:01 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47AAB8010CF;
 Mon, 20 Jan 2020 10:57:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ED135C21A;
 Mon, 20 Jan 2020 10:57:00 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8255E81978;
 Mon, 20 Jan 2020 10:56:59 +0000 (UTC)
Date: Mon, 20 Jan 2020 05:56:59 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
Message-ID: <558281761.2778139.1579517819187.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200120103108.GA15405@dell5510>
References: <20200117113715.22786-1-pvorel@suse.cz>
 <20200117113715.22786-3-pvorel@suse.cz> <20200120103108.GA15405@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.5]
Thread-Topic: tst_device.h: Use lapi/syscalls.h instead of <sys/syscall.h>
Thread-Index: 5jyQAqQ1+7i7HOXIqGkPUIzteO9Fqw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 9R5ssVFPNNKkIBYsx9KxTQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] tst_device.h: Use lapi/syscalls.h instead of
 <sys/syscall.h>
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
> >  #include <unistd.h>
> > -#include <sys/syscall.h>
> > +#include "lapi/syscalls.h"
> Hm, maybe this fix wasn't a good idea.
> It effectively uses lapi/syscalls.h everywhere instead of <sys/syscall.h>.
> Not sure if this is what we want.

We already include lapi/syscalls.h at several places, so I wouldn't expect
this to be as bad.

> 
> Example of the error is #634 [1], which is caused by __NR_socketcall being -1
> instead of not defined (socketcall is not defined on some archs, e.g. x86-64
> and ARM).
> We can fix the condition

Tests using tst_syscall or ltp_syscall should be fine, since those check
for ENOSYS.

>, but it will lead to numerous not obvious errors, so
> I
> suggest to revert this (and thus get LTP broken on very old distros).
> 

Cyril, any thoughts?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
