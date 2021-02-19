Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8339B31F9FF
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 14:38:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01F2F3C65C2
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 14:38:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id BCCFD3C65A9
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 14:38:48 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 02B0B2B04F2
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 14:38:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613741926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zc15xRpcHcY6jecfZmeZJwU9YbjbW2xhUkVRQtTuFnk=;
 b=HxDUpXmBwRa5xhwiLioZK7ojWonbuAociACw6uLGpAT+5+vptQAjNC2sFc6TkzKlqvI25j
 fMENikn4F7uK/KygcvuVgy9d/sc7pww7kz+/ICDlWnQIHiqHCWkHWAL/yDqMP8h6hTpnAd
 Ik+Zd60GOZMH0xYgRnu7J9ZUlhc5hQI=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-fG8x7AVSNVGC0nGP6yAdrg-1; Fri, 19 Feb 2021 08:38:44 -0500
X-MC-Unique: fG8x7AVSNVGC0nGP6yAdrg-1
Received: by mail-yb1-f200.google.com with SMTP id d8so6704905ybs.11
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 05:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zc15xRpcHcY6jecfZmeZJwU9YbjbW2xhUkVRQtTuFnk=;
 b=oWRNkP8wX8bwOq2CJT/dbAag7UX07lgd8irc5mAEmf0/f//Ss0r9sCr4fC3QkxhVEl
 kBAJrWN2rfzniJ4Rote5jyqeJotOhbs4Q3MjgVI+o9RQ+hC4Ab2zfmTkrRo0U8GYPAas
 3z7n1kXzE3EXIrvk+miNioj02ZNYSHRsTz7ezzK7su+s0oUgEBz5zwUDkQ8HYWQyAaa+
 KV2NT95rUyN3CxdI6bfeRdZWNQBfO0eLHfaoml46HifVfW5Zusj/k/8/pHTZiOflouOF
 nDVe1SQR/qHFFRAUDFpxaFPLgcIEpB/RFUTBkWM3Bqh/taZMLa9k/XFVy+oW7sOBYuBW
 MkqQ==
X-Gm-Message-State: AOAM5333+JB/lN71/6dMw2HsUivC5faOHAxF0fZH7SnviltPNhzdVwTt
 0O5UYZ9VY59dMTXSOBVhzVpwOHcQlY8y7UM5NEQycPR9WD8yMYO6m/EdV4w0N/VOaPlUIMMYj7R
 9FLC7Wdc6ibvJ17maYPOcOIK376Q=
X-Received: by 2002:a25:e7d7:: with SMTP id
 e206mr13828296ybh.110.1613741923645; 
 Fri, 19 Feb 2021 05:38:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIx2aUp/0BLLE73KSo6vwGORw1LTl4SMCtNDcYE+4n0bzLCmxGBm+hV0QciBIb/5lUnYr6m7upZto1/irr21A=
X-Received: by 2002:a25:e7d7:: with SMTP id
 e206mr13828280ybh.110.1613741923446; 
 Fri, 19 Feb 2021 05:38:43 -0800 (PST)
MIME-Version: 1.0
References: <20210219050439.179039-1-zhaogongyi@huawei.com>
 <CAEemH2e75x8Jbc=ST5VQdg9i-nJDX8zDp=HCt3HaVhVxsVOA2Q@mail.gmail.com>
 <F3D3F6AC3820BB4C9FCA340DB5C32CB40386FA88@dggeml531-mbx.china.huawei.com>
In-Reply-To: <F3D3F6AC3820BB4C9FCA340DB5C32CB40386FA88@dggeml531-mbx.china.huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 19 Feb 2021 21:38:31 +0800
Message-ID: <CAEemH2ch1-QTUgwz0zpUOWMLcrHkUiMp0UmSW0Mpnn=G0+ZKUw@mail.gmail.com>
To: zhaogongyi <zhaogongyi@huawei.com>
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
Subject: Re: [LTP] [PATCH] openposix/fork/11-1.c: Clean up temporary file
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
Content-Type: multipart/mixed; boundary="===============0957513232=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0957513232==
Content-Type: multipart/alternative; boundary="0000000000001b4c4a05bbb09270"

--0000000000001b4c4a05bbb09270
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 19, 2021 at 5:34 PM zhaogongyi <zhaogongyi@huawei.com> wrote:

> Hi Li,
>
>
>
> I think we need to delete the tempfile after the testing(in the cleanup
> phase).
>
>
>
> In this case, we just hope that call unlink after open/mkstemp since
> unlink would not destroy the inode,
>
>
>
> so call unlink before fork would not affect the test?
>

Right, but better to put behind of close(fd) that makes logic more clear.


>
> BTW, seems the child report a wrong status of the locked file, while
>
> fcntl(fd, F_SETLK, &fl) return -1 and sets errno to EACCES or EAGAIN,
>
> shouldn't that mean the file already been locked by the parent?
>

And what do u think about this?

-- 
Regards,
Li Wang

--0000000000001b4c4a05bbb09270
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Feb 19, 2021 at 5:34 PM zhaogongyi &lt;<a h=
ref=3D"mailto:zhaogongyi@huawei.com">zhaogongyi@huawei.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"ZH-CN">
<div class=3D"gmail-m_1767732437789065902WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)">Hi Li,<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)">I think we need to delete t=
he tempfile after the testing(in the cleanup phase).<u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)">In this case, we just hope =
that call unlink after open/mkstemp since unlink would not destroy the inod=
e,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)">so call unlink before fork =
would not affect the test?</span></p></div></div></blockquote><div><br></di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">Right, but be=
tter to put behind of close(fd) that makes logic more clear.</div></div><di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div lang=3D"ZH-CN"><div cl=
ass=3D"gmail-m_1767732437789065902WordSection1"><div><div><div>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">BTW, seems the child report a w=
rong status of the locked file, while<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">fcntl(fd, F_SETLK, &amp;fl) ret=
urn -1 and sets errno to EACCES or EAGAIN,<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">shouldn&#39;t that mean the fil=
e already been locked by the parent?</span></p></div></div></div></div></di=
v></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">And what do u think about this?</div></div></div><div><br></=
div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div=
>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000001b4c4a05bbb09270--


--===============0957513232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0957513232==--

