Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7C125A59E
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 08:35:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C71D33C2D77
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 08:35:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 273C03C181A
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 08:35:47 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 6474D1000970
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 08:35:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599028546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eb8KKPnO/8R/L7Snc2nUvLEc2F7dZrq/jMjzFZHllHM=;
 b=bSLHrstORjJWQYqqq8n1uZT5MouTjMNthxeAO4yUSvSYCX2HzCMg0qZi62+KpqNGHVvFcN
 DQZ6eT6rk3dbL3d7sJrWHMCr9HP20PQiiDdXhWr3rgwVBgFT2ie3xnaCGbSSqkaJcVcNaN
 2HLIt8h2kf+trxh9pV03+WfOR85Mi74=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-SfUbFW2VON2Xaxfo_GJbGQ-1; Wed, 02 Sep 2020 02:35:43 -0400
X-MC-Unique: SfUbFW2VON2Xaxfo_GJbGQ-1
Received: by mail-yb1-f200.google.com with SMTP id j20so3999155ybt.10
 for <ltp@lists.linux.it>; Tue, 01 Sep 2020 23:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eb8KKPnO/8R/L7Snc2nUvLEc2F7dZrq/jMjzFZHllHM=;
 b=EB9emiY0ziD1a1P4VaGOY2YVGswB67+fuxZxjBV8Pc9kUTdmXJNlw7gfO8h5ZSkAy6
 npyYFWE8F3fgKwMVD8/2qZvPUHklYwqayudBiApIZn5hYW7yZY2nx75fmzCy22DVgLkd
 TYR+j6C9FWE3l9UAP6A2jJWeiB9M/oPvqcL0RPUxkLhoZWl9EAbndrXfWlBrDybXMzu1
 Mpt6jVWOllJkiNZaFQiZoXfS1tMLpEVKAso9fzUXcv5XtbiOI1jQrlc2Oo+SYHHgaLhG
 9AD4xFdGVawIi+aRCR7xJWVAEhkwPinV9GPbvLjPiAM/sbnEbusFzR6qVaofpW71SxoG
 zesQ==
X-Gm-Message-State: AOAM532ZBFC/sAGju37l2VPdZ3aEfY4iYsLts6vkz+0GqsKlV1ujIH+9
 YTyaiVbbbHwb6XHzsyG7twNvsosESE0iW6lwx89AJRoSyfR52vRJTCrM5qj5AjPWsuFq7iB2c6w
 PAg9H4oqrfnOQPyZN6CQ+2WZ8Iko=
X-Received: by 2002:a05:6902:6c1:: with SMTP id
 m1mr8091607ybt.252.1599028542977; 
 Tue, 01 Sep 2020 23:35:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLv5gknToXtflTP/YA6iP8uhCaOCPqP7XUvyrNHRWprQfikNTntwZX7IF0LtwkQGiU0aB7tbYorrpvmVeCnF0=
X-Received: by 2002:a05:6902:6c1:: with SMTP id
 m1mr8091569ybt.252.1599028542471; 
 Tue, 01 Sep 2020 23:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <1599020410-17254-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1599020410-17254-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 2 Sep 2020 14:35:31 +0800
Message-ID: <CAEemH2ej=mTXky_TS8Bu5wt7-EFmbmN3od2QbFqWO3Q+dt=CGw@mail.gmail.com>
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
Subject: Re: [LTP] [PATCH] security/dirtyc0w: Add CVE tag
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
Content-Type: multipart/mixed; boundary="===============0196587323=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0196587323==
Content-Type: multipart/alternative; boundary="00000000000042993905ae4ed8b8"

--00000000000042993905ae4ed8b8
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 2, 2020 at 12:20 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Also use correct fix commit id.
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>

Pushed.

-- 
Regards,
Li Wang

--00000000000042993905ae4ed8b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 2, 2020 at 12:20 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Also u=
se correct fix commit id.<br>
<br>
Signed-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" =
target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br></blockquote><div=
><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Push=
ed.</div></div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_=
signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></=
div></div></div>

--00000000000042993905ae4ed8b8--


--===============0196587323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0196587323==--

