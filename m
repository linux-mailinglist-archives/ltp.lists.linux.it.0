Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F1732979A
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 10:08:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9BBFD3C6D65
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 10:08:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 558A53C56B8
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 10:08:10 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id A6EA71400F9A
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 10:08:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614676088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0c1E4JGMVRw1IEF0hSBBXyg4t7HE36DsQKznO84MOY8=;
 b=KZbyfJ2VqvqMjrBnYIXpJlYekw4ALh+GnEqA60nm+IhsAlZ4WMfYodUf6vONfbrHLMvdAt
 jbjgJ/bs/MwGhLOSmSQqLIuMuLDe/hEODtvKG1uVxCxeqaI18gY7hWxUOdeUcnICSTJq2d
 ixHbvOzIc8lMi7zY3mhDaUwCRL8Poog=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-lfACpwMzNuG3QqiKLOR_CA-1; Tue, 02 Mar 2021 04:08:06 -0500
X-MC-Unique: lfACpwMzNuG3QqiKLOR_CA-1
Received: by mail-yb1-f198.google.com with SMTP id g17so22065482ybh.4
 for <ltp@lists.linux.it>; Tue, 02 Mar 2021 01:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0c1E4JGMVRw1IEF0hSBBXyg4t7HE36DsQKznO84MOY8=;
 b=H11ksEvr/QERBL/wDIx3L0odGK89T5pht0vN0ANks2wBr9ePQ8wDgwQ4DFZEekLL/h
 BumXCcB0bbVgEhlp4ugXBTXR3+1NaMBUUUW4KQy/HDqZsnak4gIJJlbgHU9wL5ujA+l+
 /NsuWTQgfETBbkATgG8sA06JVwhnqtSX/+OGdcij3+WcZThKwAC24FBKFwImvakYGWj5
 IY9J5YdJeZ2JybTWuTHJddfrC8zAt54SLBZ0MkCriYnJVFDzgflrMTDYj/foJCbbqQi4
 qVS9RBbwKscLOmHY6QrBD9UJgmW0alRikax6EblmtYdLYGUYUq/8lI+6E4GG+IXnZbY/
 8a7g==
X-Gm-Message-State: AOAM533phYnbkW4eXlczGAg4ROsfc/u8rZY47A2VFxlPFj93dDGSzhNs
 EriCjxhs2NtrOxo1Wge8QyXvKjaK7FbgKIEOQt8rV6qWmHpC//zq7xpyIDZlqqU/Q09tx0k0yL5
 1/wFWVQlmX0LNDnaQerA6ne8d2WA=
X-Received: by 2002:a25:af05:: with SMTP id a5mr30202601ybh.86.1614676085768; 
 Tue, 02 Mar 2021 01:08:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPPBXrTEmzOLBlI+Gu35cxsap094GcTXzbNnclrsvdXlFdA73jX9KpbP0nI42u1p0YeQx4RTzlYac+6JhocxU=
X-Received: by 2002:a25:af05:: with SMTP id a5mr30202588ybh.86.1614676085618; 
 Tue, 02 Mar 2021 01:08:05 -0800 (PST)
MIME-Version: 1.0
References: <20210301220222.22705-1-pvorel@suse.cz>
 <20210301220222.22705-8-pvorel@suse.cz>
In-Reply-To: <20210301220222.22705-8-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 2 Mar 2021 17:07:54 +0800
Message-ID: <CAEemH2fiVoM+1DzFUv8BLntP3sPt7ijXrLg1c5iT03VdCKJfmw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 7/7] zram: Increase timeout according to used
 devices
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0765516580=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0765516580==
Content-Type: multipart/alternative; boundary="00000000000082d93405bc8a127f"

--00000000000082d93405bc8a127f
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 2, 2021 at 6:02 AM Petr Vorel <pvorel@suse.cz> wrote:

> to avoid unexpected timeout, which occurred even on just 4 zram devices.
>
> On my system where run with ext{2,3,4}, xfs, btrfs, vfat, exfat, ntfs
> it run for 12 min, i.e. mean 90s. Multiply by security constant 5,
> expecting 450 sec for each filesystem.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
>

Reviewed-by: Li Wang <liwang@redhat.com>

Apart from the two places(patch 5/7, 6/7) that need tweaking/discussion,
the patches look good.

-- 
Regards,
Li Wang

--00000000000082d93405bc8a127f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Mar 2, 2021 at 6:02 AM Petr Vorel &lt;<a hr=
ef=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">to avoid unexpected timeout, whi=
ch occurred even on just 4 zram devices.<br>
<br>
On my system where run with ext{2,3,4}, xfs, btrfs, vfat, exfat, ntfs<br>
it run for 12 min, i.e. mean 90s. Multiply by security constant 5,<br>
expecting 450 sec for each filesystem.<br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a h=
ref=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Apart from the two places(patch 5/7, 6/7=
) that need tweaking/discussion, the patches look good.</div></div></div><d=
iv><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"=
ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000082d93405bc8a127f--


--===============0765516580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0765516580==--

