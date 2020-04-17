Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E19D01AD79D
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 09:42:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA7623C2ACD
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 09:42:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C965E3C2AB7
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 09:42:39 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id B33F11A00E40
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 09:42:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587109357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Ds2UlDeUeeq4v4NNVFSEcGyv4LQhyd9wnqswGlMdn0=;
 b=N3ljlRU9AYffTcrKgMdcCcR0spBtLc7INaebRL44oO4ryfkjcnKaZa6hU6VK037q5Yd/Op
 HOL9Lo9iRXrWf48EodshVVPInGi7HhBQMYwFxNaPaYs+6xH/1QXZJ9h8JSL0teYLQEPo06
 p4j04VMy0ou36OVERvQiTDz/rlTbWfM=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-HOLPVUvzMoe1uhBBmDbd_g-1; Fri, 17 Apr 2020 03:42:30 -0400
X-MC-Unique: HOLPVUvzMoe1uhBBmDbd_g-1
Received: by mail-lj1-f199.google.com with SMTP id c2so146300ljj.2
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 00:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RmbHwXWjgySj9ubH9DiV3qVIgh3HJFX9KBHuM4+/SyE=;
 b=PmnP2yftJ1CTORKfgPA1M1+XvPALU9HuYrHxcR3MR+JPYIAHMJWzK03cMjcMr+apVI
 5FiXh8XAGqJ7kgg4Q0qfaLKnbp7kKiiHWoV9C/64rFz+3pjZa/91pfWnWgHV4toUkghz
 cwkIfIpTE+o+D1R+auI42ChWGImVLf7RYm/XUtiRg48v2o0AZjM380okt1mAeMBVMscB
 v0Q5xqUdPa3CcWvnGy5CYKw4T/wapLEVl7aQ6JjxpU/CMr5vzYoQfWRFEwOJjTsLS6OI
 f2cM+xkooO5IMxeoPBIz0CD0pexSz2yYopC0dTYlL0kxjj6AyEmaMXUCBu4a7np5wBeR
 TFcw==
X-Gm-Message-State: AGi0PuZH3wESAMHld9yQjb5Wg503LIeoHtvwUGwPJEVTarQq/iwnl8y7
 A3j534FoLZd9dB/sBDOLjHAFHj21r3lPg8utx5ofAxAflY6g7mLK6e2YL41ThkuHD5sHoROL1Vg
 PIqsisAZa8C5CyZq6jhZFvktKyOQ=
X-Received: by 2002:a05:6512:1c5:: with SMTP id
 f5mr1198671lfp.138.1587109348511; 
 Fri, 17 Apr 2020 00:42:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypJrinP7X1CMlHZLUZp0/QbdK078J4k+ixWsu7QOiHFaZuCM8DNGYv60nz9J3VwRSAwhr0nC1C9PDyu683kfBV0=
X-Received: by 2002:a05:6512:1c5:: with SMTP id
 f5mr1198658lfp.138.1587109348259; 
 Fri, 17 Apr 2020 00:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200409211255.1357-1-laniel_francis@privacyrequired.com>
 <7c9e27de-aaff-98ea-4e00-2c242f7a0cc3@cn.fujitsu.com>
 <f8f3aea3-5371-a8b5-09dd-1200d9dc6d72@cn.fujitsu.com>
In-Reply-To: <f8f3aea3-5371-a8b5-09dd-1200d9dc6d72@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 17 Apr 2020 15:42:16 +0800
Message-ID: <CAEemH2dzt4Hi7HDyO4Spn_i3naJbhQ5GwpZVCk3BgkdaL5uNWg@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] Add new test for pipe2 with/without O_NONBLOCK mode
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
Content-Type: multipart/mixed; boundary="===============1838687452=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1838687452==
Content-Type: multipart/alternative; boundary="000000000000ec4d2405a377b0f9"

--000000000000ec4d2405a377b0f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xu,

Thanks for reviewing the patches.

Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

> ...
> > I modify your patch and merged into my ltp own fork.
> > see
> >
> https://github.com/xuyang0410/ltp/commits/Laniel_francis_pipe2_03_v3.fixe=
s
> >
> > ps: I will convert pipe2_01/02.c into new libray and use SAFE_PIPE2
> macro.
> Can you merge the safe_pipe2 patch(don't need to add this macro into old
> safe_macro header) into master? so then I can write new test cases
>

I'm ok with only support it in the new library.

But if we export the safe macro only to use by new API, we'd better add it
into lib/tst_safe_macros.c
but not lib/safe_macros.c, this patch leaves the 'void (*cleanup_fn)
(void)' hook in function safe_pipe2()
and put in safe_macros.c that is compatible with both API using.

Do you think so? if yes I can help to move it to tst_safe_macros.c and
apply it.

--=20
Regards,
Li Wang

--000000000000ec4d2405a377b0f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div></div><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Thanks for reviewing the patches.</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Yang=
 Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fu=
jitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span class=3D"gmail_default" style=3D"font-size:small">...</spa=
n><br>
&gt; I modify your patch and merged into my ltp own fork.<br>
&gt; see <br>
&gt; <a href=3D"https://github.com/xuyang0410/ltp/commits/Laniel_francis_pi=
pe2_03_v3.fixes" rel=3D"noreferrer" target=3D"_blank">https://github.com/xu=
yang0410/ltp/commits/Laniel_francis_pipe2_03_v3.fixes</a><br>
&gt; <br>
&gt; ps: I will convert pipe2_01/02.c into new libray and use SAFE_PIPE2 ma=
cro.<br>
Can you merge the safe_pipe2 patch(don&#39;t need to add this macro into ol=
d <br>
safe_macro header) into master? so then I can write new test cases <br></bl=
ockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-siz=
e:small">I&#39;m ok with only support it in the new library.</div><br></div=
><div><div class=3D"gmail_default" style=3D"font-size:small">But if we expo=
rt the safe macro only to use by new API, we&#39;d better add it into lib/t=
st_safe_macros.c</div><div class=3D"gmail_default" style=3D"font-size:small=
">but not lib/safe_macros.c, this patch leaves the &#39;void (*cleanup_fn) =
(void)&#39;=C2=A0hook in function safe_pipe2()=C2=A0</div><div class=3D"gma=
il_default" style=3D"font-size:small">and put in safe_macros.c that is comp=
atible=C2=A0with both API using.=C2=A0</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Do you think so? if yes I can help to move it to=C2=A0tst_saf=
e_macros.c and apply it.</div></div></div><div><br></div>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><di=
v>Li Wang<br></div></div></div></div>

--000000000000ec4d2405a377b0f9--


--===============1838687452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1838687452==--

