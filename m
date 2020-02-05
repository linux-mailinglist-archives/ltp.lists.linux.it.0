Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE841532B8
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2020 15:21:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55EFE3C2650
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2020 15:21:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D54A83C2634
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 15:21:09 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id A7DC41401A58
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 15:21:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580912466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bV1jL0vb3Un3Ia8j/2fbrb6OPis3lgb7bIuPAvB40hk=;
 b=iw1XTZjAKhAIeUh0CUg73UnRXWtM8rhgYN9rRS3bHGtnLMb3zScIp4JtZ/a+uBsu/lOWmr
 EzFvOOLLVRU+z25VXcDJUe3XzuKHCtZ8EuB3YEzEHA0i5RbHArCX1bua0Hc0r9YZLftHtw
 vrHXaTmpPQ6rLrX5SmEFtC4X+4R7k0Q=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-aWkfPx9jNr6EzEGK7v_z6A-1; Wed, 05 Feb 2020 09:21:03 -0500
Received: by mail-ot1-f72.google.com with SMTP id f25so1266925otq.15
 for <ltp@lists.linux.it>; Wed, 05 Feb 2020 06:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kpUzJQCwQz9HQ865E2S26FxTKWHf37IsY8i+W+szPgc=;
 b=hwDb6JHyQAnpxxoop2qh2hGDV6XsZg6ESfree5Mkba29HbHptUqoUzdkaSS+VLydSL
 7apiqstOAww4GDgYQqDqDVxuBpsAhW67Pcocvb1ljTawS7kU2uk2RVz/tR3qQN5j4XRm
 s2Y4/slfVKliAdYZAnyNR19929RCpig331l9Sqg6rpdmGTfg32dBS+nu0X3nuC/7S675
 bqo8Dy4HPud8Nw3mVVAsQNXb9rB7Q2XL9cvr6ucO5JdRO8oI9yyFe+EQVScgstkK2xUi
 YUcogURdj4IP6c5Lbih2FEBsdpr9pjp/opg/6Lwl2m1hVf0eS3uwl7w+5TruAoxg9Ek1
 qmuQ==
X-Gm-Message-State: APjAAAXwGrfpp3zUkppYX6/tikBlfuGjPpK2L+HjF8Ot/ou/YACAy1VU
 aeMhb7aaK7we1lWDZEd0N3i1u22fBLLTWh+lNFir0en/YoWdFkIdX10vkOOcRInWHsB98LPURxV
 To6nTQKzjZFpmwbNSqzcbhRZTSxk=
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr27443290otq.17.1580912461992; 
 Wed, 05 Feb 2020 06:21:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqzEekFZokq5rw8ohZeSr6O9cs3v7mpXXUUDK4PUP4M82dvqK8NyhD4ZJ4XT7jxssNM0xGskQTUCmKzXAYd+x0I=
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr27443249otq.17.1580912461665; 
 Wed, 05 Feb 2020 06:21:01 -0800 (PST)
MIME-Version: 1.0
References: <7843cc36a04deb034e9479a139f535e5fa5f3135.1580894017.git.jstancek@redhat.com>
 <CAEemH2fnu9nZiGDfa5LTTMA0a_-PJ35fjjLdZ2vXYNGRJqHfVA@mail.gmail.com>
In-Reply-To: <CAEemH2fnu9nZiGDfa5LTTMA0a_-PJ35fjjLdZ2vXYNGRJqHfVA@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 5 Feb 2020 22:20:50 +0800
Message-ID: <CAEemH2cORefwuWGKxMn_cnbpUe52ndoOMQEFJVkX64ACS_YuMg@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-MC-Unique: aWkfPx9jNr6EzEGK7v_z6A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/getrandom02: lower bufsize if low on
 entropy
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
Content-Type: multipart/mixed; boundary="===============1892378314=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1892378314==
Content-Type: multipart/alternative; boundary="000000000000b30963059dd4dde6"

--000000000000b30963059dd4dde6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2020 at 9:57 PM Li Wang <liwang@redhat.com> wrote:

>
>
> On Wed, Feb 5, 2020 at 5:19 PM Jan Stancek <jstancek@redhat.com> wrote:
>
>> Some PPC KVM guests accumulate about 1 bit of entropy per second while
>> idle
>> and running getrandom02. Which isn't enough and test sporadically fails =
on
>> timeout.
>>
>> Adjust the buffer size by looking at entropy_avail. We want to run the
>> test,
>> even if all entropy is exhausted, but with smaller buffer we don't set
>> as high expectations on how much entropy is generated within default tes=
t
>> time.
>>
>> Signed-off-by: Jan Stancek <jstancek@redhat.com>
>> ---
>>  testcases/kernel/syscalls/getrandom/getrandom02.c | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/testcases/kernel/syscalls/getrandom/getrandom02.c
>> b/testcases/kernel/syscalls/getrandom/getrandom02.c
>> index ee0193df9897..1384fc5f32c0 100644
>> --- a/testcases/kernel/syscalls/getrandom/getrandom02.c
>> +++ b/testcases/kernel/syscalls/getrandom/getrandom02.c
>> @@ -10,6 +10,8 @@
>>  #include "lapi/syscalls.h"
>>  #include "tst_test.h"
>>
>> +#define PROC_ENTROPY_AVAIL "/proc/sys/kernel/random/entropy_avail"
>> +
>>  static int modes[] =3D { 0, GRND_RANDOM, GRND_NONBLOCK,
>>                        GRND_RANDOM | GRND_NONBLOCK };
>>
>> @@ -37,11 +39,17 @@ static int check_content(unsigned char *buf, int nb)
>>  static void verify_getrandom(unsigned int n)
>>  {
>>         unsigned char buf[256];
>> +       int bufsize =3D 64, entropy_avail;
>>
>
> I'm not sure why here initialize bufsize as 64? can you explain more?
>

Ah I see, it just picks a smaller size to obtain littler random bytes to
decrease the failure probability. But not has special meaning for 64, right=
?

--=20
Regards,
Li Wang

--000000000000b30963059dd4dde6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Feb 5, 2020 at 9:57 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 5, 2020 at 5:19 =
PM Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" target=3D"_blank"=
>jstancek@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Some PPC KVM guests accumulate about 1 bit of entropy p=
er second while idle<br>
and running getrandom02. Which isn&#39;t enough and test sporadically fails=
 on<br>
timeout.<br>
<br>
Adjust the buffer size by looking at entropy_avail. We want to run the test=
,<br>
even if all entropy is exhausted, but with smaller buffer we don&#39;t set<=
br>
as high expectations on how much entropy is generated within default test t=
ime.<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/syscalls/getrandom/getrandom02.c | 12 ++++++++++--<b=
r>
=C2=A01 file changed, 10 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/getrandom/getrandom02.c b/testcases/=
kernel/syscalls/getrandom/getrandom02.c<br>
index ee0193df9897..1384fc5f32c0 100644<br>
--- a/testcases/kernel/syscalls/getrandom/getrandom02.c<br>
+++ b/testcases/kernel/syscalls/getrandom/getrandom02.c<br>
@@ -10,6 +10,8 @@<br>
=C2=A0#include &quot;lapi/syscalls.h&quot;<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
<br>
+#define PROC_ENTROPY_AVAIL &quot;/proc/sys/kernel/random/entropy_avail&quo=
t;<br>
+<br>
=C2=A0static int modes[] =3D { 0, GRND_RANDOM, GRND_NONBLOCK,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0GRND_RANDOM | GRND_NONBLOCK };<br>
<br>
@@ -37,11 +39,17 @@ static int check_content(unsigned char *buf, int nb)<br=
>
=C2=A0static void verify_getrandom(unsigned int n)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char buf[256];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int bufsize =3D 64, entropy_avail;<br></blockqu=
ote><div><br></div><div><div style=3D"font-size:small">I&#39;m not sure why=
 here initialize=C2=A0bufsize as 64? can you explain more?</div></div></div=
></div></blockquote><div><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Ah I see, it just picks a smaller size to obtain littler ran=
dom bytes to decrease the failure=C2=A0probability. But not has=C2=A0specia=
l meaning for 64, right?</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--000000000000b30963059dd4dde6--


--===============1892378314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1892378314==--

