Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A266A18965F
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 08:55:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 327743C552A
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 08:55:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 939CD3C550F
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 08:55:13 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id AEE1C600C33
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 08:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584518111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=67elM3ABdnSrSa8Tg0URkrUrOovqo5kw6Lpi8N+/9mU=;
 b=Xhp/hGDizKk1iEr+ksEpZ55+ehV37d0U4QgrcQl9sOUQwqZFWPqEtlz+sPdI7yO9t0G2fX
 2FVNHCL5HQufVOl3p1yoiibZRe8ioKhv5H9RwfDHLjyac/QITumcQ9QTIRoVcwF5bI1I6o
 l0MXMy47YansjVNWj4olEEuWJEvSsYo=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-RN1HbUTAOtKptlb1hNEpsg-1; Wed, 18 Mar 2020 03:55:08 -0400
X-MC-Unique: RN1HbUTAOtKptlb1hNEpsg-1
Received: by mail-oi1-f198.google.com with SMTP id y82so14904001oig.11
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 00:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hILw0v33YjFDBP3GfaDJIWxyztdr6Uwm0Y6Idv2VAlk=;
 b=KomEHN/Sh6Uuh7dspQiNMpQuM0i/yRNWnXj18PmGHHKTdFnCZTc1UeMq/+eAJtBkBB
 CTVJHZp6qZ5Nkf03N0twUhoJogf4ApyISK9vOWDNiGqvjm5xwCDj9NuXFtvqrkRrG+MN
 6P8XbAP3FkzqGh9Tt4WDqfUFAZdQZ5qurr1R6kAO16hx8ZBvNzQkQh33XBlywmNuET8r
 ufnogx2d37PTHGDVmdcRls0mym96AUxAE6nGIGsO73LM8nSKHfecaAQnLOMbaKT2dun5
 VWI7kV+1klGznMhXDPvRYW0vPpKPhrJCRkipTp74LE6UJQozD9yOha9SBEuiqNgWYD1V
 URDg==
X-Gm-Message-State: ANhLgQ3WA4iZwCV7T6twX2UkpYpioKcWsXvOl/HVM1mRsVZfj+BsvChw
 pC8oqum/GiXu/98VfjFAXPks6kW4x1DSKmb3AEc8lcYebH1cvXdcuJ/EAbuDSyH2XVFpL29/yzg
 TguXSCX+d1Imxw0PcGWMB8//7+iw=
X-Received: by 2002:a9d:4b98:: with SMTP id k24mr2692409otf.26.1584518107591; 
 Wed, 18 Mar 2020 00:55:07 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vscjiWKGkHCjEDv1leiWC3NgN+AB7ZDu/nZv3vCYXo3jBqospFMLvnHGauQzZPvVfy7LSxu8vDsSbuJa6Bma6w=
X-Received: by 2002:a9d:4b98:: with SMTP id k24mr2692390otf.26.1584518106964; 
 Wed, 18 Mar 2020 00:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <31b0bde3ac9d0e617c2878a9b4ae1e1dc1f39c10.1584515853.git.viresh.kumar@linaro.org>
In-Reply-To: <31b0bde3ac9d0e617c2878a9b4ae1e1dc1f39c10.1584515853.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Wed, 18 Mar 2020 15:54:54 +0800
Message-ID: <CAEemH2cENViHP=gXjuZKbhUDhVf=msLohnSjZYrPNJBTJOZ3jg@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/pidfd_send_signal: Use local pointer to
 verify signal data
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Christian Amann <camann@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1904961705=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1904961705==
Content-Type: multipart/alternative; boundary="000000000000e7ff6c05a11c5e97"

--000000000000e7ff6c05a11c5e97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2020 at 3:18 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> The current check, uinfo->si_value.sival_int =3D=3D DATA, will always
> evaluate to true as we are checking uinfo by mistake instead of the
> pointer passed to the callback. Fix it.
>

Pushed. Thanks for the fix.

--=20
Regards,
Li Wang

--000000000000e7ff6c05a11c5e97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Mar 18, 2020 at 3:18 PM Viresh Kumar &lt;<a=
 href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The current=
 check, uinfo-&gt;si_value.sival_int =3D=3D DATA, will always<br>
evaluate to true as we are checking uinfo by mistake instead of the<br>
pointer passed to the callback. Fix it.<br></blockquote><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">Pushed. Thanks for =
the fix.</div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></d=
iv></div></div></div>

--000000000000e7ff6c05a11c5e97--


--===============1904961705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1904961705==--

