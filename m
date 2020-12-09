Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD06D2D4231
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Dec 2020 13:37:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A68C3C2BDD
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Dec 2020 13:37:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id AFBCE3C2B8A
 for <ltp@lists.linux.it>; Wed,  9 Dec 2020 13:37:47 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id B5D651A00F1B
 for <ltp@lists.linux.it>; Wed,  9 Dec 2020 13:37:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607517465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GFvZ8EWzvWc+usI3/QwGudburUk0vyGylV8SLmlWp58=;
 b=Ej66pdnGRgd4jFreB3G7gOZ8hQdIDyGJlWcDHpKLkldV0gOfbCnzBpC7qKE1vqk0iEfvsb
 pJfV0B63cLfK2Yi6Ej+SNldDPZO9xz4qDKj0LLRq/PqvKRkdXLaDVdR1JWqxssLkCS8+dX
 wZipDt+6LYVNzK+4NoxoxmVdo2ihztQ=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-OnWtqTJwOYS8dZrJcl7_xw-1; Wed, 09 Dec 2020 07:37:41 -0500
X-MC-Unique: OnWtqTJwOYS8dZrJcl7_xw-1
Received: by mail-yb1-f200.google.com with SMTP id h75so1833920ybg.18
 for <ltp@lists.linux.it>; Wed, 09 Dec 2020 04:37:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GFvZ8EWzvWc+usI3/QwGudburUk0vyGylV8SLmlWp58=;
 b=CAr5DIrkPaopI2sVZ7P5+J5wnOPmDxluTQRCv1hlCA85DEC0DX6+uLlfsJ4sDB35k2
 W1BIQHmrf/qS7PJJ9bZlKskiyuTgLjlgzNzJmD7aVISj007FceDEWyCBhOzzDwBET8IS
 Zxp2BlQ6wnz25EV045CeNpHKbObRk3/M3dH0rUOHc5i8lm/CuAG9F8Exl+l+RdzljaMo
 9B5+ChQ8P6pxCP4AWwqsFFTSqR0qBNgb1XBGpylUsnn6kxoVIrbRvN1gNyRs5NBKCYub
 UwRMO7j77p+VJ4p3bbGDY4rTYPbTrEaZfI5dQShgcL8R4I1hFRuwR44dg58afI4INMY1
 k5KA==
X-Gm-Message-State: AOAM530n3bEFXarVpTodGsDW48qdfnCdFXX+jNQ+4k/IMHNpnV/ylvvG
 26SvT4TruPj/PYfEABGX6WwpFeKeGjXsC8IR26+9eMuZ5q2YHIXeWMOwowrDQX+5Qyv5BZ/X9xy
 4JSiOmeofsGsw98nsuRy6FiIgVpo=
X-Received: by 2002:a25:6902:: with SMTP id e2mr3208777ybc.97.1607517460671;
 Wed, 09 Dec 2020 04:37:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjxke9fB0PqLZtC2e1NDOX9PGddNeiOrV/t/HLuYG9pbzb6zDHNzodta39UBQcQL2kNJmWVyTViUuHkEUw8e0=
X-Received: by 2002:a25:6902:: with SMTP id e2mr3208752ybc.97.1607517460454;
 Wed, 09 Dec 2020 04:37:40 -0800 (PST)
MIME-Version: 1.0
References: <20201203110616.28302-1-liwang@redhat.com>
 <20201204063305.6820-1-liwang@redhat.com>
 <20201204063305.6820-3-liwang@redhat.com>
 <80776321-e6ae-0817-5e9b-d3009922b0cb@suse.cz>
In-Reply-To: <80776321-e6ae-0817-5e9b-d3009922b0cb@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 9 Dec 2020 20:37:27 +0800
Message-ID: <CAEemH2fcG9y+2HX5C49rS0+Ufy=6JhhWwnkGiY4kn0vvpBEuZA@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
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
Subject: Re: [LTP] [PATCH v2 3/3] af_alg07: add dynamic bias for ARM
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1634408456=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1634408456==
Content-Type: multipart/alternative; boundary="00000000000033793e05b60753d6"

--00000000000033793e05b60753d6
Content-Type: text/plain; charset="UTF-8"

> Reviewed-by: Martin Doucha <mdoucha@suse.cz>
>

Pushed, thanks Martin and Richard for the review.

-- 
Regards,
Li Wang

--00000000000033793e05b60753d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">=C2=A0</div></div><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
Reviewed-by: Martin Doucha &lt;<a href=3D"mailto:mdoucha@suse.cz" target=3D=
"_blank">mdoucha@suse.cz</a>&gt;<br></blockquote><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Pushed, thanks Martin and =
Richard for the review.</div></div><div><br></div></div>-- <br><div dir=3D"=
ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></=
div></div>

--00000000000033793e05b60753d6--


--===============1634408456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1634408456==--

