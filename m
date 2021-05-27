Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0111E392F59
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 15:19:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B53E73C80D4
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 15:19:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 501893C5861
 for <ltp@lists.linux.it>; Thu, 27 May 2021 15:18:56 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 50A02601B10
 for <ltp@lists.linux.it>; Thu, 27 May 2021 15:18:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622121533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m8THI71W4aMkf168/I2WnCfL4gBG1UDqj9yM0fZAee4=;
 b=i2qpE3pO4fxF2a50TVKBE1DlZdVvdEBt8AG0rWvFLwM5IMljo+7iwRsiUpUMyB1tCJfbm1
 h9XqhC7onO0kfooApNxlXhw6VtAaRNt2tP8olHeMg1HaUewtzcpypTDvOFdTOYyf/KwG5y
 5PAmWe7+9FQARF+3fIhk9/4e8YJQenM=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-as5Beo3lOWyALJkQrjU4gQ-1; Thu, 27 May 2021 09:18:50 -0400
X-MC-Unique: as5Beo3lOWyALJkQrjU4gQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 129-20020a2501870000b0290526b90a2992so476979ybb.10
 for <ltp@lists.linux.it>; Thu, 27 May 2021 06:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m8THI71W4aMkf168/I2WnCfL4gBG1UDqj9yM0fZAee4=;
 b=RmiXhU/0y4473VWjTecMDePIr61X+OtIddYumy+BHH1EwtSLb2mLjDvZKY4Y/h8ccu
 V7w96aCNuhiiA0W3SOJxcxT+lkgMyEtWjSQ7g9k9mnERWSluFocz/IgPNH6retcfWOOK
 A3cOTaKEos5FDjOOQlZWDdA9SU0OwpIjpD866YCl3mmCVWgvTt2N6469iSVlUDMymDmn
 IRxO8HBuXK1MnuZujbZWg2Mx87VIr0mEEjh2zFJLdWDZ07PPNAzaQVK3p572dD7YONS5
 3kEKnRi2Jd1jzhjO2X5JhdJaOYur2xAKFS47bYyiXoPkudop+/1rWYLJ2O2e1ppTtNzF
 y7lw==
X-Gm-Message-State: AOAM530BQH+FBW1lbJp9vrKXbXgn8V0/nA4WVUI0oUXraBtS/jiExHie
 cvH4Lu+8NV2D5etCp7v1JrOdJQ1C7x7zbvbh+Nhv7fuIoGrsZJraDzqpbGGTMEqrXHj84vYUGEg
 8OJBk6H0H8CVrgylmtTr2BC/Qzrw=
X-Received: by 2002:a5b:64e:: with SMTP id o14mr4717406ybq.252.1622121529812; 
 Thu, 27 May 2021 06:18:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz14ZuzmM8gQtj4NWvMmjPMYqzS5h3w4NdYmqapaf04gYnHeRWkS3S/BvhuiS6ipEMngHD7k0VfCoM88HS3CKs=
X-Received: by 2002:a5b:64e:: with SMTP id o14mr4717375ybq.252.1622121529571; 
 Thu, 27 May 2021 06:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210521102528.21102-1-rpalethorpe@suse.com>
 <20210521102528.21102-6-rpalethorpe@suse.com>
In-Reply-To: <20210521102528.21102-6-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 27 May 2021 21:18:37 +0800
Message-ID: <CAEemH2cqGGJuF56LpVO9egB7eLLCLdcXKaVA_2dkFRFmN8=jKw@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/6] API/cgroups: tst_require fail gracefully
 with unknown controller
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richard,

On Fri, May 21, 2021 at 6:26 PM Richard Palethorpe via ltp
<ltp@lists.linux.it> wrote:
>
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>  lib/tst_cgroup.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
> index 74746f13e..6d94ea41c 100644
> --- a/lib/tst_cgroup.c
> +++ b/lib/tst_cgroup.c
> @@ -599,6 +599,12 @@ void tst_cgroup_require(const char *const ctrl_name,
>         struct cgroup_ctrl *const ctrl = cgroup_find_ctrl(ctrl_name);
>         struct cgroup_root *root;
>
> +       if (!ctrl) {
> +               tst_brk(TBROK, "'%s' controller is unknown to LTP", ctrl_name);
> +               tst_brk(TBROK, "Calling %s in cleanup?", __func__);
> +               return;

It'd never go here to perform a return because the first tst_brk
will break the test directly. And, I don't know why we need the
second tst_brk to show calling in cleanup, is that possible?


> +       }
> +
>         if (!options)
>                 options = &default_opts;
>
> --
> 2.31.1
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


--
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
