Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3311570BA
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Feb 2020 09:19:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF53F3C25A6
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Feb 2020 09:19:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D7B803C24D8
 for <ltp@lists.linux.it>; Mon, 10 Feb 2020 09:19:19 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 34BF91401126
 for <ltp@lists.linux.it>; Mon, 10 Feb 2020 09:19:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581322757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LGXF6yrxwWGI01ojCD2WlxbDd7FJvGjHse34HMePV3Q=;
 b=LMWiR+7rznDrxwJm677IhgJfnHsgC+f3C2v57knnwphuw6iHq4bMkyC+sydWloCNuuTL1a
 XwvWZHMsyBSo8oms5V1a4gftWXmgY9A94wqiIOn9pCPpS9RxnPAqa+UOulqnZxzGrP6lzn
 VB3qBOti25VKcENlXstPFmnCo6J7eZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-WgxcGSQ_PQ-gCqI834h9uA-1; Mon, 10 Feb 2020 03:19:14 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1807010054E3;
 Mon, 10 Feb 2020 08:19:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DC1E8ED17;
 Mon, 10 Feb 2020 08:19:12 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66E78866D2;
 Mon, 10 Feb 2020 08:19:12 +0000 (UTC)
Date: Mon, 10 Feb 2020 03:19:12 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <748200464.6799894.1581322752135.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200207155730.GB16951@rei.lan>
References: <20200207144105.19947-1-pvorel@suse.cz>
 <20200207152406.GA16951@rei.lan>
 <285421765.6549099.1581090469387.JavaMail.zimbra@redhat.com>
 <20200207155730.GB16951@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.15]
Thread-Topic: safe_macros: Use tst_umount() in safe_umount()
Thread-Index: n0S6DjduhHWYotYPbLqCzddaMDYj9g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: WgxcGSQ_PQ-gCqI834h9uA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 1/2] safe_macros: Use tst_umount() in
 safe_umount()
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
> > > My expectation is that retrying on EBUSY will not break anything. Jan
> > > what do you think?
> > 
> > I agree. Though I'd like to point out that tst_umount() currently loops
> > on any error, not just EBUSY.
> 
> Right, I guess that we should change that to be on the safe side, it was
> never intended to retry anything else than EBUSY.
> 
> What about?
> 
> diff --git a/lib/tst_device.c b/lib/tst_device.c
> index 89b9c96de..52a5b37fd 100644
> --- a/lib/tst_device.c
> +++ b/lib/tst_device.c
> @@ -371,6 +371,9 @@ int tst_umount(const char *path)
>                                  "mounted fs, kill it to speed up tests.");
>                 }
>  
> +               if (err != EBUSY) {
> +                       errno = err;
> +                       return ret;
> +               }
> +
>                 usleep(100000);
>         }

Works for me too, I don't recall seeing anything else than EBUSY.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
