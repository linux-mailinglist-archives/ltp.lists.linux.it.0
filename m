Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAC4305522
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 08:59:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF8CA3C5E87
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 08:59:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 328933C4FB8
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 08:59:09 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 578671400B62
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 08:59:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611734347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nntWW9hvGFURXitIOqyiL7yvLwOujQZyUfe8ulbxoU0=;
 b=CRGxHB3jnBfbXG68AT1IYcVBlHHITyLOEnY5wtsJSIAhrIQ5zrwvvPPYizUx1JijSZQwH2
 5Pvm96zvgBpjUQpfeX9dQLv5mnsNf0FVI8QJCiyA+0BUp+k+sNWO9dmpeQmrEP+QuyE+0b
 +oZsXU3rVi9wNt3VV7BmBotUsuMmzz0=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-rba1Yf00PP697qQUI0G7lA-1; Wed, 27 Jan 2021 02:59:03 -0500
X-MC-Unique: rba1Yf00PP697qQUI0G7lA-1
Received: by mail-yb1-f199.google.com with SMTP id r1so1511645ybd.23
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 23:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nntWW9hvGFURXitIOqyiL7yvLwOujQZyUfe8ulbxoU0=;
 b=QLyUNQRitaN7jB7yKf6PFpbwXLffiT32SggLGHcSFOGU2iTWUJ1IqerpGg3TCoF+uV
 ZF8ildRcSo1BfYErSwmcA24ujP/QBJCC9TuX1W0jx1x4YMh5XIoA3lB926BCUiii8FpF
 Rk/ivFR4pPCGEG7Rmh0sBUPGvoxVrqqcQ6rHdeH2myFBXHmx2uFuc0FZqwohW2eJZ+9S
 4EkGw8iI43ChOiORmnVH8TfCzDGuc4Z4GBNnD12tWOZU4fzVyflP4LLanlR9ut1/NN6F
 6W8vMobJ8N0b1soZ/KECSQvet6158hBm5hgSGg0+TlfjlP+ln9kpWURiJraDL3kBGVcg
 8wuQ==
X-Gm-Message-State: AOAM533JM6Blrf6pbn5PcowB6X5/c4OlBrTgWw3uN9Zoj0BYv4n8qAa5
 QLDrwWKwQLTv+38kbRYiYvCd+kv1Ngem3o7Yw8l9LdVp7/nmoRi8QGiZ/lby14sMbxAed1DHAYp
 XZdxXBsKjymd/pd+rIDN/upv+Q2s=
X-Received: by 2002:a25:b5cd:: with SMTP id d13mr15172851ybg.252.1611734342745; 
 Tue, 26 Jan 2021 23:59:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLuUS/d1B4KWOuHu3hW7OTduz2wi3kqo6rqNMUXkTYS5eKKWJbDL1VPi8qly2kUmSVRW+VLB1wCMPtjIbIodM=
X-Received: by 2002:a25:b5cd:: with SMTP id d13mr15172836ybg.252.1611734342503; 
 Tue, 26 Jan 2021 23:59:02 -0800 (PST)
MIME-Version: 1.0
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>
 <CAEemH2csSFf7Ujz8H+KV7hTdmDVsxn5_oW2JZbwY=NsJUSat_w@mail.gmail.com>
 <2021012714540739834212@chinatelecom.cn>
In-Reply-To: <2021012714540739834212@chinatelecom.cn>
From: Li Wang <liwang@redhat.com>
Date: Wed, 27 Jan 2021 15:58:50 +0800
Message-ID: <CAEemH2dhpbm19HEaHkhv1WE+70VkDjM9C5L1-KJZqPX2G2BgrQ@mail.gmail.com>
To: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_KAM_HTML_FONT_INVALID autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============2037698800=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2037698800==
Content-Type: multipart/alternative; boundary="000000000000f524d105b9dd24e0"

--000000000000f524d105b9dd24e0
Content-Type: text/plain; charset="UTF-8"

Hi Xinpeng,

I sent to you the case swapping01 solving this(via FILE_LINES_SCANF)
already, feel free to take an reference:
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/mem/swapping/swapping01.c#L85

On Wed, Jan 27, 2021 at 2:54 PM liuxp11@chinatelecom.cn <
liuxp11@chinatelecom.cn> wrote:

> Hi Li,
> Have a question about using macro SAFE_READ_MEMINFO get MemAvailable
> value,
> Some old kernels maybe not privode "MemAvailable" field, which will
> broken.
>
>
> *From:* Li Wang <liwang@redhat.com>
> *Date:* 2021-01-27 12:27
> *To:* Xinpeng Liu <liuxp11@chinatelecom.cn>
> *CC:* LTP List <ltp@lists.linux.it>
> *Subject:* Re: [LTP] [PATCH 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01
> invoked oom-killer
> Hi Xinpeng,
>
> On Wed, Jan 27, 2021 at 11:28 AM Xinpeng Liu <liuxp11@chinatelecom.cn>
> wrote:
>
>> Kernel version is 5.4.81+,the available RAM is less than free,as follow:
>> [root@liuxp mywork]# head /proc/meminfo
>> MemTotal:       198101744 kB
>> MemFree:        189303148 kB
>> MemAvailable:   188566732 kB
>>
>> So use available RAM to avoid OOM killer.
>>
>> Signed-off-by: Xinpeng Liu <liuxp11@chinatelecom.cn>
>> ---
>>  lib/tst_memutils.c | 29 ++++++++++++++++++++++++++---
>>  1 file changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
>> index dd09db4..21df9a8 100644
>> --- a/lib/tst_memutils.c
>> +++ b/lib/tst_memutils.c
>> @@ -10,14 +10,33 @@
>>
>>  #define TST_NO_DEFAULT_MAIN
>>  #include "tst_test.h"
>> +#include "tst_safe_stdio.h"
>>
>>  #define BLOCKSIZE (16 * 1024 * 1024)
>>
>> +static unsigned long get_available_ram(void)
>> +{
>> +       char buf[60]; /* actual lines we expect are ~30 chars or less */
>> +       unsigned long available_kb = 0;
>> +       FILE *fp;
>> +
>> +       fp = SAFE_FOPEN("/proc/meminfo","r");
>> +       while (fgets(buf, sizeof(buf), fp)) {
>> +               if (sscanf(buf, "MemAvailable: %lu %*s\n", &available_kb)
>> == 1){
>> +                       break;
>> +               }
>> +       }
>> +       SAFE_FCLOSE(fp);
>> +
>> +       return 1024 * available_kb;
>> +}
>> +
>>  void tst_pollute_memory(size_t maxsize, int fillchar)
>>  {
>>         size_t i, map_count = 0, safety = 0, blocksize = BLOCKSIZE;
>>         void **map_blocks;
>>         struct sysinfo info;
>> +       unsigned long available_ram = get_available_ram();
>>
>
> LTP provides SAFE_READ_MEMINFO() macro to be used in /proc/meminfo reading.
> See:
> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/mem/swapping/swapping01.c#L85
>
>
>
>>
>>         SAFE_SYSINFO(&info);
>>         safety = MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 128 * 1024 *
>> 1024);
>> @@ -26,15 +45,19 @@ void tst_pollute_memory(size_t maxsize, int fillchar)
>>         if (info.freeswap > safety)
>>                 safety = 0;
>>
>> +       /*"MemAvailable" field maybe not exist, or freeram less than
>> available_ram*/
>> +       if(available_ram == 0 || info.freeram < available_ram)
>> +               available_ram = info.freeram;
>> +
>>         /* Not enough free memory to avoid invoking OOM killer */
>> -       if (info.freeram <= safety)
>> +       if (available_ram <= safety)
>>                 return;
>>
>>         if (!maxsize)
>>                 maxsize = SIZE_MAX;
>>
>> -       if (info.freeram - safety < maxsize / info.mem_unit)
>> -               maxsize = (info.freeram - safety) * info.mem_unit;
>> +       if (available_ram - safety < maxsize / info.mem_unit)
>> +               maxsize = (available_ram - safety) * info.mem_unit;
>>
>>         blocksize = MIN(maxsize, blocksize);
>>         map_count = maxsize / blocksize;
>> --
>> 1.8.3.1
>>
>>
>> --
>> Mailing list info: https://lists.linux.it/listinfo/ltp
>>
>>
>
> --
> Regards,
> Li Wang
>
>

-- 
Regards,
Li Wang

--000000000000f524d105b9dd24e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi =
Xinpeng,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"">I sent to you the case swapping=
01 solving this(via FILE_LINES_SCANF) already, feel free to take an referen=
ce:</div><div class=3D"gmail_default" style=3D""><a href=3D"https://github.=
com/linux-test-project/ltp/blob/master/testcases/kernel/mem/swapping/swappi=
ng01.c#L85" style=3D"font-size:small">https://github.com/linux-test-project=
/ltp/blob/master/testcases/kernel/mem/swapping/swapping01.c#L85</a><br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Jan 27, 2021 at 2:54 PM <a href=3D"mailto:liuxp11@chinatelecom.cn=
">liuxp11@chinatelecom.cn</a> &lt;<a href=3D"mailto:liuxp11@chinatelecom.cn=
">liuxp11@chinatelecom.cn</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div>
<div><span></span>Hi Li,=C2=A0</div><div>Have a question about using macro=
=C2=A0<span style=3D"font-size:small;line-height:19.5px;background-color:tr=
ansparent">SAFE_READ_MEMINFO get=C2=A0</span><span style=3D"line-height:1.5=
;background-color:transparent">MemAvailable value,</span></div><div>Some ol=
d kernels maybe not privode &quot;<span style=3D"line-height:1.5;background=
-color:transparent">MemAvailable</span><span style=3D"line-height:1.5;backg=
round-color:transparent">&quot; field, which will broken.</span></div><div>=
<span style=3D"line-height:1.5;background-color:transparent"><br></span></d=
iv>
<blockquote style=3D"margin-top:0px;margin-bottom:0px;margin-left:0.5em;mar=
gin-right:inherit"><div>=C2=A0</div><div style=3D"border-right:none;border-=
bottom:none;border-left:none;border-top:1pt solid rgb(181,196,223);padding:=
3pt 0cm 0cm"><div style=3D"padding:8px;font-size:12px;font-family:tahoma;co=
lor:rgb(0,0,0);background:rgb(239,239,239)"><div><b>From:</b>=C2=A0<a href=
=3D"mailto:liwang@redhat.com" target=3D"_blank">Li Wang</a></div><div><b>Da=
te:</b>=C2=A02021-01-27=C2=A012:27</div><div><b>To:</b>=C2=A0<a href=3D"mai=
lto:liuxp11@chinatelecom.cn" target=3D"_blank">Xinpeng Liu</a></div><div><b=
>CC:</b>=C2=A0<a href=3D"mailto:ltp@lists.linux.it" target=3D"_blank">LTP L=
ist</a></div><div><b>Subject:</b>=C2=A0Re: [LTP] [PATCH 1/2] syscalls/ioctl=
: ioctl_sg01.c: ioctl_sg01 invoked oom-killer</div></div></div><div><div cl=
ass=3D"gmail-m_3715482154841094765FoxDiv20210127144917122140"><div dir=3D"l=
tr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small"=
>Hi Xinpeng,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Wed, Jan 27, 2021 at 11:28 AM Xinpeng Liu &lt;<a href=
=3D"mailto:liuxp11@chinatelecom.cn" target=3D"_blank">liuxp11@chinatelecom.=
cn</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Kernel version is 5.4.81+,the available RAM is less than free,as follow:<=
br>
[root@liuxp mywork]# head /proc/meminfo<br>
MemTotal:=C2=A0 =C2=A0 =C2=A0 =C2=A0198101744 kB<br>
MemFree:=C2=A0 =C2=A0 =C2=A0 =C2=A0 189303148 kB<br>
MemAvailable:=C2=A0 =C2=A0188566732 kB<br>
<br>
So use available RAM to avoid OOM killer.<br>
<br>
Signed-off-by: Xinpeng Liu &lt;<a href=3D"mailto:liuxp11@chinatelecom.cn" t=
arget=3D"_blank">liuxp11@chinatelecom.cn</a>&gt;<br>
---<br>
=C2=A0lib/tst_memutils.c | 29 ++++++++++++++++++++++++++---<br>
=C2=A01 file changed, 26 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c<br>
index dd09db4..21df9a8 100644<br>
--- a/lib/tst_memutils.c<br>
+++ b/lib/tst_memutils.c<br>
@@ -10,14 +10,33 @@<br>
<br>
=C2=A0#define TST_NO_DEFAULT_MAIN<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
+#include &quot;tst_safe_stdio.h&quot;<br>
<br>
=C2=A0#define BLOCKSIZE (16 * 1024 * 1024)<br>
<br>
+static unsigned long get_available_ram(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char buf[60]; /* actual lines we expect are ~30=
 chars or less */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long available_kb =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0FILE *fp;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fp =3D SAFE_FOPEN(&quot;/proc/meminfo&quot;,&qu=
ot;r&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (fgets(buf, sizeof(buf), fp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sscanf(buf, &qu=
ot;MemAvailable: %lu %*s\n&quot;, &amp;available_kb) =3D=3D 1){<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FCLOSE(fp);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1024 * available_kb;<br>
+}<br>
+<br>
=C2=A0void tst_pollute_memory(size_t maxsize, int fillchar)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t i, map_count =3D 0, safety =3D 0, blocks=
ize =3D BLOCKSIZE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void **map_blocks;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct sysinfo info;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long available_ram =3D get_available_r=
am();<br></blockquote><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">LTP provides SAFE_READ_MEMINFO() macro to be used in =
/proc/meminfo reading.</div><div class=3D"gmail_default" style=3D"font-size=
:small">See: <a href=3D"https://github.com/linux-test-project/ltp/blob/mast=
er/testcases/kernel/mem/swapping/swapping01.c#L85" target=3D"_blank">https:=
//github.com/linux-test-project/ltp/blob/master/testcases/kernel/mem/swappi=
ng/swapping01.c#L85</a></div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_SYSINFO(&amp;info);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 safety =3D MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE=
), 128 * 1024 * 1024);<br>
@@ -26,15 +45,19 @@ void tst_pollute_memory(size_t maxsize, int fillchar)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info.freeswap &gt; safety)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 safety =3D 0;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*&quot;MemAvailable&quot; field maybe not exis=
t, or freeram less than available_ram*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if(available_ram =3D=3D 0 || info.freeram &lt; =
available_ram)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0available_ram =3D i=
nfo.freeram;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Not enough free memory to avoid invoking OOM=
 killer */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (info.freeram &lt;=3D safety)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (available_ram &lt;=3D safety)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!maxsize)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 maxsize =3D SIZE_MA=
X;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (info.freeram - safety &lt; maxsize / info.m=
em_unit)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0maxsize =3D (info.f=
reeram - safety) * info.mem_unit;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (available_ram - safety &lt; maxsize / info.=
mem_unit)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0maxsize =3D (availa=
ble_ram - safety) * info.mem_unit;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 blocksize =3D MIN(maxsize, blocksize);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 map_count =3D maxsize / blocksize;<br>
-- <br>
1.8.3.1<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>
</div></div></blockquote>
</div></blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div>=
<div>Li Wang<br></div></div></div>

--000000000000f524d105b9dd24e0--


--===============2037698800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2037698800==--

