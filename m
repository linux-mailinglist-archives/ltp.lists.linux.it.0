Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDDD310799
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 10:20:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 336A53C70D5
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 10:20:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id CE3053C4F38
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 10:20:36 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 530A7600712
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 10:20:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612516835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8+WOG94WEe/1J3zM9TkuKJCDDEVycLNA7eLf2W8L0EE=;
 b=NxRpT/2R6hnanE37QvD8oJjc56Qd1D8J+MljmvE9x613wXxTYohWoe2/KCZO94ykCUz6XJ
 YWWSW/hzL67BIVuJhqM+QUefc8o/k6VZLNcTytXz3pXxx0sJb7CwlrF/buJdexp/VvulYb
 UJn/7NCAZR1oFtdN/HwpNTd8639ph7A=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-BOfLB4MlOvuhUot4mHbWxQ-1; Fri, 05 Feb 2021 04:20:30 -0500
X-MC-Unique: BOfLB4MlOvuhUot4mHbWxQ-1
Received: by mail-yb1-f200.google.com with SMTP id c12so6382091ybf.1
 for <ltp@lists.linux.it>; Fri, 05 Feb 2021 01:20:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8+WOG94WEe/1J3zM9TkuKJCDDEVycLNA7eLf2W8L0EE=;
 b=O1P0QdhAlb2tgjmX43vLpfNmc+eMQlSTlxfwlAvFJiXyCZHS+EyReQjUeNtugrLFDe
 f3V7z4M9OLIitOGvXhn899+Qe3EjRdhN6eUwA6Lzt7F/j5E9f1bl+1lUKo53T78O4+qU
 uqZa4wMPwxCVv4fYiOj7qYbQXxUGyOfe741CXzVCAmj96f/klwMEqtphzoD7X/i7IXFy
 joRNJmG+K3e82TEKW3qH79jD/4xMElP3md/a6ZrxRHdx0GKyi6EAs2OToXiNWB1ao+Os
 S04gINOk0fVJ9u0CzhOXgqIdO9fPdRgGwS9uRqucavzs+3ZkdjQOK/Zb5BdotjTbv59K
 Jeug==
X-Gm-Message-State: AOAM5325lcH8SZJoRm2FaXKkTF/4I1Fz70TC4uEhYFF2dVeGD2eyK510
 Ph6XHtQNVKMMOaExav+LXKZ3yPhrgGm5zXMajicXL5aTBKaMpQ7IsuzWqncah1ZtSSZd2QFDfkw
 DlVNY8zuAjVBWkekROoFlDhtiRZs=
X-Received: by 2002:a25:aa03:: with SMTP id s3mr5189064ybi.243.1612516830341; 
 Fri, 05 Feb 2021 01:20:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxnBGqPYm0Hyu9F75vol0K3Z/vpukDhjOAZJlg1Zoi80+yFcWlAbwg9gPF10dtxpz6MgB+6t5PDFRW73wsTv0=
X-Received: by 2002:a25:aa03:: with SMTP id s3mr5189042ybi.243.1612516830155; 
 Fri, 05 Feb 2021 01:20:30 -0800 (PST)
MIME-Version: 1.0
References: <CAEemH2eiTY7YgSYLr6_skK6PaRZb2_GchbmHUJKVuW7btA15rQ@mail.gmail.com>
 <1612440762-22389-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1612440762-22389-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2ehgnR0Ad5VzR63KgtjFBoqH5N_1b13T7f5Gw6n3EkzdA@mail.gmail.com>
 <601D0912.8@cn.fujitsu.com>
In-Reply-To: <601D0912.8@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 5 Feb 2021 17:20:18 +0800
Message-ID: <CAEemH2fDKbTna-+pSMkav+bn6hNtkWdRt1rbuGNfsrKfYH_bWA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/5] syscalls/mallinfo02: Add a basic test to
 check use mmap or sbrk
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
Content-Type: multipart/mixed; boundary="===============1564071244=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1564071244==
Content-Type: multipart/alternative; boundary="000000000000db2d0f05ba935464"

--000000000000db2d0f05ba935464
Content-Type: text/plain; charset="UTF-8"

Hi Xu,

Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

I have reply this email, but I don't see it on inbox or patchwork, so again
>

Plz stop replying to this, I have received three same emails so far :).

-- 
Regards,
Li Wang

--000000000000db2d0f05ba935464
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuy=
ang2018.jy@cn.fujitsu.com</a>&gt; wrote:</div><div dir=3D"ltr" class=3D"gma=
il_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I have reply this email, but I don&#39;t see it on inbox or patchwork, so a=
gain<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">Plz stop replying to this, I have received=C2=A0three =
same emails so far :).</div></div></div><div><br></div>-- <br><div dir=3D"l=
tr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>=
Li Wang<br></div></div></div></div>

--000000000000db2d0f05ba935464--


--===============1564071244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1564071244==--

