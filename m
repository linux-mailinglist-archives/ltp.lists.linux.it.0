Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E8B3C215A
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Jul 2021 11:19:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 053C33C67FF
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Jul 2021 11:19:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 35FA03C1C00
 for <ltp@lists.linux.it>; Fri,  9 Jul 2021 11:19:56 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 14FDE100135A
 for <ltp@lists.linux.it>; Fri,  9 Jul 2021 11:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625822393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xq37xIVsU847gX8h0JPmzdofarlK2Fw0Yliw8k+NYlw=;
 b=Aq969gJO80eNHaJk2mDzOtAjb+iMQHu4LL/x6aZlNTjMDgPakGgB/DX0x2/IzoMOQ0XJsI
 AQlIatpUp8SDOVSJcJVKGH02B+rkETAZSMUZSRr/N0wR6YQvwb9aEAQYOnMcEigeFC+qiM
 zkFftFfl+j7u8jLuSe/ISYDeXtngQ5o=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-w32z6TD8NdCKEHYu9Qeqcg-1; Fri, 09 Jul 2021 05:19:51 -0400
X-MC-Unique: w32z6TD8NdCKEHYu9Qeqcg-1
Received: by mail-yb1-f200.google.com with SMTP id
 v184-20020a257ac10000b02904f84a5c5297so10673718ybc.16
 for <ltp@lists.linux.it>; Fri, 09 Jul 2021 02:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xq37xIVsU847gX8h0JPmzdofarlK2Fw0Yliw8k+NYlw=;
 b=WYawCNWeyLobRT+1Jukd4zm8v7j7thq3thz5ZOjpZvaEs/iaukSQmSDzQSlgMe3fyJ
 Uk1AcX1Fmw7CgQ7B1K1bvE/EkthpBnDmnmeDe6tBtFfNHPH+4W2Sm+EFAOPpBo4ZmPaC
 KGRPgsRa6OZwGdwsezkTh9EQNJNiqcd2gVoDr/BnpcFb7v9dojXo4TtXD1JT5H4Xt703
 FACXMn+v0N/2qF0EFQCzEnmbPTj4r/4ZXSDu1xkFgH87LjpDlNLwiOOQNtbQSOzh4Zar
 pe92akUDhfZZEcDdZc2R3ji5/W3+Gjqd1wfJxuB3sfeTSaq84zI7EhDVpoZjlZldusz9
 cWiw==
X-Gm-Message-State: AOAM530YZNUXNVMqoWSU08xd2YhOSKkVrGl/CiiDyBLuooLXUjbHCYc3
 PithdwV3u+M/x5KFRpYWvkKtBrIga1c6DUuqxVpdLg+QyioMLKIfAd8Dz5UZZeHvbwEapD331Pf
 T/yaINWjH4X0uOOro6S7+MMiKwso=
X-Received: by 2002:a25:6e05:: with SMTP id j5mr7189574ybc.86.1625822391380;
 Fri, 09 Jul 2021 02:19:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwldOJE4zS+psdbvgmh+571Rebx0buh5DylOfxL0nFGbJxSdkcJzojDtZIsVywwYJGf+KAkPeqAG3Ayc5IufCo=
X-Received: by 2002:a25:6e05:: with SMTP id j5mr7189543ybc.86.1625822391031;
 Fri, 09 Jul 2021 02:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210709075204.999168-1-liwang@redhat.com> <YOgCtfqdl4719aXr@yuki>
In-Reply-To: <YOgCtfqdl4719aXr@yuki>
From: Li Wang <liwang@redhat.com>
Date: Fri, 9 Jul 2021 17:19:39 +0800
Message-ID: <CAEemH2c8EQR0XGM_uM+Mg55T3fMnXErcdy9bwOvxEyjk_hg4QQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
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
Subject: Re: [LTP] [PATCH v3 1/3] lib: add new function tst_get_device_size
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
Content-Type: multipart/mixed; boundary="===============1042251353=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1042251353==
Content-Type: multipart/alternative; boundary="00000000000015ebca05c6ad4617"

--00000000000015ebca05c6ad4617
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 9, 2021 at 4:28 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> The whole patchset looks good.
>
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
>

Merged, thanks for the review!

-- 
Regards,
Li Wang

--00000000000015ebca05c6ad4617
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jul 9, 2021 at 4:28 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
The whole patchset looks good.<br>
<br>
Reviewed-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"=
_blank">chrubis@suse.cz</a>&gt;<br></blockquote><div><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Merged, thanks for the review!=
</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature=
"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div=
></div>

--00000000000015ebca05c6ad4617--


--===============1042251353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1042251353==--

