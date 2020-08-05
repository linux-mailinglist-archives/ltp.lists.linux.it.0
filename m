Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3B923C9E6
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 12:32:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 963803C32BC
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 12:32:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E81BC3C250C
 for <ltp@lists.linux.it>; Wed,  5 Aug 2020 12:32:12 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 747D81401D9F
 for <ltp@lists.linux.it>; Wed,  5 Aug 2020 12:32:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596623531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WNAholLKn4QVZDM8/uJfuWq+rajUfSig+MFwNKGuAgw=;
 b=d3CqsbcCF0J6wOuHveeWSkJGZZEZzDGFkxVu3eHm/uZWbuWz2TPurdtwfo7du8gnIrKppt
 3x9fYXF/eIuGWmB2XPs0/wlgNtk7MJjsIkhtX+YzgD92JTtvlCkxmgJtC+NhxGddJsH6lQ
 TS4iDOBP0SxXlOljAufSFLt1/JiXBE4=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-0KwazK5kOLe0TctswO0vnw-1; Wed, 05 Aug 2020 06:32:08 -0400
X-MC-Unique: 0KwazK5kOLe0TctswO0vnw-1
Received: by mail-yb1-f200.google.com with SMTP id x184so55764701ybx.10
 for <ltp@lists.linux.it>; Wed, 05 Aug 2020 03:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WNAholLKn4QVZDM8/uJfuWq+rajUfSig+MFwNKGuAgw=;
 b=D7XxWUnnpA7d1mhIHaxXjmi+P3mRItC2wC8cdLYYxh94p+gkdRIk0N5czKTlOuAhCw
 DcuMpQGeieX0/59zRA1DMZUKImI3IOWBlh7XObpkZahhq1vZsL+9I9DpuhXxHY0j7agt
 WxUk2nk4aZAzSi5AcJSHAu8F28uV1C5Ef4u1XjEv1IAzgS+M6RASqI4vU2mUJAgo1NJI
 CJsEKVR8zj9/TSz6GuvPP2CWrD3LEvnd3Ks8IrgWphr61p3vFE0dO6c/f82oHU5kaHCM
 DTPpXYDmJjxLbqnX5iYNPio9KHymJQuGbgls65bIZzgL7O7HSlOsVlrfmQ4NGPhRKVOR
 oWAA==
X-Gm-Message-State: AOAM532mFoCJgkei1umEgbn3PRHwY9xVswpC7E9J4ubINOmO5qkEI8kP
 FxWaZAdhJPQOsjyNNZ+YAKi/XmLqzsNuQaf+nCbRF6xEzkOgJL1f62G/IBfWYgOMTKMzhefT4Ry
 uxtgiqOkY1Tj/6mJuZAP68jdGgDM=
X-Received: by 2002:a5b:44d:: with SMTP id s13mr3715871ybp.403.1596623528341; 
 Wed, 05 Aug 2020 03:32:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnEFFc4H/PZKJPJTqWSEP29KhqST6ZhXggvz2JZEC6Gi4mfcO4SmCl52WDkKxwgeUivST/+lgw6B864WyFbDI=
X-Received: by 2002:a5b:44d:: with SMTP id s13mr3715844ybp.403.1596623528096; 
 Wed, 05 Aug 2020 03:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200731121508.12805-2-chrubis@suse.cz>
 <550701550.5736445.1596440755258.JavaMail.zimbra@redhat.com>
 <20200805092703.GB5522@yuki.lan>
In-Reply-To: <20200805092703.GB5522@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Wed, 5 Aug 2020 18:31:56 +0800
Message-ID: <CAEemH2dAmvMAQxJeRrNGnGo0Gw_Szn8CfOho3KNZTHoCBfUkJQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] build system: Add explicit make rules
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
Content-Type: multipart/mixed; boundary="===============1527406097=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1527406097==
Content-Type: multipart/alternative; boundary="0000000000003b8c2405ac1ee228"

--0000000000003b8c2405ac1ee228
Content-Type: text/plain; charset="UTF-8"

> Great idea, I've added these changes to the first patch in the series
> before I pushed it.
>

There is still a DIR output at:
  include/mk/generic_trunk_target.inc:84:     echo "DIR $$dir"; \

Not sure it is on purpose or forgot removing?

-- 
Regards,
Li Wang

--0000000000003b8c2405ac1ee228
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">=C2=A0</div></div><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
Great idea, I&#39;ve added these changes to the first patch in the series<b=
r>
before I pushed it.<br></blockquote><div><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">There is still a DIR output at:</div><span c=
lass=3D"gmail_default" style=3D"font-size:small">=C2=A0 </span>include/mk/g=
eneric_trunk_target.inc:84: =C2=A0 =C2=A0 echo &quot;DIR $$dir&quot;; \</di=
v><div class=3D"gmail_quote"><br><div class=3D"gmail_default" style=3D"font=
-size:small">Not sure it is on purpose or forgot removing?</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div></div>-- <br><div di=
r=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div=
><div>Li Wang<br></div></div></div></div>

--0000000000003b8c2405ac1ee228--


--===============1527406097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1527406097==--

