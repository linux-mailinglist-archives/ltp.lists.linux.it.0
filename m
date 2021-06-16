Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 824633A92B6
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 08:37:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07F1E3C4CB8
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 08:37:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3C1043C2DDA
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 08:37:29 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DD674140110C
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 08:37:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623825447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g5PztJUH7kN/bZW2e9AdbfzRXmRrItdsbh1No0i1/Nw=;
 b=VJ69N/FiiBFv+sdFf66b/VMYugPvxId6jEf5PpBtQiwbCgtUrhQc5tDlgW6nqD49IKHbfR
 xBI9lI0DEOtjOeJKDVwGqrbjaqElXdZRYbEdNZyB1IAw1Kpd48AUowZqhJiW9wyS8Rsob1
 RpwOTLSGFFVN8rY5STtODnjXxymU34w=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-tfSqcJX8N9Op7nRQebEmbA-1; Wed, 16 Jun 2021 02:37:24 -0400
X-MC-Unique: tfSqcJX8N9Op7nRQebEmbA-1
Received: by mail-yb1-f197.google.com with SMTP id
 z39-20020a25ada70000b029054d3d1d546aso1496611ybi.20
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 23:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g5PztJUH7kN/bZW2e9AdbfzRXmRrItdsbh1No0i1/Nw=;
 b=BJ9ZAmv1NqEH9nzF6quKFjj3IX8LxR6uXH4Bz2gOPCy4DFuUTQFYxm7Rp0XpqeymtJ
 Wg9T3QrWB3bS0X/km39nAhwhGcVUcN6VXsgX9GQ0zpt4S1bGm/Ztkei21FLVRumpoGRQ
 Xn7XN8mQgwdR23v3Y3ratBY+2wrj2/Is3ZwZziN104hgJ3eyDCj0tc1HgflVnTk1fSMt
 TQuHRajCDhSVupSHeNQc0ES4NyGh5hu9GBQ73yg1PorJM59ZjSVNl4+GKHWX+TJaggTL
 hpVUs6ViT2f92d0JE1TXO1/S5iyzx6HPJo4WX3AhTi3G6jW3FIoq9I5Hlr90kI4lKoHJ
 aMzw==
X-Gm-Message-State: AOAM533ArCPg2ZXFh9RcCjS6tahUK6m7EPTmSBPw26fcYXh+iMk4qe47
 XbHCzR1829vXCUXeOhVZPLygl/Uw2xIrxv09N7tI0dByMmhOkMlTGx6KC9PW3RHeGtC98oNitvE
 0TmJ2nnDA/bFSFhtz+qljuEkmWOE=
X-Received: by 2002:a25:3882:: with SMTP id f124mr3999944yba.110.1623825443532; 
 Tue, 15 Jun 2021 23:37:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGw+2av8K3Ae04BjuNsOtusJuk77Oyq+yZkHd70r74i07UftWRzKQnWf7fxlx93D6cWGmyHqA29/vOED/lsas=
X-Received: by 2002:a25:3882:: with SMTP id f124mr3999927yba.110.1623825443328; 
 Tue, 15 Jun 2021 23:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210615074045.23974-1-rpalethorpe@suse.com>
 <20210615074045.23974-2-rpalethorpe@suse.com>
In-Reply-To: <20210615074045.23974-2-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 16 Jun 2021 14:37:11 +0800
Message-ID: <CAEemH2eNrTa_wNZhPGNhRPgeF3yQFE8pNXOiPuZa3D0x9s=EnQ@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/3] API: Remove TEST macro usage from library
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


On Tue, Jun 15, 2021 at 3:41 PM Richard Palethorpe via ltp
<ltp@lists.linux.it> wrote:
>
> The test author is guaranteed that the LTP library will not change the
> TST_RET and TST_ERR global variables. That way the test author can use
> the TEST macro then call other library functions before using TST_RET,
> TST_ERR or TTERRNO.

I guess the inline function in the header files also should be
considered, right?

lapi/clone.h:           TEST(syscall(__NR_clone3, NULL, 0));
lapi/fsmount.h:         TEST(syscall(__NR_fsopen, NULL, 0));
lapi/init_module.h:               TEST(syscall(__NR_finit_module, 0, "", 0));
lapi/io_uring.h:                TEST(syscall(__NR_io_uring_setup, NULL, 0));
lapi/name_to_handle_at.h:       TEST(name_to_handle_at(dfd, pathname,
&fh, &mount_id, 0));
lapi/openat2.h:         TEST(syscall(__NR_openat2, -1, NULL, NULL, 0));


--
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
