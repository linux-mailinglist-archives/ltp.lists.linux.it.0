Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAEEEE59E
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 18:13:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D7D13C2509
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 18:13:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id CC9DA3C2426
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 18:13:29 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 1E5F71400BE0
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 18:13:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572887607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGtp9OxGgQfYwCb3siy3+oXDeZPxdDGNqz9BpEOw/KU=;
 b=NXpJODoZrqAZGbDvb3M2S8r84B6mWal+UFpBlmdSG/9PjItJdge7um7X2bO7KFknX+Cw1t
 4oYZZBtlIbiFMOq2LRKXrnkDm+6/VLzfREs7KMXxflkV9HgcMoe3FcIDd80MvFuosmqnb6
 jd9unZegojXEmrpBTmOr20qyKN7zWDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-gSlXpJ9kNqmcAykTCpxkhA-1; Mon, 04 Nov 2019 12:13:24 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87B79800C73;
 Mon,  4 Nov 2019 17:13:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79C0160E1C;
 Mon,  4 Nov 2019 17:13:23 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6E5FA4BB5C;
 Mon,  4 Nov 2019 17:13:23 +0000 (UTC)
Date: Mon, 4 Nov 2019 12:13:23 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <865262542.10390848.1572887603246.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191104160951.GB5683@rei.lan>
References: <4e93b0d943960d957b71bdb998b33ad30424b07c.1572881777.git.jstancek@redhat.com>
 <20191104155900.GA5683@rei.lan> <20191104160951.GB5683@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.3]
Thread-Topic: read_all_sys: skip debugfs
Thread-Index: N3qNjSbowugGYtZZ6ILZor9W3bOEYA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: gSlXpJ9kNqmcAykTCpxkhA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] read_all_sys: skip debugfs
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
> > >  read_all_dev read_all -d /dev -p -q -r 10
> > >  read_all_proc read_all -d /proc -q -r 10
> > > -read_all_sys read_all -d /sys -q -r 10 -e /sys/power/wakeup_count
> > > +read_all_sys read_all -d /sys -q -r 10 -e /sys/power/wakeup_count -e
> > > '/sys/kernel/debug/*'
> > 
> > Do we even support multiple parameters for the same option?
> > 
> > I looked that the library code and I would say that we will replace the
> > value with each iteration which means that we will effectively use the
> > last one.
> 
> Maybe we should even catch the case where user passed one option twice with:

Or WARN that option might be overwritten. Anyway, it sounds like good idea.

> 
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index c7b46d0d5..e1c841585 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -468,6 +468,9 @@ static void parse_topt(unsigned int topts_len, int opt,
> char *optarg)
>         if (i >= topts_len)
>                 tst_brk(TBROK, "Invalid option '%c' (should not happen)",
>                 opt);
>  
> +       if (*(toptions[i].arg))
> +               tst_brk(TBROK, "Option already set!");
> +
>         *(toptions[i].arg) = optarg ? optarg : "";
>  }
> 
> 
> --
> Cyril Hrubis
> chrubis@suse.cz
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
