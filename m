Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4205A2131F5
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 05:00:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C69643C26E8
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 05:00:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B14D23C088F
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 05:00:38 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 8A26C14012A0
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 05:00:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593745235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lm19WKete85yNM4T2FtYpdPgQMdXuyghunjH1N4x3fA=;
 b=SIoQb6iikvWUOusruH533tyCkB/uK0u+vyhPmN20U4bU7wm/1nIRqIzpXOai9dGjeZAITI
 cYWFFBWlCJIX/egpua+TfFwJxHM94IudaNa4edF9ZKWuhOsK+Se88Ys9923F18LKTPd5mJ
 Ye6jZbmhYrsFFw+7l8fO9Q6KoBqNgbg=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-E-oKPQP6N8qcQgIuH6Dtxw-1; Thu, 02 Jul 2020 23:00:32 -0400
X-MC-Unique: E-oKPQP6N8qcQgIuH6Dtxw-1
Received: by mail-lf1-f69.google.com with SMTP id t7so20703660lfl.4
 for <ltp@lists.linux.it>; Thu, 02 Jul 2020 20:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lm19WKete85yNM4T2FtYpdPgQMdXuyghunjH1N4x3fA=;
 b=cg+e4esa8UYafrhKD4XUK0CmYRCnV1YNbi4/FpQ3OZNErj2+WCNxZstmZ4k5otSBAb
 LGkAMKud86vc5LNHb4oqGG7QmZ6yES3FKCatFttdgLy8t59gTcYBolO9C3DAa8MNowPq
 eU8YzPeV3+DQ3FB2sG+oKEFLJycV8JJRyqwfLLdE5lu2PWmYKpk8d5BILibpyjFeCEPn
 4TZvaHDDm5UNEu3jRPSWoC2QyS+5SCL0jyPGcuP4+v9UD/zSSoRRLgffEWVhinltz3Yl
 lYuIVW6ElHspsirpVSV2IVe0gE9461/XacuF1GH6s5Jbqhbop8zui6BEXyonmLnOgq2Z
 ucLA==
X-Gm-Message-State: AOAM532y80yQb7ZdSlC10gYy2nOCK2t+VCV91LU0zd+/oLexYpjEjaP8
 LqqMixrAtHu3WSHhk9DmEi8BpjE7ZStwukswcpWTkcQOe66g3Jnrwt0mp//WGKZXMKo1fILK8ZP
 zM6g73Xgdka/LFItQ0a4+EmpSpOw=
X-Received: by 2002:a2e:a484:: with SMTP id h4mr18587521lji.468.1593745230715; 
 Thu, 02 Jul 2020 20:00:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhDRCBi2PAeyg5ugyoCd95SFMkpdV48rPZSYJF2fltqHROK48P7r9XnXvOXNRakdQvGQAv7QVnUHErrY8ZQaQ=
X-Received: by 2002:a2e:a484:: with SMTP id h4mr18587513lji.468.1593745230518; 
 Thu, 02 Jul 2020 20:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200701233133.122801-1-petr.vorel@gmail.com>
In-Reply-To: <20200701233133.122801-1-petr.vorel@gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 3 Jul 2020 11:00:18 +0800
Message-ID: <CAEemH2cHWqRQ+bkUCof8mrK7jfy-DsuA9wegmOT8D-h8F1Cu2g@mail.gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>, Harish <harish@linux.ibm.com>
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
Subject: Re: [LTP] [PATCH 1/1] numa01.sh: Handle computation error
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
Content-Type: multipart/mixed; boundary="===============0113859717=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0113859717==
Content-Type: multipart/alternative; boundary="00000000000054022605a980baf3"

--00000000000054022605a980baf3
Content-Type: text/plain; charset="UTF-8"

Hi Petr, Harish,

Though the root cause is from the non-ordered node in a special machine, I
still think this patch makes sense to numa01, because the function
get_mem_cur() make code more readable.

So I'm going to merge both this one and Harish's patch, after doing that, I
will also follow Cyril's comment to remove test8(migrate_pages).

Any objections? or comments?

On Thu, Jul 2, 2020 at 7:31 AM Petr Vorel <petr.vorel@gmail.com> wrote:

> ...
> +get_mem_cur()
>  {
>         local pid=$1
>         local node=$(($2 + 2))
> +       local size=$3
> +       local numstat=$(numastat -p $pid |awk '/^Total/ {print $'$node'}')
>
> -       echo $(numastat -p $pid |awk '/^Total/ {print $'$node'}')
> +       if [ -z "$numstat" ]; then
> +               echo 0
> +               return
>

Maybe we'd better do TBROK from here if numstat doesn't work well?

-- 
Regards,
Li Wang

--00000000000054022605a980baf3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr, Harish,</div></div><div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Though the root cause is fro=
m the non-ordered node in a special machine, I still think this patch makes=
 sense to numa01, because the function get_mem_cur() make code more readabl=
e.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">So I&#39;m going to me=
rge both this one and Harish&#39;s patch, after doing that, I will also fol=
low Cyril&#39;s comment to remove test8(migrate_pages).</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Any objections? or comments?</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Ju=
l 2, 2020 at 7:31 AM Petr Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.com"=
 target=3D"_blank">petr.vorel@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_default" style=
=3D"font-size:small">...</span><br>
+get_mem_cur()<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local pid=3D$1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local node=3D$(($2 + 2))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local size=3D$3<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local numstat=3D$(numastat -p $pid |awk &#39;/^=
Total/ {print $&#39;$node&#39;}&#39;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo $(numastat -p $pid |awk &#39;/^Total/ {pri=
nt $&#39;$node&#39;}&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$numstat&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br></blockqu=
ote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">M=
aybe we&#39;d better do TBROK from here if numstat doesn&#39;t work well?</=
div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Rega=
rds,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000054022605a980baf3--


--===============0113859717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0113859717==--

