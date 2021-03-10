Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F88B333DE1
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 14:32:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4E123C4C02
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 14:32:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id AFC5E3C0BAF
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 14:32:32 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 5F372200D5A
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 14:32:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615383150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hXUNiBk3UZEwN8BHHDLXQzKfm9K5mvjQ3y5Wp7FhmBQ=;
 b=X6YzEGGgCeFqXlLJQ+Igqep1aluki4BUVDDJU66fdYqPlen17Avg2UphAiApbIepb2jNov
 yeegKdqvLj4zUC+tDc5IY15cKLgDJ5uY84bRpQEiIAKJk52/GqL2laiohfSoBBvwJCAiPP
 Blxe7DBnmG+Jay/r/ht91So0n0whmY4=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-k7xRpGARM_G8v85GzfLMmw-1; Wed, 10 Mar 2021 08:32:27 -0500
X-MC-Unique: k7xRpGARM_G8v85GzfLMmw-1
Received: by mail-yb1-f197.google.com with SMTP id v6so21287688ybk.9
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 05:32:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hXUNiBk3UZEwN8BHHDLXQzKfm9K5mvjQ3y5Wp7FhmBQ=;
 b=nIwEylWYle3zTAq5AMZWiOSOJ9qA/YTpV0VlMuq6OaPuF7bCWjJG0KcYYaw8OtL7W8
 rPUOsaaFMqICDK6cY1KTgS3i37GbQQ6WLGBLA5g6ZEj+hcLm+yELHU4NYgQPgd3UDney
 B+/Dn4R2ZpP7Ct7uFEJgPGTbUZJn4Wfi49K77SbsxeSPXw8z6JWLoH26qrNWqCwdU/Xk
 GfSFrDNzN/JLDUUPIj9PaK9XVgr8GNqYCkmZlmONPPJx4KvBpicaTbNWu5KKUMqxr5wC
 eo8tBkxU8192CWXZ0o2SP0Xd4g8hxekpXYOWXpNMAXXpyAlBANtaQAz1pdmFDOnyOld0
 osPQ==
X-Gm-Message-State: AOAM533mSFbesekB0mm4ypGSEPT/5zQZ5HZahmjFq0aBnw4OaDAncF2F
 0ZLYZuHa//zRu60vqTyrRNve7Pq8M5tNFOzIKkT3/8r6wTl5xDLbc9+y3oUqFGC4T+PTuR2UfDV
 IOgccp5DoqNr3zB6rbOxvsqWOp3o=
X-Received: by 2002:a25:58c5:: with SMTP id m188mr4346079ybb.286.1615383147171; 
 Wed, 10 Mar 2021 05:32:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyD8Wga9MRqxMwPbInHYIBw6Mz/Q32bptQgipl5RrIsYsmugHKgqrhLYBYeLzJQ5hHy4xZ0gt/9SgBUnQetR/k=
X-Received: by 2002:a25:58c5:: with SMTP id m188mr4346051ybb.286.1615383146924; 
 Wed, 10 Mar 2021 05:32:26 -0800 (PST)
MIME-Version: 1.0
References: <20210309080028.16284-1-liwang@redhat.com>
 <20210309094525.4ggmppfpvavsvjzl@vireshk-i7>
 <YEdhgvXg/mYkppz6@pevik> <20210309115623.ze5c7li7vuf65gvg@vireshk-i7>
 <CAEemH2esvVfy0YeCL2nXgj441XeBY7F+Y8MVEJ31nKRNPvjC+g@mail.gmail.com>
 <20210310084304.d6b626clzj5rafvh@vireshk-i7> <YEibPvXnSpGceN/e@pevik>
 <CAEemH2c0LQPc1dY=ErruKHOGU3OXeKXQgh3VMaYveZN+qVnCKA@mail.gmail.com>
 <YEjFeGrGsYrr/n3U@pevik>
In-Reply-To: <YEjFeGrGsYrr/n3U@pevik>
From: Li Wang <liwang@redhat.com>
Date: Wed, 10 Mar 2021 21:32:15 +0800
Message-ID: <CAEemH2f2pSseGq5zakd7EVieKSCOOPHCSh+ZCFqppfWF_bA41A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCh v2] clock_gettime04: print more info to help
 debugging
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============2074130047=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2074130047==
Content-Type: multipart/alternative; boundary="000000000000a6313305bd2eb27e"

--000000000000a6313305bd2eb27e
Content-Type: text/plain; charset="UTF-8"

Petr Vorel <pvorel@suse.cz> wrote:

...
>
> > So, would you mind if I merge this V2 patch first?
>
> > (Since we're encountering a sporadical(we can't reproduce it manually)
> > failure. Hope this can print more useful info to locate the issue.)
>
> Although I'd slightly prefer if it printed everything once in the setup,
> it's
> not important and we've already spent quite a lot of time with it, so sure,
> go ahead :)
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>

Thank you so much, Petr!  Merged.


-- 
Regards,
Li Wang

--000000000000a6313305bd2eb27e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel=
@suse.cz</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_attr"><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmai=
l_default" style=3D"font-size:small">...</span><br>
<br>
&gt; So, would you mind if I merge this V2 patch first?<br>
<br>
&gt; (Since we&#39;re encountering a sporadical(we can&#39;t reproduce it m=
anually)<br>
&gt; failure. Hope this can print more useful info to locate the issue.)<br=
>
<br>
Although I&#39;d slightly prefer if it printed everything once in the setup=
, it&#39;s<br>
not important and we&#39;ve already spent quite a lot of time with it, so s=
ure,<br>
go ahead :)<br>
<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br></blockquote><div><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Thank you so much, Petr!=C2=A0 Merge=
d.</div></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" clas=
s=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<=
br></div></div></div></div>

--000000000000a6313305bd2eb27e--


--===============2074130047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2074130047==--

