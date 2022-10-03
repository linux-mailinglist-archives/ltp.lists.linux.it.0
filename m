Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DBA5F2F2B
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Oct 2022 12:58:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04CEF3C8C27
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Oct 2022 12:58:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 588443C5523
 for <ltp@lists.linux.it>; Mon,  3 Oct 2022 12:58:36 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0F56E14010E7
 for <ltp@lists.linux.it>; Mon,  3 Oct 2022 12:58:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664794714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1WWK1Ou0prQ2Wie7qMI6QkV/5nPaDoDIXKcK5cN0jJk=;
 b=SaYcwsVoM8IUPUoMsrUpa7fR24qSuitmywsX6zGKbOVjLwCIV0tjbEzyYZhI3EJejvsd8C
 gV4lF4+Gj0AmpCFPV0ivmEm5/uRRbNBOK2tWjiGFoAqhBw6wkdmtkOjZGMs8l9rH8lSwBv
 AtVBwQNXLC6wi/UMXuqTbV5QW1gFK5k=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-_znaBJWhMAWvUzrpIujNBg-1; Mon, 03 Oct 2022 06:58:27 -0400
X-MC-Unique: _znaBJWhMAWvUzrpIujNBg-1
Received: by mail-vk1-f199.google.com with SMTP id
 q4-20020a1f2a04000000b003a9ae3acbc1so806409vkq.16
 for <ltp@lists.linux.it>; Mon, 03 Oct 2022 03:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=1WWK1Ou0prQ2Wie7qMI6QkV/5nPaDoDIXKcK5cN0jJk=;
 b=D4RJ6PgPOwET/lWgHr3JjaJUT5WL2m2sgPttGS5ilG1+WV2PmFJlagWpazzDO9qclk
 bOM6TBvPTe/bYTAelDeGkrfu0siIAhNFT4JE/A4ITL+u0ZOCLOKVIldXwIAunAlwQ2tJ
 LOI66qQYwM1JpqtEohAjqo74hHBXiiSPNCUE1lvivhLYtn7cPeGSwUuv5jKa5Nxnt9Hc
 wRJuM+6e9egmvNxJDRM6zHuGTleWnPZpH1O+yXMO2M48SASl4cc98GzZXfMiGTQ0Q+Hq
 9nkekeWtRl8524NrjZjOu+ti4+xpkA7rugJp7njLI3yH5KpW43E7IoOcbN7HRcXpuA/s
 YUUA==
X-Gm-Message-State: ACrzQf0dYIM+h6PdX+VzHM7NW6F29t3JxhrYPBFAgS6PIuRUOaRM9jI8
 EKX9gQCVaHbYMiLacC8HQ9LM3SVthBU+pFxxd7JgDzWuMNHrn7OpOirS7akPvPFohr9SV8k/1ZM
 y6xPVKVZnEbl+DDzJUb0w/H13RiA=
X-Received: by 2002:a1f:6a42:0:b0:3aa:175b:7e15 with SMTP id
 f63-20020a1f6a42000000b003aa175b7e15mr2301791vkc.15.1664794706034; 
 Mon, 03 Oct 2022 03:58:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4uA2D7iyZYwsbjTq54jXPglhkIPwUHEkWUI0QUe0S/5jP8b7tGUFYZUOiZvvusB3zxGlkOBTIroidM/FavTio=
X-Received: by 2002:a1f:6a42:0:b0:3aa:175b:7e15 with SMTP id
 f63-20020a1f6a42000000b003aa175b7e15mr2301785vkc.15.1664794705810; Mon, 03
 Oct 2022 03:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <6bac7035adc2cfc8ab3800fe1d2d03223ec57ff5.1663662348.git.jstancek@redhat.com>
 <6c5b161bc3bcf753cbda92954ca3f47cb268c68f.1663665637.git.jstancek@redhat.com>
 <6470a099-8b3a-ca9f-f521-181a33b5a28a@suse.com>
 <CAASaF6wFc0z+cec6y2T0ygWKY==LwkFv21CT2VG0Waqk+0SSkw@mail.gmail.com>
 <YyosAWUf7pbVMpBt@pevik>
 <CAASaF6x=5SDfS7Z+PauaLKXaKpaBagjgL3ogxKXBF6a-6Zs9xA@mail.gmail.com>
 <YywxXJTZD3s3ONUU@rei>
In-Reply-To: <YywxXJTZD3s3ONUU@rei>
From: Jan Stancek <jstancek@redhat.com>
Date: Mon, 3 Oct 2022 12:58:08 +0200
Message-ID: <CAASaF6wnF+uEw1G2BVkEaH75gM9g_rO+5CFmAd5cmNJPg+nTVQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/futex_waitv0[23]: replace
 TST_THREAD_STATE_WAIT with repeated wake
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

On Thu, Sep 22, 2022 at 11:56 AM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > > Reviewed-by: Petr Vorel <pvorel@suse.cz>
> >
> > Thanks, any concerns pushing this before release? It's race, but not
> > very frequent one, so it could wait.
>
> The v2 looks good to me as well.
>
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
