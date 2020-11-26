Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A33912C4EF8
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 07:47:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4EF6B3C4E44
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 07:47:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id C7CC43C2C8F
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 07:47:41 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 7F1AC1A00981
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 07:47:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606373259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C9hb2U+Haiu4H+qvL+MH2Ys4vkMPuS6+CsU3KVVWVNw=;
 b=UvjCPbvS2vwayktayDCT9pkKeCp2JHJHbKi8sg8z4NQ5aWsM9kRSOlap+Yc7QMDtNOqg9b
 YVeg0eEMaMwpsctoLZIa1m/xNu3/sMKcRo7ob/gxqKokoke+8Mr2/oKk3XG9N0Nd6pVm4D
 Ed6I8De+emRP1J+2E1151M+jXXb5l7U=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-A_y7oEdVOYi1U6fIKqRWqw-1; Thu, 26 Nov 2020 01:47:34 -0500
X-MC-Unique: A_y7oEdVOYi1U6fIKqRWqw-1
Received: by mail-yb1-f200.google.com with SMTP id u37so1551511ybi.15
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 22:47:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C9hb2U+Haiu4H+qvL+MH2Ys4vkMPuS6+CsU3KVVWVNw=;
 b=HlvcRryoJgmFItkpmdQmaI9+bn5/1cx3V10qeFhJuwcqWcFQmcYsTaWWGOgsyQo9oK
 OuSZSp5eHuZ/1Xzpk4lsPDPNA2qFdnECx5RlgAEV3jyN0gPUJnBagk4+rYbJ2cSara9y
 ySw6CLzi3D2Ds6VsW6EJvd7Z/pj2/HFan/qzYoNmbsZkgoGKnpmgZcn9YnF9RthzC+da
 zMsX750Bb0mIGx4hbS/TAc33BXO+0ZWrHBVajm27g9H6bcajCptCLKE4TJCAHkBZ8wEP
 Si5anCAQJgbMTX/TcMBZL38X2hlQAiA3MvSacFyvT7pNBsXluzY0IjMVkqL7EbAH7C2Q
 3qeg==
X-Gm-Message-State: AOAM5313Ld7wRikfhGBQpbiCKcvulWwKVpWarv4TDjfYhah4O/ZFNGru
 c3yudLO4JgE05b4O32Z3plwmNc34O2I8jftdZGxPuE5bWlrfhC75obamoY+fdZ1ZaONdIlj0PLx
 focJ7Bt+MFAvmhmuQNJGzoTyV+JY=
X-Received: by 2002:a25:e088:: with SMTP id x130mr2273889ybg.97.1606373253873; 
 Wed, 25 Nov 2020 22:47:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhs/M5tRC0t46RiTqTUlLxGHyaXIESGJNxyCAkGoYkkh9foQrTi+R4n1IXcdF5juQmXK6XHjlAKmqJem0cVA0=
X-Received: by 2002:a25:e088:: with SMTP id x130mr2273868ybg.97.1606373253697; 
 Wed, 25 Nov 2020 22:47:33 -0800 (PST)
MIME-Version: 1.0
References: <20201126012838.531070-1-yangx.jy@cn.fujitsu.com>
 <CAEemH2eQNTy9V+NSn+kwV8zZ0BTr+PEHuD_RPhx3Ns1v=+iPNw@mail.gmail.com>
 <5FBF3A16.6090101@cn.fujitsu.com>
In-Reply-To: <5FBF3A16.6090101@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 26 Nov 2020 14:47:22 +0800
Message-ID: <CAEemH2c3U7DY70QiVKZoUhdtLdr0QBc+VqAkFt9GzoUp-kmbyA@mail.gmail.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lapi/name_to_handle_at.h: Fix compiler error on
 centos6
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
Content-Type: multipart/mixed; boundary="===============0483603293=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0483603293==
Content-Type: multipart/alternative; boundary="00000000000029e5b905b4fceb00"

--00000000000029e5b905b4fceb00
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 26, 2020 at 1:16 PM Xiao Yang <yangx.jy@cn.fujitsu.com> wrote:

> On 2020/11/26 12:33, Li Wang wrote:
>
> Hi Xiao,
>
> The patch itself looks good, but I remember we were planning to
> drop support for the old distro e.g CentOS6.
>
> The previous discussion here:
> http://lists.linux.it/pipermail/ltp/2020-March/016164.html
>
> Hi Li,
>
> Thanks for sharing the infomation.
> When do you plan to remove old distro? next release?
>

As discussed in the previous mail, it should be accomplished in the current
release 20200930.
@Petr Vorel <pvorel@suse.cz>  @Cyril Hrubis <chrubis@suse.cz> what do you
think?


> BTW:
> It may also resolve the compiler error on uclibc as Fabrice Fontaine
> reported before:
>
> https://github.com/linux-test-project/ltp/commit/cb11e718ce04261cb6ff4c09442b949da33b8797
>

Thanks, I helped merge this one since CentOS6 is still supported in
Travis-CI now.

-- 
Regards,
Li Wang

--00000000000029e5b905b4fceb00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Nov 26, 2020 at 1:16 PM Xiao Yang &lt;<a hr=
ef=3D"mailto:yangx.jy@cn.fujitsu.com">yangx.jy@cn.fujitsu.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
   =20
   =20
 =20
  <div bgcolor=3D"#ffffff">
    On 2020/11/26 12:33, Li Wang wrote:
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div style=3D"font-size:small">Hi Xiao,</div>
          <div style=3D"font-size:small"><br>
          </div>
          <div style=3D"font-size:small">The patch
            itself looks good, but I remember we were planning to
            drop=C2=A0support for the old distro e.g CentOS6.=C2=A0</div>
          <div style=3D"font-size:small"><br>
          </div>
          <div style=3D"font-size:small">The
            previous discussion here:</div>
          <div style=3D"font-size:small"><a href=3D"http://lists.linux.it/p=
ipermail/ltp/2020-March/016164.html" target=3D"_blank">http://lists.linux.i=
t/pipermail/ltp/2020-March/016164.html</a><br>
          </div>
        </div>
      </div>
    </blockquote>
    Hi Li,<br>
    <br>
    Thanks for sharing the infomation.<br>
    When do you plan to remove old distro? next release?<br></div></blockqu=
ote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">As discussed in the previous mail, it should be accomplished in the cur=
rent release 20200930.</div><div class=3D"gmail_default" style=3D"font-size=
:small"><a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=3D"mailto:=
pvorel@suse.cz" tabindex=3D"-1">@Petr Vorel</a>=C2=A0=C2=A0<a class=3D"gmai=
l_plusreply" id=3D"plusReplyChip-1" href=3D"mailto:chrubis@suse.cz" tabinde=
x=3D"-1">@Cyril Hrubis</a>=C2=A0what do you think?<br></div></div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div bgcolor=3D"#ff=
ffff">
    <br>
    BTW:<br>
    It may also resolve the compiler error on uclibc as Fabrice Fontaine
    reported before:<br>
<a href=3D"https://github.com/linux-test-project/ltp/commit/cb11e718ce04261=
cb6ff4c09442b949da33b8797" target=3D"_blank">https://github.com/linux-test-=
project/ltp/commit/cb11e718ce04261cb6ff4c09442b949da33b8797</a></div></bloc=
kquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:=
small">Thanks, I helped merge this one since CentOS6 is still supported in =
Travis-CI now.</div></div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" cl=
ass=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wan=
g<br></div></div></div></div>

--00000000000029e5b905b4fceb00--


--===============0483603293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0483603293==--

