Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7363CB347
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 09:35:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 708C43C7190
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 09:35:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2E5A33C65AE
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 09:35:24 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 84A4C1001366
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 09:35:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626420921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KFfE19mMQ48MMQG/sEIY4Vk5kKgt5Qb3Hc2ZirCKP0k=;
 b=hNm44GHiUFnrOWvlWVgjTYDjsU9pubtg9BUuSx86343tyg5txjch2jhWsvcaE6JhNsUkCY
 c+DkJlqZek0jaXWNJAHpANqqwEkBtDUX4oaR7goxnyf5/M44/X3kVpf+4IBFpOi/qQaMNH
 ext99bnnEGToeP2i1x4Kh6S7DVLm0So=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-PAZjjp9UMH6TZij3Mmb1tA-1; Fri, 16 Jul 2021 03:35:19 -0400
X-MC-Unique: PAZjjp9UMH6TZij3Mmb1tA-1
Received: by mail-yb1-f200.google.com with SMTP id
 w5-20020a0569021005b029055b51419c7dso11332266ybt.23
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 00:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KFfE19mMQ48MMQG/sEIY4Vk5kKgt5Qb3Hc2ZirCKP0k=;
 b=Ua8fDv4NUiL/vxAhq/PSLDNfxT0fhwodtPi6nuIN63yyhzUjXbTKT6F3O3wQ1kUJAc
 5HXQOyRiI2FnLDFdDdVEO4vi+wKEu3wK6uBqeHvSbgrg3qPz9rG09bPsHtlXPdvQQsZx
 fX0T27yPyxkqiVC0qTfLpElHJdFGYMjOK7w5XxtdJqfJKyc0tk5dMaHhe937ratQm0fD
 Gnyh5ZwRIzkFPKYak6ck15hOw40RS92bomKbyMTU4prLuILJMZJrvpy7KKEbDIanUMZS
 RvF4vyv4meU/gYvoSKU9wI7MOdu8q+vxQySUV5UQUrSBEDZp5yT8TzbZ10CtsVU+sCS6
 k/lg==
X-Gm-Message-State: AOAM530PItovwSgaJgdUxyomL8iEkgpqsr3HJSlQOe5IL2GybbGlxG2Q
 gv6Okd8jruVU7laVo4Z4ASlnrO4gP2FHYu9QORhWMM3Qpw9GK3i40HWU5lar7EpTkDo5jgk/7VI
 42F8AOdAwnNrltB5ycNvXwQxve98=
X-Received: by 2002:a25:1455:: with SMTP id 82mr10853383ybu.403.1626420918791; 
 Fri, 16 Jul 2021 00:35:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQY23MB1rIfT9cKIpC7kr9afGJvwJpABdKeLG5TrAxlz0FnIjsz6CvZHMg/JoYXxRW4S6nZIV8qJEfbtJsg0w=
X-Received: by 2002:a25:1455:: with SMTP id 82mr10853365ybu.403.1626420918593; 
 Fri, 16 Jul 2021 00:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <1626244478-15350-1-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1626244478-15350-1-git-send-email-xuyang2018.jy@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 16 Jul 2021 15:35:06 +0800
Message-ID: <CAEemH2dy+kMkzjQhygP7Y9MR68APjS3JZQcnUN4TwoGKUs=Y8A@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] interfaces/sched_setparam/9-1.c: Fix leak of
 shared memory segment
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1518403902=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1518403902==
Content-Type: multipart/alternative; boundary="0000000000001bbe6a05c738a135"

--0000000000001bbe6a05c738a135
Content-Type: text/plain; charset="UTF-8"

Patch applied, thanks!

-- 
Regards,
Li Wang

--0000000000001bbe6a05c738a135
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div dir="ltr"><div class="gmail_default" style="font-size:small">Patch applied, thanks!</div></div><div><br></div>-- <br><div dir="ltr" class="gmail_signature"><div dir="ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000001bbe6a05c738a135--


--===============1518403902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1518403902==--

