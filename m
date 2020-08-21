Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9FF24CB7B
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 05:44:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D08713C2FCF
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 05:44:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 731AA3C13D8
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 05:44:07 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id E1AF010006AD
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 05:44:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597981445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4oFCveXixe7tRgQi4jMMg2/flC/d+mqkx0dO6J1a4cw=;
 b=I23qbwZ3JnvRoUtRFngEbKSWTOxsEfvS5bei8b+wcnX0bzfQvzE0z68Yfx2rFXgOKd6mi3
 hhCXIy/M/0aZjRy6SvccrudYPn5FfiI5KYhUF/KJ6z0L6UytK905TlsbgnowLcDKy2Bv0y
 VzPPfg+fjzQkDPYR3e9GiGSXS0EqQqQ=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-QvczfbV7OqSklMapEZSyRw-1; Thu, 20 Aug 2020 23:44:03 -0400
X-MC-Unique: QvczfbV7OqSklMapEZSyRw-1
Received: by mail-yb1-f197.google.com with SMTP id w17so807853ybl.9
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 20:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4oFCveXixe7tRgQi4jMMg2/flC/d+mqkx0dO6J1a4cw=;
 b=rkNpeInFkVWkjjLc0SrJV4mHZx/8uuUZnV2K0Wvzhh3DmXXG7DxQ9CCq9r9dz+Vu2g
 hyhhBwv+XjbJp79Zx4UMuM8PFlwWkMv1cI2RqgBrr6X1OM/GqN+oAFyGmRs1eH4L/NpD
 /15PsDIWcKSMSujDKQ70yDlKNP+1cfbNLfyyhecGP4bU/9lB0UOkwDw7vDG/zrGPuzLt
 H4FsyymA2Rijq7kT+ZwMLk12j5UZ6qAvZZdvez7nS4WMYjShk5Zmq6r17Q2NM4KkqCXv
 2Gnp1xT3Fkjwqi1YBPlvrVWSpArbObWWg7ILIRrwuDp2EwqLT5RbTcdjZPzQLXz30iBA
 VZtg==
X-Gm-Message-State: AOAM533qh1ta4MjR9Ran1MvXq6qg3M0UxRU9e9BiaquhBy7ZWhhYuhlJ
 hlhyou/SFLZdVza6kkfUmv6pV19qvl/qIlroPUa1JaUSnoMGthAoNBGw5nA1Oe+JDTFmAEYNDmo
 zvQVKdM7KM58LU6szg+OYQbqR2SU=
X-Received: by 2002:a25:c102:: with SMTP id r2mr1274706ybf.110.1597981442415; 
 Thu, 20 Aug 2020 20:44:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxglAUmdCe3gEs3VzEJFA4ga13yM96/LPWiDvtzBOiYpY7OjvLqaoIEu3IpSM7hbFdJWTYrUbE8Q9OwjNPoSkI=
X-Received: by 2002:a25:c102:: with SMTP id r2mr1274694ybf.110.1597981442204; 
 Thu, 20 Aug 2020 20:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <1597919168-10702-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <1597919168-10702-2-git-send-email-zhufy.jy@cn.fujitsu.com>
 <CAEemH2eUd3yCuxt3iawHPXKUSryiJprud3HvneSr=JK_1wFhXg@mail.gmail.com>
 <43a404a1-dd4b-d091-5723-e756604fbbc8@cn.fujitsu.com>
 <CAEemH2fjgYGLD0+JozNcMqv3Eo0eAwK8+BKOCo0QZihUPiP6eg@mail.gmail.com>
 <ebb95886-a352-ab26-2d40-8a3e2e7fa62f@cn.fujitsu.com>
 <CAEemH2dzPyHYdnMJa1A15dLrLrt2m5q5HKo6PY+nrVzBuJjv0g@mail.gmail.com>
 <a6f38749-60fd-94b2-ea2c-c7c9f9a6dd1f@cn.fujitsu.com>
In-Reply-To: <a6f38749-60fd-94b2-ea2c-c7c9f9a6dd1f@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 21 Aug 2020 11:43:50 +0800
Message-ID: <CAEemH2d+SSFQnodfY+5QWKdbcr6m_ep_Bi65ynt1AxNQh3N8eQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] syscalls/kill03,
 04: Cleanup && Convert to new library
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
Content-Type: multipart/mixed; boundary="===============1095816455=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1095816455==
Content-Type: multipart/alternative; boundary="000000000000387f0505ad5b0c3d"

--000000000000387f0505ad5b0c3d
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 21, 2020 at 11:34 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> ...
> Yes. I think using current process id instead of 0 is more easier
> because the invalid signal can't kill process forever.
>
> static void setup(void)
> {
>          real_pid = getpid();
>

Agreed!


-- 
Regards,
Li Wang

--000000000000387f0505ad5b0c3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Aug 21, 2020 at 11:34 AM Yang Xu &lt;<a hre=
f=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span=
 class=3D"gmail_default" style=3D"font-size:small">...</span><br>
Yes. I think using current process id instead of 0 is more easier <br>
because the invalid signal can&#39;t kill process forever.<br>
<br>
static void setup(void)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0real_pid =3D getpid();<br></blockquote><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Ag=
reed!</div><br></div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></=
div></div></div></div>

--000000000000387f0505ad5b0c3d--


--===============1095816455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1095816455==--

