Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6244512D66D
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 06:25:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1660A3C207E
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 06:25:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C268B3C14F8
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 06:25:29 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 0221660129C
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 06:25:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577769926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cuqvf555rliMGfGyzPeRt0Bfn1N46X8kFMC1RYDiSlU=;
 b=QGdqnkAwzO4KykB+Kl/ZnEUxRYGDjES4EX02Y9rbcc/gew+Raobdw2WjcgRDnjRaQeojLf
 tdf73NdQAwgps76I6aLxysueT2qzAkHW+KMlT0WWk0uwERX4axBeOVHcdzDZE7fTWFlwaG
 AdDhoblRpOD1L7I8q0xrIGa2+JLpoP4=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-0pwl3PLCPpS3Wvh6nZpI4w-1; Tue, 31 Dec 2019 00:25:21 -0500
Received: by mail-ot1-f70.google.com with SMTP id d16so10076165otq.19
 for <ltp@lists.linux.it>; Mon, 30 Dec 2019 21:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pt+rE8jB+IAdiK24LDvyZHiQEfBrv1axKTmMaoFJXiw=;
 b=pqiwv+FPp1PWcRsogOdu6BSoW9Ad056YF7/Y00I4Y6bijTECGC/ioz9G+iCV/uTyI4
 2Yt3yrINCbBfJri7aEsYTnfcRJm+Jw5cZITqTT7P4cdQ4c4TW/QaW2rJOOv+KzXcbmA0
 txJELUR4oCChN1iy6TppvN7wVKhN4AoSUM3mz1IMynCazGbB6hVQeJyVKDEFVr/7lwTK
 7/Gi5rXEn9ZYaroCmiRjAvgVyaPuKr9B5x5GYbUD5idDEvzAVe0JDCNlyBqrGlUd/+Kb
 T/UvP4MuiACacl91vj8IKgTaweD0evWVBwG1lG3zC/MTLLv0jAOIDcpklVe5RZ/tzvbJ
 5Yjw==
X-Gm-Message-State: APjAAAU+BxGveEhZyw0TcyQFyL9UIA2mOOGkL8GBeKjw3w8oDPBP+rQj
 VbMTeQ4QBe5ywucwy6aozFwtxxTGMN6O43W3KFXOMob2TAl+YWTRn7USS0xbo0XeKcsVhBUxlPm
 T2ESkEOq36UT1w94poTjH1PcEYn4=
X-Received: by 2002:a05:6830:1cd3:: with SMTP id
 p19mr74348104otg.118.1577769920987; 
 Mon, 30 Dec 2019 21:25:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyzR+jL5kalWtx5/KWxWOafp2ZcVEf9qifwwPUO+EWnMD6s2t8IhVdsLP/4i2UCCbAKIDpvY4f5JxtQfPXHfV8=
X-Received: by 2002:a05:6830:1cd3:: with SMTP id
 p19mr74348087otg.118.1577769920774; 
 Mon, 30 Dec 2019 21:25:20 -0800 (PST)
MIME-Version: 1.0
References: <20191218082826.25083-1-liwang@redhat.com>
 <2104821569.17247635.1576661091375.JavaMail.zimbra@redhat.com>
 <CAFA6WYN1ssqCzCqvT=9=DLjZdQz8OnH7+YBi8VGo7XLRdNLyvg@mail.gmail.com>
 <CAEemH2eRhmozt5OiT6z-YBjJUBNaGZgQVQRh40hNpKcq2d4-aw@mail.gmail.com>
 <CAFA6WYOBbH8UbwrK1f3ZQjGuqHJqGZxhQ-N0w1mpBHz0bnPG1w@mail.gmail.com>
 <CAEemH2eXvZB9uCuZFsc2uMAt5k2F_gfgXCqch58juMsJn4Gr4w@mail.gmail.com>
In-Reply-To: <CAEemH2eXvZB9uCuZFsc2uMAt5k2F_gfgXCqch58juMsJn4Gr4w@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 31 Dec 2019 13:25:09 +0800
Message-ID: <CAEemH2coGZGjFLhHzeR4JJYWpERGypjRdXRQ2dO0f1=Drh2KOg@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>
X-MC-Unique: 0pwl3PLCPpS3Wvh6nZpI4w-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] sync_file_range02: remove the toplimit of
 write back
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
Cc: LTP List <ltp@lists.linux.it>, Caspar Zhang <caspar@linux.alibaba.com>
Content-Type: multipart/mixed; boundary="===============0125863823=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0125863823==
Content-Type: multipart/alternative; boundary="000000000000aa7263059af92f1e"

--000000000000aa7263059af92f1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 19, 2019 at 5:15 PM Li Wang <liwang@redhat.com> wrote:

>
>
> On Thu, Dec 19, 2019 at 4:52 PM Sumit Garg <sumit.garg@linaro.org> wrote:
>
>> ...
>> >> To avoid similar scenarios, I suggested to add a "sync()" call just
>> >> prior to test here [1]. And I couldn't reproduce the failure in
>> >> 1000-times run with 4.19 kernel.
>> >
>> >
>> > Yes, that makes sense to me.
>> >
>>
>> Would you mind to give it a try and check if you could reproduce the
>> failure?
>>
>
> Actually, I haven't had one time to reproduce it. This failure was
> reported by CI jobs and very low frequency occurred. The fix is based on =
a
> discussion with FS developer analysis.
>
> But I would have a try with this patch(+ sync()).
>

I have tried this for many different systems, and it doesn't hit the
failure at least one time. So if no more comments, I would merge the patch
as below in the next step.

--- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
+++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
@@ -48,6 +48,8 @@ static void verify_sync_file_range(struct testcase *tc)

        lseek(fd, tc->write_off, SEEK_SET);

+       sync();
+
        tst_dev_bytes_written(tst_device->dev);

        tst_fill_fd(fd, 0, TST_MB, tc->write_size_mb);
@@ -66,8 +68,7 @@ static void verify_sync_file_range(struct testcase *tc)

        SAFE_CLOSE(fd);

-       if ((written >=3D tc->exp_sync_size) &&
-           (written <=3D (tc->exp_sync_size + tc->exp_sync_size/10)))
+       if (written >=3D tc->exp_sync_size)
                tst_res(TPASS, "%s", tc->desc);
        else
                tst_res(TFAIL, "%s: Synced %li, expected %li", tc->desc,

--=20
Regards,
Li Wang

--000000000000aa7263059af92f1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, Dec 19, 2019 at 5:15 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
Dec 19, 2019 at 4:52 PM Sumit Garg &lt;<a href=3D"mailto:sumit.garg@linaro.=
org" target=3D"_blank">sumit.garg@linaro.org</a>&gt; wrote:<span class=3D"g=
mail_default" style=3D"font-size:small"></span></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><span class=3D"gmail_default" style=3D"font-siz=
e:small">...</span><br>
&gt;&gt; To avoid similar scenarios, I suggested to add a &quot;sync()&quot=
; call just<br>
&gt;&gt; prior to test here [1]. And I couldn&#39;t reproduce the failure i=
n<br>
&gt;&gt; 1000-times run with 4.19 kernel.<br>
&gt;<br>
&gt;<br>
&gt; Yes, that makes sense to me.<br>
&gt;<br>
<br>
Would you mind to give it a try and check if you could reproduce the failur=
e?<br></blockquote><div><br></div><div><div style=3D"font-size:small">Actua=
lly, I haven&#39;t had one time to reproduce it. This failure was reported =
by CI jobs and very low frequency occurred. The fix is based on a discussio=
n=C2=A0with FS developer analysis.</div><div style=3D"font-size:small"><br>=
</div><div style=3D"font-size:small">But I would have a try with this patch=
(+ sync()).</div></div></div></div></blockquote><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">I have tried this for many =
different systems, and it doesn&#39;t hit the failure at least one time. So=
 if no more comments, I would merge the patch as below in the next step.</d=
iv></div><div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div></div><div class=3D"gmail_default" style=3D"font-size:small">--- a/test=
cases/kernel/syscalls/sync_file_range/sync_file_range02.c<br>+++ b/testcase=
s/kernel/syscalls/sync_file_range/sync_file_range02.c<br>@@ -48,6 +48,8 @@ =
static void verify_sync_file_range(struct testcase *tc)<br>=C2=A0<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 lseek(fd, tc-&gt;write_off, SEEK_SET);<br>=C2=A0<br>+=
 =C2=A0 =C2=A0 =C2=A0 sync();<br>+<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_dev_b=
ytes_written(tst_device-&gt;dev);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
tst_fill_fd(fd, 0, TST_MB, tc-&gt;write_size_mb);<br>@@ -66,8 +68,7 @@ stat=
ic void verify_sync_file_range(struct testcase *tc)<br>=C2=A0<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 SAFE_CLOSE(fd);<br>=C2=A0<br>- =C2=A0 =C2=A0 =C2=A0 if ((=
written &gt;=3D tc-&gt;exp_sync_size) &amp;&amp;<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (written &lt;=3D (tc-&gt;exp_sync_size + tc-&gt;exp_sync_size=
/10)))<br>+ =C2=A0 =C2=A0 =C2=A0 if (written &gt;=3D tc-&gt;exp_sync_size)<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS, &=
quot;%s&quot;, tc-&gt;desc);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL, &quot;%s: S=
ynced %li, expected %li&quot;, tc-&gt;desc,<br></div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div></div>-- <br><div dir=3D"ltr"><d=
iv dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></d=
iv>

--000000000000aa7263059af92f1e--


--===============0125863823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0125863823==--

