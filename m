Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A00A3A3AA6
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 06:02:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E30EA3C7A10
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 06:02:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 015083C1C51
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 06:02:36 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A8F6C6005FE
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 06:02:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623384154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o2bhK7eNNp2PWqjsWza8r2UbDs86ISp80ugK14ftz9k=;
 b=iwiHodbpDBB9Dq/JGdanwhlEyEuK5y6svB5jTMBWc5Ab75WX8+U63h0kcXU5W0BDziGoDj
 JbMSz8/aGzCmIhhrVpIrVxJdpT28SYdOWgyFpbH3B5FdYFCb6JyUisqTXcYZQhZdDQt5GP
 ut3giIsN83XXPuHiUKxgeWhujP6U3GY=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-HJTUXAfPMfmTzskgSbke1w-1; Fri, 11 Jun 2021 00:02:32 -0400
X-MC-Unique: HJTUXAfPMfmTzskgSbke1w-1
Received: by mail-yb1-f198.google.com with SMTP id
 s186-20020a2577c30000b02905353e16ab17so2450204ybc.20
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 21:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o2bhK7eNNp2PWqjsWza8r2UbDs86ISp80ugK14ftz9k=;
 b=R4ddv4zYC79+4keLQcVaDSbHskNxVw+0GQxTiGcbuEQCpBZpnDRVDIHjRoC1i04qkE
 Z2eRrw+crSvBiQwXZdKu5eOokD4nieYvqM8ffsL7v7E2uih77oguR1plma7hpENjm5do
 Guy5EZpX6ixL+Y5O+NT4xMQrXOWo8qeWJXC/zfhoSRg2RH4Y6hOZhoEN1WgNxr7jSbMg
 ofujhnEdjHlXBAkxugvZjveR+/egV38dGTzsypak0NKfhL6fZ8N7hAi0/LMlNj4pwO2F
 Einz/SYo1CB63/qCI/nwk1PCjCLtapB08142Ef6F+zFw3qi/gySGPVlaL19B0GnFEgSb
 HNYg==
X-Gm-Message-State: AOAM532/i0yqAKx0g0lDmHmmq9wjmXudnLz70j0aMQ/W/B9+h7bocPWA
 2eqx3DiFRa06xaqIz3ZavaQx03SAZPXZ2ojFnuhu23moXCNBccKkcTJTHlSItHO7XnR8saXJPSh
 kjGGA0Z5mjC52q/Qu2fRLICh2VKg=
X-Received: by 2002:a25:dc14:: with SMTP id y20mr3202918ybe.243.1623384151738; 
 Thu, 10 Jun 2021 21:02:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXlc5XaDKT8DYXUrDtRf4okM+MbzXdBP0pZYGTA7NkzDWuI65u+AFhoR5HG1pmd6cx98PrY3RzOBM25CQ9CL8=
X-Received: by 2002:a25:dc14:: with SMTP id y20mr3202885ybe.243.1623384151351; 
 Thu, 10 Jun 2021 21:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210610175812.13730-1-ycliang@andestech.com>
In-Reply-To: <20210610175812.13730-1-ycliang@andestech.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 11 Jun 2021 12:02:19 +0800
Message-ID: <CAEemH2f-=oW3PqJN6EsCvBzvPk2LvrwkLd1oVgHgv+_HHN_oTQ@mail.gmail.com>
To: Leo Yu-Chi Liang <ycliang@andestech.com>
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
Subject: Re: [LTP] [PATCH 1/1] fs/racer: Fix LTP hang caused by fs_racer.sh
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

On Fri, Jun 11, 2021 at 1:58 AM Leo Yu-Chi Liang <ycliang@andestech.com> wrote:
>
> fs_racer.sh test could cause LTP to hang if the file
> gets removed when it's at time same time being renamed.
>
> The if statement in mv source implemented by busybox is as follows:
>
>         if (dest_exists) {
>                 if (flags & OPT_NOCLOBBER)
>                         goto RET_0;
>                 if (!(flags & OPT_FORCE)           // OPT_FORCE is set by -f option
>                  && ((access(dest, W_OK) < 0 && isatty(0))
>                     || (flags & OPT_INTERACTIVE))  // this is set by -i option
>                 ) {
>                         if (fprintf(stderr, "mv: overwrite '%s'? ", dest) < 0) {
>                                 goto RET_1;  /* Ouch! fprintf failed! */
>                         }
>                         if (!bb_ask_y_confirmation()) {
>                                 goto RET_0;
>                         }
>                 }
>         }
>
> If somehow the dest_file exists when mv executes the first if "if (dest_exists)",
> and gets removed when mv executes the third if "if (access(...))".
> Then it is possible for mv to reach "bb_ask_y_confirmation" and to try to read from tty.
>
> However, the mv process is executing in the background,
> so when it tries to read from tty,
> the processes in the same process group as mv would all receive SIGTTIN
> and be changed into TASK_STOPPED state.
>
> This would cause this testcase to hang, though happens rarely.
>
> Add -f option to suppress the attempt to read from tty.
>
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
