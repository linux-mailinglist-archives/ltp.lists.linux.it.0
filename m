Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F883CB7D1
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 15:22:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 065B13C7278
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 15:22:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A56C63C7097
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 15:21:59 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3125F601211
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 15:21:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626441717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QPS1ZhFABmxH7F7e2x+zRGpvAfc61JUeHW8GVGUpPZ0=;
 b=XGga5u3SUvDP3m8A5nFZAJQyFyo+duX7cxYxGiZH7fAoMrd8gh2DWYN31wnIu8QJhjS7h3
 +dBuV2YhDZExiHr3Zm6fCjLopEl5Fb5ilZOWmAY+iyr4D0QHDWcuXNChA0SiKgZk2UY4QM
 7BKAfbbAmRI9DYE2mFTT4y3jqM5vLC4=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-4rJUJuQ-OIiikj5Gdu_F3g-1; Fri, 16 Jul 2021 09:21:56 -0400
X-MC-Unique: 4rJUJuQ-OIiikj5Gdu_F3g-1
Received: by mail-yb1-f198.google.com with SMTP id
 k32-20020a25b2a00000b0290557cf3415f8so12623124ybj.1
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 06:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QPS1ZhFABmxH7F7e2x+zRGpvAfc61JUeHW8GVGUpPZ0=;
 b=lhSLTyoKqOgN+ZM/OOQ1r6Fi96CdeSNvqnumaPeunu+1S64GDM05FPmv5jUmHe62AH
 ptb94cXzWMCF24CEGcY1zK6Ru3G3bPD4EVsg9UptbTvbwGGm/0803ToX5o6lq7HCdoTv
 Nk9OpTVffGYsgQT/w2wZg90mLXDDSXTBln5orOToHc4celQbVZj+YMIiE4h94cWpOEFa
 vYDZkLLTb1yBpSeUlsdlLCn0CiInixH6t73NCjCr6N24nXT4otIEJ7Uugf6q7GZJHViJ
 XuZihDKP4zaGA9gmTd4w2zJlAkmmb2IxYcW5u/bNkwFmd5MbAGCg6lRoeXd4VX7NkJS1
 SCvA==
X-Gm-Message-State: AOAM530Fhqj0sDts8EferbleWcUcnmcj+PQ0W3htXwT/jVIv3kgbEWYq
 ynwMMFEfmelIqIv6k3WZrbL/Ja87n1dTquxIZhPOirWb1reaGQNU/EBSKoDuuCweBCp2VDpUL51
 EPNUg8wk6rgFPa0T5t98jOWRgbx0=
X-Received: by 2002:a25:6e05:: with SMTP id j5mr12745249ybc.86.1626441715725; 
 Fri, 16 Jul 2021 06:21:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypnOp7QmNRrvhaE+Rttoq07rxfBaqnUuMKLWzDfiarrkrZx8hSe/XwK68ninPK47O38AGhcP/TaS+admZnCNY=
X-Received: by 2002:a25:6e05:: with SMTP id j5mr12745224ybc.86.1626441715535; 
 Fri, 16 Jul 2021 06:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210715102813.106843-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cXAY8KSFNNv8_23uSs-wRaResAkTPmPyZQNN6UwcMcgA@mail.gmail.com>
 <6e1a3663-59ea-5286-5c36-558b077184aa@bell-sw.com>
 <CAEemH2fdJ_N2PpdCvH8M06U-ov9G0g-tcCdCDV2wZTVWCwCR2g@mail.gmail.com>
In-Reply-To: <CAEemH2fdJ_N2PpdCvH8M06U-ov9G0g-tcCdCDV2wZTVWCwCR2g@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 16 Jul 2021 21:21:44 +0800
Message-ID: <CAEemH2c7q8yTC94WvJW61=YtUHBz0_saVM+H=HPysJ0TR-ieVg@mail.gmail.com>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
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
Subject: Re: [LTP] [PATCH] crypto/af_alg02: use pthread_tryjoin_np() instead
 of pthread_kill()
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
Content-Type: multipart/mixed; boundary="===============0978628862=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0978628862==
Content-Type: multipart/alternative; boundary="000000000000b3e49d05c73d781c"

--000000000000b3e49d05c73d781c
Content-Type: text/plain; charset="UTF-8"

>  #define SALSA20_IV_SIZE       8
>>  #define SALSA20_MIN_KEY_SIZE  16
>> +static int completed;
>>
>>  static void *verify_encrypt(void *arg)
>>  {
>>
>
But we still need to initialize '0' at the start of thread_B,
in case of test running with '-i xx' parameter. Isn't it?

     tst_atomic_store(0, &completed);

-- 
Regards,
Li Wang

--000000000000b3e49d05c73d781c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0#define SALSA20_IV_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A08<br>
=C2=A0#define SALSA20_MIN_KEY_SIZE=C2=A0 16<br>
+static int completed;<br>
<br>
=C2=A0static void *verify_encrypt(void *arg)<br>
=C2=A0{<br></blockquote></div></div></blockquote><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">But we still need to initi=
alize=C2=A0&#39;0&#39; at the start of thread_B,</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">in case of test=C2=A0running with &#39;-i=
 xx&#39; parameter. Isn&#39;t it?</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default"></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0<span class=3D"g=
mail_default"></span>=C2=A0=C2=A0tst_atomic_store(0, &amp;completed);</div>=
</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature=
"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div=
></div>

--000000000000b3e49d05c73d781c--


--===============0978628862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0978628862==--

