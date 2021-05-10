Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 155F9377A1F
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 04:29:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C67853C6725
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 04:29:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0D9B23C5839
 for <ltp@lists.linux.it>; Mon, 10 May 2021 04:29:13 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A44D1600758
 for <ltp@lists.linux.it>; Mon, 10 May 2021 04:29:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620613751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5fYw+GOwaF86VboCO0FayU+txSHENS5UiWM2ZZA2JCs=;
 b=PaXm6s6grloMLZo5eMuwatbLYm7w+dnRZ/uko1pjI3BlC5ugUcAmtsG/UHKX6/9L6HEBT9
 D3LUpzmng3ei2eYysVTqUnO/6P4th3P0vycB7FPm5OJ9Pm0NcfIxV61QExAEnth93F9k2h
 zbxJpemK6rqXxgXm4cfnPJPeGmU6Egk=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-ez3SZeH3Ph-kADxHu6jADQ-1; Sun, 09 May 2021 22:29:09 -0400
X-MC-Unique: ez3SZeH3Ph-kADxHu6jADQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 u7-20020a259b470000b02904dca50820c2so17991633ybo.11
 for <ltp@lists.linux.it>; Sun, 09 May 2021 19:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5fYw+GOwaF86VboCO0FayU+txSHENS5UiWM2ZZA2JCs=;
 b=dye8l2d8NhiRD7ptc5inkVXKdgWoqE+ZAf0A9SEnhfGyjXTa5fyT3JkNdHOYPP9P2u
 fniQWB7bwTcBR5o5uhrYwgNHZl6xef/zXBh6jHQDa0xKD+FTxLOv8gA9YUTdpWUMbj6K
 oY+QYV6KWm6BzrfiGm9hr5AdC4p0kdyYwJIpQAKKxTufpytPCawcYL270FYOuZNpILqR
 6bJSG3AocIkZVSpA06rfNuJrsYa7qC6SihrYFivQl4v90CUJ2hc+aXVaPyJiGqav87NS
 1G3wqBYriIfGx3NJkHkzylCYxYarFjmSF/GXDQODxL2YjjP4CXB7D0cKxCJRwOp1ebPr
 q5Xg==
X-Gm-Message-State: AOAM531rGx2fu128oICB4VMwGrgIPutb9VU/W9coC7uh8BKQG9byl5x7
 VyEG9v0a+j33MK9lgpjs7qemaqrOf9Ol7WAG+Oh4PEUDW6dRfQddjiZSGDO9vQyvM3fy/vk5C+w
 k+E+Kc4LHdAsMsXtX0DtGN8UFzGI=
X-Received: by 2002:a25:27c2:: with SMTP id
 n185mr28378465ybn.110.1620613748614; 
 Sun, 09 May 2021 19:29:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyPwnE1ye8uS2440f7t8mHSSoz40JDMqHa64bN2hYzuYAFaGwxJiS2aLZn5JwwYUfa6ZHOIY9QknIaW2rFiZ4=
X-Received: by 2002:a25:27c2:: with SMTP id
 n185mr28378450ybn.110.1620613748423; 
 Sun, 09 May 2021 19:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210508061252.18337-1-liwang@redhat.com>
 <20210510011134.cegvehhbuyc5us24@revolver>
In-Reply-To: <20210510011134.cegvehhbuyc5us24@revolver>
From: Li Wang <liwang@redhat.com>
Date: Mon, 10 May 2021 10:28:55 +0800
Message-ID: <CAEemH2eUN+9PtHdyqR8L0_wV__iDrdHXCagt3upwToSyubc_zw@mail.gmail.com>
To: Liam Howlett <liam.howlett@oracle.com>
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
Subject: Re: [LTP] [PATCH] syscall: remove PROT_WRITE|PROT_EXEC from brk02
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Liam Howlett <liam.howlett@oracle.com> wrote:

> Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

Thanks for the review! Patch applied.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
