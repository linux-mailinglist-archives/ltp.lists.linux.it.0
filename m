Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE45392690
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 06:51:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ABB513C7734
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 06:51:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 06F8D3C2A7B
 for <ltp@lists.linux.it>; Thu, 27 May 2021 06:51:27 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AED74200E1D
 for <ltp@lists.linux.it>; Thu, 27 May 2021 06:51:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622091085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=++JQCrDsWppTWMiYf9kFDQKZRDxKlxh1nZ4AKS1D81g=;
 b=i0dwbyvyLHjTg0VQ8eM8FIYCRaaFvfKTD+wViGZu20CFwlnuWFjTf8tYFW74K4FRU3QIxE
 sbNQLx74JcxNOhGlfEXrOcBMtbcwOu6hJIkf5xj9xwS1H5vO9M6izS2bJeAk4aQv5iyrc7
 N0kPvp6h/C9wSA0LrphVOiMAKVky1j0=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-qCe6yCDAMEGiCWyqT7JDuw-1; Thu, 27 May 2021 00:51:22 -0400
X-MC-Unique: qCe6yCDAMEGiCWyqT7JDuw-1
Received: by mail-yb1-f198.google.com with SMTP id
 h67-20020a25d0460000b0290517e5f14ba4so4347722ybg.18
 for <ltp@lists.linux.it>; Wed, 26 May 2021 21:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=++JQCrDsWppTWMiYf9kFDQKZRDxKlxh1nZ4AKS1D81g=;
 b=lZjfRTzRjp25c4P2ozuy1W32MGOjaiNTSTf08KL9NT6ZEDPrvd1wdfyQNuPzVgNS5O
 IAmVVfqDYHB7fWlxsrATnfK1kHYLhvOnjRmhbch3vOOP9HA1eL1kEmiB24VEptI76vTx
 48fJnBqikkPr1l26JkixvXcwTz0VrLjokTfp7/8yMiPpWQBz6ae6tKjCeXcmeX7aqZS6
 BsDZa6O9hkP+uHokr30on03eFfR2CLPxXCjk2xzkJUb0avx3JQcjNlJJm1UvEYXFocmX
 JNe8dJPGRm8311ysvxwf6Ru1lRQArMKN+4bjeSkbX7rbsAWkeGQCLRdoJ2UJmltLBvdP
 1CkA==
X-Gm-Message-State: AOAM531pnoNy02SMq8URSILfegg0vRVWcjl6zPwSCuzLA6JT8kwCeoKA
 APYbKppZto4pBRZL5qm+euSYemGqIE+FmJ9Yi1T8Q0aA5OOK7lCG3FWCSDYno5SHAYTNa+UfdeM
 nF52nbanHgPi2Gn+6AqyjK0wfsSE=
X-Received: by 2002:a25:1189:: with SMTP id 131mr2224649ybr.286.1622091081829; 
 Wed, 26 May 2021 21:51:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNXDKvoj9rbrJvXzYYxm42JmLIpxA7Gi8Lsm3GfjAEMP4N2nKn+1q+3Aqt3rasV0gYskmNbm9LiftzqLTr/Dg=
X-Received: by 2002:a25:1189:: with SMTP id 131mr2224632ybr.286.1622091081645; 
 Wed, 26 May 2021 21:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210526154949.4473-1-pvorel@suse.cz>
 <CAEemH2ecppttvGW1JeJ_E=w1eUJYEY8+Sx8Euztn2MhRYykEKQ@mail.gmail.com>
 <CAEemH2fGaxQuTvpV1gEp8hVoeHo=42ikSRYs+5RmCuJQfJQa-g@mail.gmail.com>
 <YK8d5APc1VZ0Q7T+@pevik>
In-Reply-To: <YK8d5APc1VZ0Q7T+@pevik>
From: Li Wang <liwang@redhat.com>
Date: Thu, 27 May 2021 12:51:09 +0800
Message-ID: <CAEemH2doGFdk395L5t7cGBKT63AzORNjEU4=H6qQFbXjO2xCTA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] doc: Split test-writing-guidelines
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>,
 Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, May 27, 2021 at 12:19 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Li, all,
>
> > > > https://github.com/pevik/ltp/wiki/Test-Writing-Guidelines
> > > > https://github.com/pevik/ltp/wiki/C-Test-API
>
> > Seems we have a similar guideline "c-test-tutorial-simple.txt",
> > maybe better to combine them together?
> I'd prefer to keep them separate. Because otherwise page gets long again.
> But I'd consider to unify names ("LTP C Test API" vs. "C Test Case Tutorial"
> - API vs. Case).

No problem, I'm OK with unifying names.

And yes, we can rename with the same prefix start on purposely to make
them keep nearby in alphabetical sorting.

> > > > https://github.com/pevik/ltp/wiki/Shell-Test-API
>
> > Forgot to mention, with the increased number of docs, do you think it
> > necessary to create an index for including all documents in a sort?
> There is list of pages on the right. But as it's sorted alphabetically,
> it's not enough. Maybe we should add this list to README.md and to HOME wiki
> page.

To HOME wiki sounds good, we can do a simple triage in there.

Thanks a lot for the documentation work!

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
