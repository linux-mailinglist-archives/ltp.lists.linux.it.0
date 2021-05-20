Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9785138AD07
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 13:55:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C0E7F3C873D
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 13:55:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 516333C2FCD
 for <ltp@lists.linux.it>; Thu, 20 May 2021 13:55:30 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A876F100093A
 for <ltp@lists.linux.it>; Thu, 20 May 2021 13:55:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621511728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uj7wVPzYO+Bab/CL3Oh7cCOxkIxcIler9zQHx6RBGrk=;
 b=FO9snw7MWS3K6qJl8EKmqXwLplJsd4sDFqMS1FUFU6WqClAEiTUGW73IqS4dKaUoZA+gRb
 x6Nj/gvnVSzcQkvgPDxOmoH/KJs1fZRuy7Vl3woP/48fXqNkvA8Y63gdF2q7lPgLL+TWHB
 u4AMlxa2+zqgJf2zYSqqODeKlYC2Dn0=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-7tsE4xHvOMylmDkwKJPAoA-1; Thu, 20 May 2021 07:55:26 -0400
X-MC-Unique: 7tsE4xHvOMylmDkwKJPAoA-1
Received: by mail-oo1-f70.google.com with SMTP id
 o1-20020a4adb610000b029020660e40b70so11011862ood.22
 for <ltp@lists.linux.it>; Thu, 20 May 2021 04:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uj7wVPzYO+Bab/CL3Oh7cCOxkIxcIler9zQHx6RBGrk=;
 b=ZVmnrR8KuyPQ/qlzBhLqiPDEWIICtloyX7XJvOCkXDeKJEv3bMCFgUupXn/i315in2
 U7x6mr34ZNKzGqkinqzcDic8NSHdc1CJxQX4Wr9pR/8+HUW5elPrd7PrdMwjENOkmKz7
 DevPwm/UNB39dbK58Ty/zOjYApIQkuHKKQTTGiiQbUVX2YjJWCTdN2DQF9v++/6BW4hJ
 iFDJoeaYo61R1AQ2O4PVzgJgxIXTSjTyvW/9rzjUBetVzk4mdqu8rQbhIumM/HPMQFMY
 WwMDgnzJgQmKfVcuSYeulvZ0Iwp16Uz0enZnfGuamSsi35yLWdnNuTuNdOnQImNxbzxg
 M0sg==
X-Gm-Message-State: AOAM533tteBfOTqv/uPH6/Kb6z6rQeCZ6F0hJXbfhwA07lSCZXDQSwK4
 WoPkYKCGZKBX6EWtL7s+XqujZJEc/EkGWGueXz72Tz+QI7i3yc6DlbTwHA6526u/uhF7KT2EV2r
 Oj6rMpDicpots5B8AtNF4nHkZr4c=
X-Received: by 2002:a05:6808:8a:: with SMTP id
 s10mr3067158oic.66.1621511725326; 
 Thu, 20 May 2021 04:55:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOEELu69v9QXNbpLlF5l62Kt9mM6LUYpscjwN3XG4wcfhsDIlvw86qQHQ9W+QtDrqjg4h5wkUgxNdieaNY4RY=
X-Received: by 2002:a05:6808:8a:: with SMTP id
 s10mr3067148oic.66.1621511725163; 
 Thu, 20 May 2021 04:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210519131916.314184-1-cascardo@canonical.com>
 <CAASaF6y2XaLjHwfErwez4zo2NYFLoScROGocK0ibH1pVZcia1w@mail.gmail.com>
 <YKZFSfvZK+79K9Pv@yuki>
In-Reply-To: <YKZFSfvZK+79K9Pv@yuki>
From: Jan Stancek <jstancek@redhat.com>
Date: Thu, 20 May 2021 13:55:09 +0200
Message-ID: <CAASaF6zak_WM+vOVxm37e7JqtC-_yuBLA=NftdKpoS0XqPqYeg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mtest06/mmap1: Further limit distant mmap size
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

On Thu, May 20, 2021 at 1:43 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > > Though on recent kernels (starting with 5.2, commit
> > > 8c7829b04c523cdc732cb77f59f03320e09f3386 ("mm: fix false-positive
> > > OVERCOMMIT_GUESS failures"), overcommit accounting allows for allocating up
> > > to MemTotal memory, older kernels have a much more complicated overcommit
> > > guess accounting.
> > >
> > > That leads to mmap failing on small enough systems:
> > >
> > > mmap1.c:205: TBROK: mmap((nil),2088370176,3,34,-1,0) failed: ENOMEM (12)
> > >
> > > Allocating only half of the total memory would generally work on test
> > > systems.
> > >
> > > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> >
> > Thanks for patch.
> >
> > Acked-by: Jan Stancek <jstancek@redhat.com>
>
> Looks safe enough for the release, as far as I can tell the test
> shouldn't care at all where we map the block of memory.
>
> Jan looks like you originaly wrote the test, do you agree that this
> should go in now?

That's fine by me. As you said, the change in size doesn't matter that
much for the test.

>
> --
> Cyril Hrubis
> chrubis@suse.cz
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
