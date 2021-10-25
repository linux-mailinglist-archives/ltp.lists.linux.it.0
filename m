Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E761C43925F
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Oct 2021 11:29:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 489E23C65AF
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Oct 2021 11:29:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A9D773C13C0
 for <ltp@lists.linux.it>; Mon, 25 Oct 2021 11:29:33 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E54201A00915
 for <ltp@lists.linux.it>; Mon, 25 Oct 2021 11:29:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635154171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K8vk0KLSdnXRqzpDzpVh+WR7tzNRC7o+TOgtOsnfLsQ=;
 b=MQgLmZ6LX5pNP1Xq+aRE16TOjX8ChkSROviXDRNSD91QNBNE5ydSjzhdZX+UUWLCs76W2G
 5Ks4zpzBEvNpKDEaw/78xUzVVfO81Ne7CjfgKdlfOfZJMoZALc/viCzK5AVQNBr01X7Irn
 MNeQFDVLySA+CycfPS6ntzGXypk7lXo=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-8_k-XXtqPKu48GpyQTUTRw-1; Mon, 25 Oct 2021 05:29:30 -0400
X-MC-Unique: 8_k-XXtqPKu48GpyQTUTRw-1
Received: by mail-ot1-f72.google.com with SMTP id
 p28-20020a05683019dc00b00552d0eff1b2so6782951otp.7
 for <ltp@lists.linux.it>; Mon, 25 Oct 2021 02:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K8vk0KLSdnXRqzpDzpVh+WR7tzNRC7o+TOgtOsnfLsQ=;
 b=6Ct+HhAYT5E4r+paFKO4Ft3iYiIPywSBm5AMyu/R6rljNET50s0krxSS2VxO2MfzPq
 sPj4xydzUxV7KBQCU8JfLJxjNTBc0A/Ycrse4ZYiKDCwtwbpyWJZrprvQRKwyUMUuzUf
 y0F5Qi6y2/RsVE35OHOxpvRzj8Hup89bCBHDHapAyYeBZUpyaQOdSyFGbOvMm9riJOXN
 4CDljZ2yvfsj2j654E6yU5+umvfK3s2WChkwgkqDwFF6SLh/QhGKiCUnCpUs9ULqC1hv
 yPKzOVfDv2YPnYvjIokXbvJzMbViUQzpmDvlSCSA9KJiqCCt6jnrQxt1+8Pcc6A6/TSp
 8FnA==
X-Gm-Message-State: AOAM53337O14FkqoxwMnKKmPytNpP0v2JLFTvQ4V4WugsLizvk8bePGC
 oOTjQMs5DX8bdCwEFEqKqp0N88hWjKWWciuspR2WZFkSlO6iwSXaEABGN51Xjpf1D/IDL9ZKqXn
 pqC/oeQfmkVU9RZZodr+WndRKSLc=
X-Received: by 2002:aca:b4c4:: with SMTP id d187mr20695307oif.66.1635154169436; 
 Mon, 25 Oct 2021 02:29:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5fgEMlP7YFkCUT/sCgrDU3iRNCoFkR7VWQdbILlCUBNgXrTM9fkHotmCJ/Oj33IFdGzE7wrwbO9EfchL5PUc=
X-Received: by 2002:aca:b4c4:: with SMTP id d187mr20695276oif.66.1635154169062; 
 Mon, 25 Oct 2021 02:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <ddffbf17d3b5fd2d7812a18435d5cc49b848de8d.1634548566.git.jstancek@redhat.com>
 <YXZ0XOiAkHQMvqRM@yuki>
In-Reply-To: <YXZ0XOiAkHQMvqRM@yuki>
From: Jan Stancek <jstancek@redhat.com>
Date: Mon, 25 Oct 2021 11:29:12 +0200
Message-ID: <CAASaF6zUeJm0QZ+9XQDL6Dy-vvoNTtwBWGtHteKdxXf9UwFoWA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open_posix/conformance/clock/1.1: check PASS
 condition periodically
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

On Mon, Oct 25, 2021 at 11:09 AM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Thanks, pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
