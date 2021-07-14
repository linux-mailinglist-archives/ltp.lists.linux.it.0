Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1873C7E58
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 08:05:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B8FE43C6630
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 08:05:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A80A73C65F7
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 08:05:24 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2DA0C601103
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 08:05:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626242721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o2Oo+GFqMdRX2k3imSu9lIGPJLdGRobHH82vmkFrlPE=;
 b=acyarLNM8DypjmKXOfbo6mGX6XNSwS1mGFS7SecywWeJRhqjUW5Bja1alRABIwGchMMM+9
 7YkYcTCmw3l/c8DBJydM5HrIIGDvef7z3BtUYK/MFVV58y7ftxdtOaSD0TNGBJjAc0fahT
 EHVsZ0KoDpf3N44GO+wlC/G32jHr9Q4=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-x4xkiJCHMQajl7PNn22oZQ-1; Wed, 14 Jul 2021 02:05:19 -0400
X-MC-Unique: x4xkiJCHMQajl7PNn22oZQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 h7-20020a5b0a870000b029054c59edf217so1313571ybq.3
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 23:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o2Oo+GFqMdRX2k3imSu9lIGPJLdGRobHH82vmkFrlPE=;
 b=TsmAtxUc1Z/JDI2xSj21Zk8wRGeegP2tjVhYxmngh3OZuLw86krGjNMIBRszUSGzzi
 /74m4ye22LXJLV/9y0D8uEO5FK08Bzwd/rkPipImabOPNbjq8gBC+9fYuIoiVTm746+c
 EOfpzFJc8/dz+skXTHK1NhEnvbwIGoDENYrA4gUNLi4tIJna2DoB++dXzjk5FB57pWzq
 QXcOBvl6XC/p4u+JVPZRCnzC7YdpAEUUH2Xb7wOnctnP+EEKUxieWJOXXNNLeT5c983h
 LiORSfOGXpFTRLdvP8gb6A2qKSpBjJdlzdX/koocPfbPt/12fB35tQ4Ydl4CcAiw9Li0
 u8GA==
X-Gm-Message-State: AOAM532yLLPcraAxNCgtHkf9mJ+XvVbWjtWyyorpNc7R+6kVjmUAyyws
 jgEj30FjOC84fGLsb7nV3hpE/mYSJxjMvIOVp6B/p3YdP4Jlv3F5352+bCrMMS5wFC06HpgImSl
 tbZZSNoYQL3tv9Kvyr38WwOqzsg0=
X-Received: by 2002:a25:4283:: with SMTP id
 p125mr11606547yba.243.1626242719027; 
 Tue, 13 Jul 2021 23:05:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF5t8+Ns8vpUiOtt89wcFeLX0zxwBSgwUBYHPAPOEEsgbrPT6eUFRFj0Z8kt4bTZ0cBod+oWuCuDSNlviVTAg=
X-Received: by 2002:a25:4283:: with SMTP id
 p125mr11606525yba.243.1626242718830; 
 Tue, 13 Jul 2021 23:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210713092210.17141-1-krzysztof.kozlowski@canonical.com>
 <20210713092210.17141-5-krzysztof.kozlowski@canonical.com>
 <87y2aa5z6q.fsf@suse.de> <9e0129f5-2edd-1f49-aedb-0f5aecc72c6d@canonical.com>
 <874kcypabj.fsf@suse.de>
In-Reply-To: <874kcypabj.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Wed, 14 Jul 2021 14:05:07 +0800
Message-ID: <CAEemH2dPKo7RhM3j=H_cFC7NuZHP0xrC4q5Z3vLWXPMf5pkW6g@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/5] controllers/memcg: increase memory limit
 in subgroup charge
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
Content-Type: multipart/mixed; boundary="===============0937134676=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0937134676==
Content-Type: multipart/alternative; boundary="0000000000009327f505c70f23ab"

--0000000000009327f505c70f23ab
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof, Richard,

Richard Palethorpe <rpalethorpe@suse.de> wrote:


>
> >> Actually I think it is 66 pages? Because PAGESIZES=pagesize*33.
> >>
> >
> > Yes, right. Maybe this could be fixed when applying - no need for resend.
>

I help correct that and applied patchset, thanks for all your work on this.

-- 
Regards,
Li Wang

--0000000000009327f505c70f23ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Krzysztof, Richard,</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Richard Palethorpe &lt;<a href=3D=
"mailto:rpalethorpe@suse.de">rpalethorpe@suse.de</a>&gt; wrote:</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"> <br>
&gt;&gt; Actually I think it is 66 pages? Because PAGESIZES=3Dpagesize*33.<=
br>
&gt;&gt;<br>
&gt;<br>
&gt; Yes, right. Maybe this could be fixed when applying - no need for rese=
nd.<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">I help correct that and applied patchset, thanks for all you=
r work on this.</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></=
div></div></div></div>

--0000000000009327f505c70f23ab--


--===============0937134676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0937134676==--

