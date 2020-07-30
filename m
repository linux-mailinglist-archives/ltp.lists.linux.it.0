Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D2A2328AA
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 02:21:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9DEC3C2656
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 02:21:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C93933C0196
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 02:21:29 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id E41716017D3
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 02:21:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596068487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lNgrXCUb/07E89aD06+q6fztL5s4E8wrKvD/YtcYPko=;
 b=iMdtM6DeCWmVjBbtffrh0BaWFW+dQuHVBOfG+RB71ctf3W1QwPHalOI8MsVjSYbz6S2BW0
 5DN7yvHwFSQPoWGCsI+OvN2VfRpFq/zB3yr6DxT6/RABTdz3egZbYPvU2O1yf6yEZ5OhrW
 hhC3PrQpvAcFsnFI8Ln55Czy6tbAIpo=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-i3nMN-1_MrKNC_Hi0hKqmQ-1; Wed, 29 Jul 2020 20:21:23 -0400
X-MC-Unique: i3nMN-1_MrKNC_Hi0hKqmQ-1
Received: by mail-lf1-f72.google.com with SMTP id w24so4820504lfl.6
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 17:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lNgrXCUb/07E89aD06+q6fztL5s4E8wrKvD/YtcYPko=;
 b=ecsxmeAEeL9kC28f8fqBcpsaSI8NAd9dM+AYqrEZI+KcTugYlBbA21lIAX/Ig6fFQV
 YAC9Uu4g+lb/stdFBfgFlXChjX9YPCd5ypwt+o8D48Cf+2LN4XuuZ2CBsZTujnD6sKri
 ghAZfKmfgnHkW8+H5vGNzCBnJISrRr+9k4rMD/go7eklz8tThur3OHRXn02S4JMFkz2K
 tSYXldqeTEXQ5FsIKZHssKS0nJy4Jt/aBQq5VOqWvw5PgiwuPTXwy7aAd/aezIBlkaxc
 zzxBoMBfmsUfES9luYjSSTDPlIa0KfryqxWNfHc76ABDiVDOct8YML0WE6VQBOg8Jz8n
 dN4A==
X-Gm-Message-State: AOAM531EcHYoaTCrum6PneKhwMkM2KVWrSAKHT4Y4iv2Zo8pp9pXpJoc
 wZ5XgLWEa1g+2wQs/DT9FwblEC3YoO5cgp9xZwICdx+s9+n3TijV0OiTms4Ja2z95C8Xnrq0hQ5
 0B6iuW9KNXdG44aAsmYLCo9MqCr8=
X-Received: by 2002:a2e:864e:: with SMTP id i14mr172620ljj.441.1596068482300; 
 Wed, 29 Jul 2020 17:21:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmy3ofCS4QRIir+ywui/oAaS0xVn4xZeTNhbN/2Jy+ngLe6vtAPXvziezHjI9K1HA4rKf5TVI9mla8YAKqC0Q=
X-Received: by 2002:a2e:864e:: with SMTP id i14mr172609ljj.441.1596068482065; 
 Wed, 29 Jul 2020 17:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200728162207.332109-1-ernunes@redhat.com>
 <CAEemH2d+EOzF8aKAkpsnUO1GqgPh3J40RBDXyBg0E5NC8nrSuw@mail.gmail.com>
 <20200729063311.GA30121@rei>
In-Reply-To: <20200729063311.GA30121@rei>
From: Li Wang <liwang@redhat.com>
Date: Thu, 30 Jul 2020 08:21:09 +0800
Message-ID: <CAEemH2dgFTiz82uakmsgWTkXQuHDinO4UVjUYiuiTB=KO1C-EQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] lib: add function to check for kernel
 lockdown
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
Content-Type: multipart/mixed; boundary="===============0566535250=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0566535250==
Content-Type: multipart/alternative; boundary="000000000000e95d6d05ab9da6c5"

--000000000000e95d6d05ab9da6c5
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 29, 2020 at 2:33 PM Cyril Hrubis <chrubis@suse.cz> wrote:

>
> Looks good to me as well.
>

Pushed.

-- 
Regards,
Li Wang

--000000000000e95d6d05ab9da6c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jul 29, 2020 at 2:33 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br>
Looks good to me as well.<br></blockquote></div><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Pushed.</div></div><div><br=
></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><=
div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000e95d6d05ab9da6c5--


--===============0566535250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0566535250==--

