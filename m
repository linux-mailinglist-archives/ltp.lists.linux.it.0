Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4DF3057B2
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 11:03:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51E033C5E9E
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 11:03:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 493AA3C002E
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 11:03:54 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 71AB16006FA
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 11:03:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611741832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FfzOlNQ+SQhVsJisgGZUsbfQacK0LfLayI75bw7AF+M=;
 b=Fo5Hd/cNHWQYkfvbeZFfOa+trkDECEJ8aQkOtwwefmvRXzhnxCot95TKEHivq8w42TaLXR
 qB2RxqdDdrjNs+A4aN9xgzLOELLQ/gmoL9G58Yj/9/exwiqgGPsS92MOtq5dVegTeUraFn
 W/IGmPAKHptfl5U0pdVcmuWOlz+q8gg=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-X9-MhCyNNWGECL16dw58DA-1; Wed, 27 Jan 2021 05:03:49 -0500
X-MC-Unique: X9-MhCyNNWGECL16dw58DA-1
Received: by mail-yb1-f199.google.com with SMTP id g4so1856336ybf.16
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 02:03:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FfzOlNQ+SQhVsJisgGZUsbfQacK0LfLayI75bw7AF+M=;
 b=MAc4T3+4wD8lYhQ8qFamxFYU7SaGvctXE/1eXwjY9I+iMhVA0lEl2vaIXYCIyO1F0f
 OxOI2j3ZRXOJO4mNyyl68s1myAmjJ8YICA+EYhTjqjuUbjGonzITBO0hcYVjtHd0xpFm
 8yKTmX2yTZV9nkTH7sNq45zP150PCqfgPRDi7vhsGJl2mBmk/gnVBiRkULhCq5QST7jq
 V7YjvizJSV2GaJMd/sxVl8uI2xf2/9JJnXPwalU1pSsDnUI2e5I64e6RlJlZo7uGreuW
 1Afxdpv6a3vIIWt2E81OR62QT9tpHPT4I3J5yaLUOw+ruKgW9zTeZUj1jfE5BQ7p6vzQ
 XVcg==
X-Gm-Message-State: AOAM532iT07voexqp0G1AGF020o7OYf95uh/9KdBLxgXYAfpvKO5aZ4k
 DLJ+y3wwPbNmmHy9rUGN0LYIOwt307+lQmjh/MwO63WfaRN0Oj7YBiQw2kNra880tkip3t0+HA+
 MCQBeKzsL+UD6JU14LTT4Bdf8Z2I=
X-Received: by 2002:a25:254e:: with SMTP id l75mr14929888ybl.110.1611741828757; 
 Wed, 27 Jan 2021 02:03:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJGq8yCWSwNWankO3hIFdfBiwrqfT6Z8aacx1VF3h4w5SnS+ayueoXp3Ljfa6KYu580d0M+9s6kmmpRK3od1s=
X-Received: by 2002:a25:254e:: with SMTP id l75mr14929865ybl.110.1611741828593; 
 Wed, 27 Jan 2021 02:03:48 -0800 (PST)
MIME-Version: 1.0
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>
 <CAEemH2csSFf7Ujz8H+KV7hTdmDVsxn5_oW2JZbwY=NsJUSat_w@mail.gmail.com>
 <2021012714540739834212@chinatelecom.cn>
 <CAEemH2dhpbm19HEaHkhv1WE+70VkDjM9C5L1-KJZqPX2G2BgrQ@mail.gmail.com>
 <CAEemH2cwEzLr0dXvskn-hprn0-iOCr=rrLPgDUE1YdbnHu=5AQ@mail.gmail.com>
 <YBExXT8HzFAGsTNI@yuki.lan>
In-Reply-To: <YBExXT8HzFAGsTNI@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Wed, 27 Jan 2021 18:03:37 +0800
Message-ID: <CAEemH2frpP09ZXJDB4n-4nDBYgaSCEEwe8Fe==dp92WF7ohU9w@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_KAM_HTML_FONT_INVALID autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01
 invoked oom-killer
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
Cc: ltp <ltp@lists.linux.it>,
 "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
Content-Type: multipart/mixed; boundary="===============0628047414=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0628047414==
Content-Type: multipart/alternative; boundary="00000000000029d76605b9dee31a"

--00000000000029d76605b9dee31a
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 27, 2021 at 5:23 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > > I sent to you the case swapping01 solving this(via FILE_LINES_SCANF)
> > > already, feel free to take an reference:
> > >
> > >
> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/mem/swapping/swapping01.c#L85
> > >
> >
> > Or, maybe we can extract this process into a function and put it in
> > tst_memutils.h, to convinently reuse by other testcases too?
> >
> > void tst_get_MemAvailable(void);
>
> Please do not use CamelCase.
>

+1
Sorry, I just pasted the name by the editor, and YES, we should avoid that.


> It should be tst_get_mem_available(void) and it should also return
> unsigned long.
>

Absolutely right.


liuxp11@chinatelecom.cn <liuxp11@chinatelecom.cn> wrote:

In this testcase,we first check MemAvailable. If MemAvailable doesn't
> exist,then use info.freeram.
> Maybe not other cases need do these.
>

Yes, but we also could make use of tst_get_mem_available() here because,
in the patch, you're trying to avoid that (MemFree > MemAvailable)
situation.
If the fix is correct, we just need to get both and choose the smaller one
to use, isn't it?



> Have a question about using macro SAFE_READ_MEMINFO get MemAvailable
>> value,
>> Some old kernels maybe not privode "MemAvailable" field, which will
>> broken.
>>
>
The most different of SAFE_* macro is that will exit with TBROK if not
get it expected. As Cyril proposes another one FILE_LINES_SCANF
has no such concern.

-- 
Regards,
Li Wang

--00000000000029d76605b9dee31a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jan 27, 2021 at 5:23 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt; I sent to you the case swapping01 solving this(via FILE_LINES_SCA=
NF)<br>
&gt; &gt; already, feel free to take an reference:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://github.com/linux-test-project/ltp/blob/master/=
testcases/kernel/mem/swapping/swapping01.c#L85" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/linux-test-project/ltp/blob/master/testcases=
/kernel/mem/swapping/swapping01.c#L85</a><br>
&gt; &gt;<br>
&gt; <br>
&gt; Or, maybe we can extract this process into a function and put it in<br=
>
&gt; tst_memutils.h, to convinently reuse by other testcases too?<br>
&gt; <br>
&gt; void tst_get_MemAvailable(void);<br>
<br>
Please do not use CamelCase.<br></blockquote><div>=C2=A0</div><div><span cl=
ass=3D"gmail_default" style=3D"font-size:small">+1=C2=A0</span></div><div><=
span class=3D"gmail_default" style=3D"font-size:small">Sorry, I just pasted=
=C2=A0the name by the editor, and YES, we should avoid that.</span></div><d=
iv><span class=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
It should be tst_get_mem_available(void) and it should also return<br>
unsigned long.<br></blockquote><div>=C2=A0</div><div><span class=3D"gmail_d=
efault" style=3D"font-size:small">Absolutely right.</span></div><div class=
=3D"gmail_default" style=3D"font-size:small"><span class=3D"gmail_default">=
</span><div dir=3D"ltr"><div class=3D"gmail_default"><br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"><a href=3D"m=
ailto:liuxp11@chinatelecom.cn" target=3D"_blank">liuxp11@chinatelecom.cn</a=
> &lt;<a href=3D"mailto:liuxp11@chinatelecom.cn" target=3D"_blank">liuxp11@=
chinatelecom.cn</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_att=
r"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<div>In this testcase,we first check=C2=A0<span style=3D"line-height:1.5;ba=
ckground-color:transparent">MemAvailable. If=C2=A0</span><span style=3D"lin=
e-height:1.5;background-color:transparent">MemAvailable doesn&#39;t exist,t=
hen use=C2=A0</span><span style=3D"line-height:1.5;background-color:transpa=
rent">info.freeram.</span></div><div>Maybe not other cases need do these.</=
div></blockquote><div>=C2=A0</div><div>Yes, but we also could make use of t=
st_get_mem_available() here because,</div><div>in the patch, you&#39;re try=
ing to avoid that (MemFree &gt; MemAvailable) situation.</div><div>If the f=
ix is correct, we just need to get both and choose the smaller one</div><di=
v>to use, isn&#39;t it?</div><div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><blockquote style=3D"margin-top:0px;mar=
gin-bottom:0px;margin-left:0.5em;margin-right:inherit"><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr"></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div>Have a question about using macro=C2=A0<span=
 style=3D"line-height:19.5px;background-color:transparent">SAFE_READ_MEMINF=
O get=C2=A0</span><span style=3D"line-height:1.5;background-color:transpare=
nt">MemAvailable value,</span></div><div>Some old kernels maybe not privode=
 &quot;<span style=3D"line-height:1.5;background-color:transparent">MemAvai=
lable</span><span style=3D"line-height:1.5;background-color:transparent">&q=
uot; field, which will broken.</span></div></blockquote></div></blockquote>=
</blockquote><div><br></div><div>The most different of SAFE_* macro is that=
 will exit with TBROK if not</div><div>get it expected. As Cyril proposes a=
nother one FILE_LINES_SCANF</div><div>has no such concern.</div></div></div=
></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards=
,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000029d76605b9dee31a--


--===============0628047414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0628047414==--

