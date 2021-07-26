Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DE93D55D8
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 10:48:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B94253C922B
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 10:48:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7ADB73C08BB
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 10:48:54 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9F47F1400127
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 10:48:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627289332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m0MxzFwP+ITTbgrb1v5fdd9pXt2IgbEJ+Xg0WgD69qg=;
 b=ZE9Ys4x2Da2KteDxRrqUNVC072ChUQTs/u+xYb76oiq9ftECyV+EBLAt3eG3pPfSYDogBU
 06YNBRJAYTHXOooO3Hf4zEC8RdH3l58PsAfsBijtN3QgAe4gp7XNPMJlllPB8QnoEc1IPW
 JZp9tN33bTTwBTxXTI6TQBYaBNz9zbg=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-9SQrx0CON2-srUe8JEofNw-1; Mon, 26 Jul 2021 04:48:49 -0400
X-MC-Unique: 9SQrx0CON2-srUe8JEofNw-1
Received: by mail-yb1-f199.google.com with SMTP id
 t101-20020a25aaee0000b0290578c0c455b2so2195858ybi.13
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 01:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m0MxzFwP+ITTbgrb1v5fdd9pXt2IgbEJ+Xg0WgD69qg=;
 b=ON9EcObfggFdQhtUfBE7RjevASwnlFYQ1JXCYjrfol2/20AO6l+uFJD413/2VNvqKs
 VcXlbajHNqJ6D0Q6L+H8UcBmKc5plzcbO6Klm2HSM8rYfJbQBuF9XsxKVZJ1PgqbFzH+
 FMeyEU405DT45/LaaW1FQ01DMtzFWDoV+FljtVkYexRWJG9T+gmVGnFCTa8m16CCo7Om
 13hHNCpCwLLxekCwAJ5xKSrJGYJkKuqGF+llw2M6Is8e9wgQrMsBz+VGMlKJiv0eKs/N
 DoJ5jqFa3ObVk/J9TuZ2NbM5vkEJnxPvUuuEsCWZhXlKDxoas/soxzyc8ygNd+ct34Sn
 wLig==
X-Gm-Message-State: AOAM530w2zYsjJMpn87nCBlxBWQw4VHd+v6tctwpilKCQuEAaHXteRAE
 cNbXBOchXouX7nTIZ1KceFaLKrujUONyvZE/W62ndCcErnmxXm/j89ZlPA846X0o4xI6c66MtJ2
 MCdtusPvIMa/sp7LyNI0Se6DZg5U=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr22108464ybc.252.1627289329159; 
 Mon, 26 Jul 2021 01:48:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEBAMD2XhU2oL/XxUgDm3BJden2bTumhwoXZPNsT+mGjZ4DE5svbGxXuZHRWYrvwr9CWvgleeDrGUX1IFzopA=
X-Received: by 2002:a25:6d43:: with SMTP id i64mr22108442ybc.252.1627289328963; 
 Mon, 26 Jul 2021 01:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210726034928.15766-1-zhanglianjie@uniontech.com>
In-Reply-To: <20210726034928.15766-1-zhanglianjie@uniontech.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 26 Jul 2021 16:48:37 +0800
Message-ID: <CAEemH2cmbm701govDvsV15oPQ9SWJCwSfo24rowyyBhd2pUprg@mail.gmail.com>
To: zhanglianjie <zhanglianjie@uniontech.com>
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
Subject: Re: [LTP] [PATCH] syscalls/memcmp01: Convert to new API
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
Content-Type: multipart/mixed; boundary="===============1403655910=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1403655910==
Content-Type: multipart/alternative; boundary="00000000000066686405c802d2f3"

--00000000000066686405c802d2f3
Content-Type: text/plain; charset="UTF-8"

Hi Lianjie,

Given the fact that the return value of memcmp() is possible
to less than, equal to, and greater than zero in str1 and str2
comparison.

So I made a change on the return value check to make
it more accurate in the testing.

e.g.

(!memcmp(str1, str2, n))  ==> (memcmp(str1, str2, n) <= 0);    str > str2
(!memcmp(str1, str2, n))  ==> (memcmp(str1, str2, n) >= 0);    str < str2

Besides that, I applied your patch with some cleanup work as well.

-- 
Regards,
Li Wang

--00000000000066686405c802d2f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Lianjie,</div></div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Given the fact that the return=C2=A0value of memcmp() is possible</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">to less than, equ=
al to, and greater than zero in str1 and str2</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">comparison.</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">So I made a change on the return value check to make</div=
><div class=3D"gmail_default" style=3D"font-size:small">it more accurate in=
 the=C2=A0testing.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">e.g.</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">(!memcmp(str1, str2, n))=
=C2=A0 =3D=3D&gt; (memcmp(str1, str2, n) &lt;=3D 0);=C2=A0 =C2=A0 str &gt; =
str2</div><div class=3D"gmail_default" style=3D"font-size:small"><div class=
=3D"gmail_default">(!memcmp(str1, str2, n))=C2=A0 =3D=3D&gt; (memcmp(str1, =
str2, n) &gt;=3D 0);=C2=A0 =C2=A0 str &lt; str2</div><div class=3D"gmail_de=
fault"><br></div></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Besides that, I applied your patch with some cleanup work as well.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div>-- <br><di=
v dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br><=
/div><div>Li Wang<br></div></div></div></div>

--00000000000066686405c802d2f3--


--===============1403655910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1403655910==--

