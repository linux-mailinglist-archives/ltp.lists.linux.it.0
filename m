Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A8226833B
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Sep 2020 05:41:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 128353C2BFB
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Sep 2020 05:41:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 05C6A3C224B
 for <ltp@lists.linux.it>; Mon, 14 Sep 2020 05:40:59 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 5D6496005FE
 for <ltp@lists.linux.it>; Mon, 14 Sep 2020 05:40:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600054857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yzrkTv3V7+M6TDCEIU+aSdwvpu68ve1ZZUgE53H4nw0=;
 b=CaSUNep93v+BOQU24iLpWkt7qjQMJXUzVU+AjmuX/3hte3t+FExPILpektOCXWzeAGrBhA
 hYXh5RgjTS/40FYPoeDiuztiDD/YVqaABYiggwR55k12FZ7Z/IGr+kPGObd7fzX5Fxnr9P
 6JGmTgHJPLrXw3ymG6KFIu0QaZTSLTY=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-PCVCTIQlPDa7xr5TTZmcTA-1; Sun, 13 Sep 2020 23:40:52 -0400
X-MC-Unique: PCVCTIQlPDa7xr5TTZmcTA-1
Received: by mail-yb1-f200.google.com with SMTP id g189so11389437ybg.9
 for <ltp@lists.linux.it>; Sun, 13 Sep 2020 20:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yzrkTv3V7+M6TDCEIU+aSdwvpu68ve1ZZUgE53H4nw0=;
 b=UYaMi3fjETSbMl8cksA0W9r9UVmGeuBSIhg5DqqR8s3PY45rkb3615K0fujeTm+MfJ
 vN4B/hlieFCp3KUhoAxamtzEkcpH7octvtMB1QWffXf7+8O0c68d1Ipsxz7w2LEpasYp
 JozlKSx3JkKim3c2DANo4dbaM8efBiHraq/zd5XaIvWVf5kSX5McSpE48TtZwKkqvgmr
 Y9qtzovp+EEJOfFMN/3PaMiL8nXGjhbLg+1cypTvG52LemjiEcIBsViLJvdcGpYSbVS3
 ECRdtBPdbSjWEiY+/1MlQ9hmvF1Qj0Zebzq9u07S/v+72LeDLK9V5FgZfQqQgpUy1tKw
 Y9rw==
X-Gm-Message-State: AOAM531szx162VfeKzjI48/7MJPWEYuxRFFxdkFJCwLkC0vtXS/AkEVp
 /ZXrwmZbw/5ewOd3lrJLQ86MrXNbT+lmesk87iYOWOVwvAikCB4CfIk1m0FwezOAjHKXD/yL274
 /XopnB1yS8ERnrTYNnd47SpJrw3Y=
X-Received: by 2002:a05:6902:6c1:: with SMTP id
 m1mr18012667ybt.252.1600054852275; 
 Sun, 13 Sep 2020 20:40:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhWdQcHeiF/MOxc+0viTI2bR5POuCNyvMB6RQR3OkmW9vCzCR5fytb0xKiL79CVBH8Nhne3BeZ4nHU9MCPncs=
X-Received: by 2002:a05:6902:6c1:: with SMTP id
 m1mr18012651ybt.252.1600054852097; 
 Sun, 13 Sep 2020 20:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200911035533.30538-1-liwang@redhat.com>
 <20200911130836.GA2582@yuki.lan>
 <CAEemH2fPRTh6drs=h=U7OG07SZDgpDfEB0xRadF8Y1FbaHR8Nw@mail.gmail.com>
 <20200911145730.GA6157@yuki.lan>
 <CAEemH2cXY+-Dgq8PB-ZunzRnjM1iH0KiB5gK5=CLnFDSEiKLdQ@mail.gmail.com>
In-Reply-To: <CAEemH2cXY+-Dgq8PB-ZunzRnjM1iH0KiB5gK5=CLnFDSEiKLdQ@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 14 Sep 2020 11:40:40 +0800
Message-ID: <CAEemH2foCpQqDdBNZ8A5OcpoKzLTUn1Od+KE8TSMN=vk-F5=kA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5] Add a test case for mmap MAP_GROWSDOWN flag
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
Cc: pravin <pravinraghul@zilogic.com>, LTP List <ltp@lists.linux.it>,
 "Vijay Kumar B ." <vijaykumar@zilogic.com>
Content-Type: multipart/mixed; boundary="===============0480245797=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0480245797==
Content-Type: multipart/alternative; boundary="00000000000014ada005af3dcdf3"

--00000000000014ada005af3dcdf3
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 14, 2020 at 11:06 AM Li Wang <liwang@redhat.com> wrote:

>
> ...
>
>
>> But still the code wasn't exactly right, because the lowest address of
>> the stack in the previous code was stack - stack_size, which would be
>> start of the unmapped region and the size of the stack would be 2 *
>> stack_size, as we expected the mapping to grow.
>>
>
> No, I don't think so, the lowest address of the stack in the previous code
> is:
>     stack = start + total_size - size;
> and we pass this stack pointer to ptrehad_attr_setstack() is correct here,
> indeed the stack really starts at stack + stack_size, that's internal
> steps.
>

Here print debug info to verify that stack grows down from 'stack + size'
address:

mmap18.c:99: INFO: start = 0x7f4831293000, stack - size = 0x7f4831393000,
stack = 0x7f48313b3000, stack + size = 0x7f48313d3000
mmap18.c:110: INFO: &limit = 0x7f48313d1ee8, limit = 0x7f4831397000
mmap18.c:110: INFO: &limit = 0x7f48313d1ec8, limit = 0x7f4831397000
mmap18.c:110: INFO: &limit = 0x7f48313d1ea8, limit = 0x7f4831397000
mmap18.c:110: INFO: &limit = 0x7f48313d1e88, limit = 0x7f4831397000
mmap18.c:110: INFO: &limit = 0x7f48313d1e68, limit = 0x7f4831397000
mmap18.c:110: INFO: &limit = 0x7f48313d1e48, limit = 0x7f4831397000
mmap18.c:110: INFO: &limit = 0x7f48313d1e28, limit = 0x7f4831397000
mmap18.c:110: INFO: &limit = 0x7f48313d1e08, limit = 0x7f4831397000
mmap18.c:110: INFO: &limit = 0x7f48313d1de8, limit = 0x7f4831397000
...

-- 
Regards,
Li Wang

--00000000000014ada005af3dcdf3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 14, 2020 at 11:06 AM L=
i Wang &lt;<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">...</div><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=C2=A0<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
But still the code wasn&#39;t exactly right, because the lowest address of<=
br>
the stack in the previous code was stack - stack_size, which would be<br>
start of the unmapped region and the size of the stack would be 2 *<br>
stack_size, as we expected the mapping to grow.<br></blockquote><div><br></=
div><div><div style=3D"font-size:small">No, I don&#39;t think so, the lowes=
t address of the stack in the previous code is:</div><div style=3D"font-siz=
e:small">=C2=A0 =C2=A0 stack =3D start + total_size - size;</div></div><div=
 style=3D"font-size:small">and we pass this stack pointer to=C2=A0ptrehad_a=
ttr_setstack() is correct here,</div><div style=3D"font-size:small">indeed =
the stack really starts at stack=C2=A0+ stack_size, that&#39;s internal ste=
ps.</div></div></div></blockquote><div><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Here print debug info to verify that stack gro=
ws down from &#39;stack + size&#39; address:</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div>mmap18.c:99: INFO: start =3D 0x7f48=
31293000, stack - size =3D 0x7f4831393000, stack =3D 0x7f48313b3000, stack =
+ size =3D 0x7f48313d3000<br>mmap18.c:110: INFO: &amp;limit =3D 0x7f48313d1=
ee8, limit =3D 0x7f4831397000<br>mmap18.c:110: INFO: &amp;limit =3D 0x7f483=
13d1ec8, limit =3D 0x7f4831397000<br>mmap18.c:110: INFO: &amp;limit =3D 0x7=
f48313d1ea8, limit =3D 0x7f4831397000<br>mmap18.c:110: INFO: &amp;limit =3D=
 0x7f48313d1e88, limit =3D 0x7f4831397000<br>mmap18.c:110: INFO: &amp;limit=
 =3D 0x7f48313d1e68, limit =3D 0x7f4831397000<br>mmap18.c:110: INFO: &amp;l=
imit =3D 0x7f48313d1e48, limit =3D 0x7f4831397000<br>mmap18.c:110: INFO: &a=
mp;limit =3D 0x7f48313d1e28, limit =3D 0x7f4831397000<br>mmap18.c:110: INFO=
: &amp;limit =3D 0x7f48313d1e08, limit =3D 0x7f4831397000<br>mmap18.c:110: =
INFO: &amp;limit =3D 0x7f48313d1de8, limit =3D 0x7f4831397000<br><div class=
=3D"gmail_default" style=3D"font-size:small">...</div><div>=C2=A0</div></di=
v>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>R=
egards,<br></div><div>Li Wang<br></div></div></div></div></div>

--00000000000014ada005af3dcdf3--


--===============0480245797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0480245797==--

