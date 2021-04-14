Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F27635EF7D
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 10:27:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D0FED3C70D1
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 10:27:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 53C2E3C01F4
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 10:27:16 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9D76A1A01475
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 10:27:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618388834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iIFpQxZmccq6IsRr2A7OErfZAvaTiKDGOcNsDFHOvfY=;
 b=IVhVin9pAElBK6mPYPDwsQs7xwd+7WPRw60Lu1loFEJ7yKYcM6WAVRYWpiY9McHlMGHa7p
 lqN/jmcvk/g1CjmLkNkLh2aHNn004WTAxYikY7VVl1EpW6v8KoI4JuihI63v166IIr3a4Y
 SX+ca10Y2hyFdCHuAZR9qcGxaiKowQE=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-LVJ9RibDNU2Kxzkfoqt41Q-1; Wed, 14 Apr 2021 04:27:10 -0400
X-MC-Unique: LVJ9RibDNU2Kxzkfoqt41Q-1
Received: by mail-yb1-f200.google.com with SMTP id l30so6972881ybj.1
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 01:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iIFpQxZmccq6IsRr2A7OErfZAvaTiKDGOcNsDFHOvfY=;
 b=DTpJXS42YtsXAoOlXt9m8i37Rsexv3C4aHccajJSW3vojZtlKyA/zpXJJpAk2xShky
 t3AnsthG15Qh9VrinWP7fH6v96y/r74dWDIwlczZTGuTnr3HjYwrUKRd/St5cjS5T7mR
 Y1S5u2o1uDHnQd5FtWKxO3rgJkY1GBahJkwholRxUBOm0BuWM8wb4BMqvFw07q2LAo1b
 7GEvWG2//iRHwgo7tZ7hSN9JCqju35MJ2k1XSywsW1aM6npjq2LzRTE2bwLhMRgq7fw7
 g2mLQs3yeYJ+Sps4ggxEsEsL+OwVBD7a/nxUKdTwKL2C7E87bDInUG4hrUeujDbHwjF0
 BGMA==
X-Gm-Message-State: AOAM5323RlsfmzO5ITMQ6UZGR+/fOuQzBxilWYw5XXbsxCgy063kcAc3
 Y4S+GNRkBmA8R5XX4wpqwkDYvIHsvpYRAhjdQ+7c9fbU2ck16H3sZBFKj+/E1Aof8vgfY/OhpzA
 mI4Jl0b1hMC0LIe7KvcNWfJT9sVg=
X-Received: by 2002:a25:af05:: with SMTP id a5mr52062542ybh.86.1618388829750; 
 Wed, 14 Apr 2021 01:27:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx968Pz6P3C06mucX+eGFp0wDTZxVjofmOwD1TPonyUpjMlqOktAFBrV6PEt0YLHkmeDaNkDwDFrC6e0P8ev2U=
X-Received: by 2002:a25:af05:: with SMTP id a5mr52062523ybh.86.1618388829542; 
 Wed, 14 Apr 2021 01:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <1617765607-78263-1-git-send-email-wangxin410@huawei.com>
 <CAEemH2ctSMR5OF=0TQX1eNmTE7PcdEdMbjoYXc3RxiBsyfzcuw@mail.gmail.com>
 <91a235700b494bdf9a9a7dd1901aa947@huawei.com>
In-Reply-To: <91a235700b494bdf9a9a7dd1901aa947@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 14 Apr 2021 16:26:58 +0800
Message-ID: <CAEemH2dU2r8gFS5r3os7UwXFUEmmPqR9CnAizXbP_FHP+Evd+A@mail.gmail.com>
To: "wangxin (CQ)" <wangxin410@huawei.com>
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
Subject: Re: [LTP] [PATCH] openposix/conformance/interfaces: Correct typos
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
Content-Type: multipart/mixed; boundary="===============0382203292=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0382203292==
Content-Type: multipart/alternative; boundary="0000000000004b2fff05bfea8302"

--0000000000004b2fff05bfea8302
Content-Type: text/plain; charset="UTF-8"

Hi Xin,

On Wed, Apr 14, 2021 at 4:16 PM wangxin (CQ) <wangxin410@huawei.com> wrote:

> Hi Wang,
>
>
>
> Thanks so much for your review!
>
>
>
> I just re-checked the latest code and found that the code needed to be
> modified was not the same as the last time.
>
> Therefore, do you want to incorporate the patch submitted last time?
>
> If there is a conflict, I can modify the patch submitted last time.
>

Feel free to make a new patch as you want, I don't insist on the
previous version.
Just guarantee to rebase on the latest LTP is fine.

-- 
Regards,
Li Wang

--0000000000004b2fff05bfea8302
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xin,</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Apr 14, 2021 at 4:16 PM wangxin (CQ) &lt=
;<a href=3D"mailto:wangxin410@huawei.com">wangxin410@huawei.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"ZH-CN">
<div class=3D"gmail-m_2828170102649162799WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Wang,<u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks so much for your review!=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I just re-checked the latest co=
de and found that the code needed to be modified was not the same as the la=
st time.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Therefore, do you want to incor=
porate the patch submitted last time?
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If there is a conflict, I can m=
odify the patch submitted last time.</span></p></div></div></blockquote><di=
v><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Fee=
l free to make a new patch as you want, I don&#39;t insist on the previous=
=C2=A0version.</div></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Just guarantee=C2=A0to rebase on the latest LTP is fine.</div></div><=
div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D=
"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000004b2fff05bfea8302--


--===============0382203292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0382203292==--

