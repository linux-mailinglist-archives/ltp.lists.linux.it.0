Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40214365451
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 10:40:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07DDE3C6C93
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 10:40:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 730DA3C1DFC
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 10:39:59 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9F91D1A0080C
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 10:39:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618907997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=74Px/cIcv5ZACisZG0ZvymJ0Nsh6aJKXuPsQqDP/jlA=;
 b=gayjisW3WiSkNU3ikN7dL6yFlTPVJxrXDMyBc6k3EsgjCidYYzBIqZhXp32+aMcwWhqJjS
 8hQIA+GI3WgCCdffldi9x6I/N2ntEmvxo0+MZXt/lne6/ht1sHG/YH3/hk580CXqDaT9pl
 KZbLdfKeoDR0XRRZJlj3Y5hxtHXhSK4=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-QCcfuS7-M0arILnNNwvr4g-1; Tue, 20 Apr 2021 04:39:55 -0400
X-MC-Unique: QCcfuS7-M0arILnNNwvr4g-1
Received: by mail-yb1-f199.google.com with SMTP id
 j137-20020a25238f0000b02904e05d066c36so10834036ybj.18
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 01:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=74Px/cIcv5ZACisZG0ZvymJ0Nsh6aJKXuPsQqDP/jlA=;
 b=HVtOkTmP2Tg6V8mpMGNVFuGgYpIaosnG7qzwc1RQasFh5AuwoTpyP8AWwFyzXi10ji
 5k7hhzpYcvuFC65NjzeCUTqYb5+dtn1sVCbJp+tmfi51oPMyAH6pxwP5IRokOoZXbIdM
 SY6XogScit+JdTUI3iRgJZFD7e7K+is5BAlUr9CbCrlWGLSmazcJQiX54zF/GYS1b8An
 GblnO/pN7djeNioNCBlID4MbUgafszLldEn70xY2rP2Gv15gU1LLkQ0y/D/Brw+QiuMW
 mkMuXaSgSU6HRXGiqgPvLEet/5tLL9/zhAuqC8i7oIUDTmWqha5xtKhV8EFKNCuzWD1k
 qG1Q==
X-Gm-Message-State: AOAM5314ylBHLkThpEzJc0VYaP4ps5Ew1KLbxPUo2FFFFSHBbMB/owyy
 JeZk4t0vivBp7vKgo/+w0DspYjhg5lHeOjXl6+xMD/BRPFMnye7kMUC0pSnv8CWD2IV7MysjiPA
 q025ELMMcKmCxbZ+qVCRXCMAdWlU=
X-Received: by 2002:a5b:787:: with SMTP id b7mr23486075ybq.243.1618907994686; 
 Tue, 20 Apr 2021 01:39:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxK91bFbT6gDequR01P60QDSG9WClYX+FkOXrXZ0Jy0YxR9v9xRUuFuNGAz+NG5yZ/ErKS7ScKzx6pseIDGI3I=
X-Received: by 2002:a5b:787:: with SMTP id b7mr23486051ybq.243.1618907994464; 
 Tue, 20 Apr 2021 01:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210420075351.16059-1-liwang@redhat.com> <YH6PT2HKt6t1xZxR@pevik>
In-Reply-To: <YH6PT2HKt6t1xZxR@pevik>
From: Li Wang <liwang@redhat.com>
Date: Tue, 20 Apr 2021 16:39:42 +0800
Message-ID: <CAEemH2eaPx86DWfoMPcvrzLrNz8+Aw3cOhBvPxiZ2J6LxEQQEg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mkfs: print more info for debugging
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
Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> > --- a/testcases/commands/mkfs/mkfs01.sh
> > +++ b/testcases/commands/mkfs/mkfs01.sh
> > @@ -128,7 +128,8 @@ mkfs_test()
> >       if [ -n "$device" ]; then
> >               mkfs_verify_type "$fs_type" "$device"
> >               if [ $? -ne 0 ]; then
> > -                     tst_res TFAIL "'${mkfs_cmd}' failed, not expected."
> > +                     tst_res TFAIL "'${mkfs_cmd}' failed, not expected type."
> Maybe "unexpected type"?
>
> I'd also change ${mkfs_cmd} to $mkfs_cmd (more readable).

Sounds good, I modified it with your suggestions and pushed it.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
