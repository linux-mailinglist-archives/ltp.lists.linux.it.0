Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D29DD376F53
	for <lists+linux-ltp@lfdr.de>; Sat,  8 May 2021 05:57:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A8253C96D8
	for <lists+linux-ltp@lfdr.de>; Sat,  8 May 2021 05:57:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1149A3C1DFA
 for <ltp@lists.linux.it>; Sat,  8 May 2021 05:57:18 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E82E16005D8
 for <ltp@lists.linux.it>; Sat,  8 May 2021 05:57:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620446235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CBYzxYVA6gdd1VOT01qh2eBddByLYADG1rCJxzVuPu8=;
 b=XQwVEHOwfIEkY/mqKn66HD458QIqY6+Un9EuwIjgS2/zZzKFuNSKzGnrKSME+Ee5Dsra47
 4qIeNCd2mdVXKjLDu++sRm5oWORuu0YVwcDok4SZeacSERYFOFV0tujS19/Zy8O7grCBXS
 6tbiYwKYDvPTN/X04uphhrIR8n3Gbhk=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-SdzfhI0ZPfu6aokv8KdHkw-1; Fri, 07 May 2021 23:57:13 -0400
X-MC-Unique: SdzfhI0ZPfu6aokv8KdHkw-1
Received: by mail-yb1-f199.google.com with SMTP id
 k129-20020a2556870000b02904f825078971so12459831ybb.18
 for <ltp@lists.linux.it>; Fri, 07 May 2021 20:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CBYzxYVA6gdd1VOT01qh2eBddByLYADG1rCJxzVuPu8=;
 b=XJADoVvAvy9aJ7L7QoOXXdA3aH9DDy4XgXVM8vJSHcHsgRgY/filXYQf5p5H9pwGWu
 YIvzfPNKZJI1gmyI5tABQmVb3ISzeSXfWIEv5IZ6HP/qs2fC5nYNlPB1u9uwsXbXA2tH
 nCJGQoOHpAi5FgrEyzh0EZr1MQcABAMB0Hjjji3t6AmTzQxKceOI9d3dRf0usHNcqiLN
 nCqHJt5Dk7YwgImMWmh85JCr+D4ohFVBoUFfj992eBE7d7Sd+a0iU5EJwCJfnncrTD7T
 U7w0RICGCa5iYxPdAtn41HGLpxCFMcyVTtCzojL8siFhuzAkc7WprWoRS2FhXG6L2MaM
 qZnA==
X-Gm-Message-State: AOAM532cTksXZh5uPTy2h5R9Vp4IoCD/U+OVI858XaDahUNka6uR62XD
 Y1AtQIKlWP7LTD2BaSfUQ/t79f3T73fNMWPQbL8HaJP22CzJv1jHSM6On61c7ERwcVGJ2WO00t7
 W5sG1zU6oaG6bJ2/u8562f4jHIC4=
X-Received: by 2002:a25:1189:: with SMTP id 131mr18307139ybr.286.1620446232879; 
 Fri, 07 May 2021 20:57:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDoxVnemThTTQkb55N2X+ImZHnAnAzM0k6IFxZstigIAnPUNm5IrT1c8IFdx4lxwkBDVL89rzFyBgysKjZiKA=
X-Received: by 2002:a25:1189:: with SMTP id 131mr18307120ybr.286.1620446232608; 
 Fri, 07 May 2021 20:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210507103258.232174-1-lkml@jv-coder.de>
 <20210507103258.232174-3-lkml@jv-coder.de>
 <CAEemH2fucJPyeTL-HZJD92ves7GLMaMHcaPzi8kS_qWL+x=Hcg@mail.gmail.com>
 <YJVNKebKn6jTvyG/@pevik>
 <CAEemH2fgcFm4tsJdtj+J=sqvOy24w54QR+7M=Bhk2E7NDE68Gg@mail.gmail.com>
 <YJVfQanq/HPXnfi1@pevik>
In-Reply-To: <YJVfQanq/HPXnfi1@pevik>
From: Li Wang <liwang@redhat.com>
Date: Sat, 8 May 2021 11:57:00 +0800
Message-ID: <CAEemH2cjDZVq0iJ28R-x8VPzJT71EZnUY-wuKjDLOz_+Uhsa5A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] shell: Prevent orphan timeout sleep
 processes
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> > --- a/testcases/lib/tst_test.sh
> > +++ b/testcases/lib/tst_test.sh
> > @@ -439,6 +439,8 @@ _tst_kill_test()
> >  {
> >         local i=10
>
> > +       trap " " TERM INT

Seems no need to ignore the SIGTERM, because it only sends in
the early (before timeout) phase, the _tst_kill_test has no chance
to catch a SIGTERM.

> Acked-by: Petr Vorel <pvorel@suse.cz>

Thanks for the review! I will send a patch for it.

>
> Thanks!
>
> BTW I'm surprised " " works, I'd expect : would have to be used.

" " or '' define none string makes it ignore signals.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
