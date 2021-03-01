Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B78FE3277A9
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 07:36:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BCC83C574C
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 07:36:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9F4473C5708
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 07:36:24 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 13A0A20097D
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 07:36:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614580582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ogDlpW7gd8aEfeJ4SH59TxxITLWlnW6yOhUG7uCP1jQ=;
 b=LNZrQbN0izNXugtxRwbkeE5dvtsIg6++JNXx/DNHmUY3c6mpOjZyzf3dkaFWadVnuGbXLy
 KFzo2WJMXiDB/on/sgnvjnRr5NlefIAnjBZSqoqeSkFkCeAyyIZ3nNiSc/gxtCZL1fAmNm
 ogIOEQ6zA2pgVJURRlno614B4n1qEu8=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-eXu6IGpANv-8pLlke3eciQ-1; Mon, 01 Mar 2021 01:36:19 -0500
X-MC-Unique: eXu6IGpANv-8pLlke3eciQ-1
Received: by mail-yb1-f197.google.com with SMTP id l10so18257345ybt.6
 for <ltp@lists.linux.it>; Sun, 28 Feb 2021 22:36:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ogDlpW7gd8aEfeJ4SH59TxxITLWlnW6yOhUG7uCP1jQ=;
 b=ItHDhoS11MwHMU5XST2j1QfONKksNA7uizPsLjYX9HrsPGNA60UI906YCPH/XvRSK7
 bSrA0pvRLznoaPcqkuUINzsg0tiaPf6yZd4dLKhUrtZbDb2zRCBFzBrvnr2M0jY+MlT6
 0/e0x8VEXarnjip7y4jUbbRJX8rieEZUlfBnyki7M2DExNK1OrYiPz3Ps+pFsQOHjDnv
 luLAabOCNMc9tOHkbToc5/SKkIbTGt6axqbx8BuNJQUMI2CsG663Bv8fSCDcUw+8KlfQ
 E2BIuT5/0FtJcpf3c+bhSNZiKhYDJ5QSFphypX8PWy0ydoX7ZrD23G/q+CzSa6VGr+yD
 4QFw==
X-Gm-Message-State: AOAM532MMo6v0rUIH5sn1CCUjGGhTDs8mFXaoKpSFTp2maqXW+euHoaD
 lsAkj7dMi3YA9t3O+L66xubi8RqDvCz+xmTi/Ty3MZeru2JrBiedev1Oe/6t/s4Hlo9t6Xg4eMc
 2a+tVkpukdeA2LdYUEDWUkdLTGdE=
X-Received: by 2002:a25:5ac2:: with SMTP id
 o185mr22685862ybb.252.1614580579500; 
 Sun, 28 Feb 2021 22:36:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHIr1/9KEyFzEvhRbyDL457k8oaaw6UKtgoLoQ2p+UPT4lIikBNfRhj4O/GIP4zAYpbpwpnzjhrabEfe5if3k=
X-Received: by 2002:a25:5ac2:: with SMTP id
 o185mr22685850ybb.252.1614580579296; 
 Sun, 28 Feb 2021 22:36:19 -0800 (PST)
MIME-Version: 1.0
References: <20210226153711.13645-1-chrubis@suse.cz>
In-Reply-To: <20210226153711.13645-1-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Mon, 1 Mar 2021 14:36:07 +0800
Message-ID: <CAEemH2ebeC=fi0U_OahsOBz=c4RKF7J29gbJBsb7c3nrcroFLw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
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
Subject: Re: [LTP] [PATCH] syscalls/getpid02: Also check the fork() retval
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
Content-Type: multipart/mixed; boundary="===============0070597822=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0070597822==
Content-Type: multipart/alternative; boundary="000000000000e404c605bc73d5f4"

--000000000000e404c605bc73d5f4
Content-Type: text/plain; charset="UTF-8"

Cyril Hrubis <chrubis@suse.cz> wrote:

The return value from fork() in parent must be equal to getpid() in child.
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
>

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--000000000000e404c605bc73d5f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz">chr=
ubis@suse.cz</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_attr">=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The return valu=
e from fork() in parent must be equal to getpid() in child.<br>
<br>
Signed-off-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=
=3D"_blank">chrubis@suse.cz</a>&gt;<br></blockquote><div>=C2=A0</div><div><=
span class=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang=
 &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</span><=
/div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--000000000000e404c605bc73d5f4--


--===============0070597822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0070597822==--

