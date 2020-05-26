Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 511821E19DD
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 05:23:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0A313C3348
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 05:23:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8ABF83C136F
 for <ltp@lists.linux.it>; Tue, 26 May 2020 05:23:17 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 50AB31A00615
 for <ltp@lists.linux.it>; Tue, 26 May 2020 05:23:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590463394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uuQp9Gevn/qceBzYXxpssPjw1+HpKYnNZWd9TGiruXw=;
 b=UhBqa4qxKcq6N37V8AOo0KVPacx8bn13zgX2WdBwOhKwrEXeK2m0al45PrKnvE84rCDNeq
 du7dTnayxcGO7dX4N2Og7B8IahuWHzW1vskSKz+MQ0DeKhazorZva1HrfB8rMQmUR/BQ3t
 ZaA8ruFVfy0LaSCTQREIIqXnNhP4aUA=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-Xiit208yOC2Wxsuz8_pnqQ-1; Mon, 25 May 2020 23:23:12 -0400
X-MC-Unique: Xiit208yOC2Wxsuz8_pnqQ-1
Received: by mail-lf1-f70.google.com with SMTP id a10so3875438lfo.23
 for <ltp@lists.linux.it>; Mon, 25 May 2020 20:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uuQp9Gevn/qceBzYXxpssPjw1+HpKYnNZWd9TGiruXw=;
 b=fh2W6/iVCeIbVFEBx0x77AmWElZ/1HOJ/w06sXHXAlv/UBKCyC2QxfUztHWq6d4f0p
 i/bdmwBCrnPSmT/MpVENVRuo1JgcbSpAg9p4xtY7LhBmO10m0lPOF5cDNLB+se5wax3l
 yo9VOA4xq9f+yuTUuyqzgmaskRnPo86k3JJwaRmOBVO3Nc41mZJz6EmHNajoyBoAjaAZ
 ZXKdW4Ln0K0uViJVSwRJWuLCgSKldYqdz2QhVoC7Jagdstb+9qL4Wak7eubx/SQ9a//M
 gKbMEIkg9lm+2N4xR/yv3E5wFbnZ5nihVtT42n7ddK8QwIOGKTAfKX+BubNS3dF5kRpU
 gLGA==
X-Gm-Message-State: AOAM53001dyuX6pYNSDLDuMWA8xfJgyrLBHZE++IEGhYB6aQ3d96nq14
 VJdSeXXPbpCmNdT+ecI6NUP68t2S5a8g4k3yOfNZnn/1S/1xLJKzerDxujPuSspblgrACAiVltq
 qaRzG2jzwmJ6CX+vktfZ4fn/Rn7U=
X-Received: by 2002:a05:651c:1065:: with SMTP id
 y5mr13377641ljm.441.1590463390791; 
 Mon, 25 May 2020 20:23:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhzeOwBKbT6c/eF4tmZbtbJWP3kMvMQX7LsG1kjxyLaTlTrJbsxTN1kl6iIJnIvtcfFw8oQOs0J/5iYOr+ews=
X-Received: by 2002:a05:651c:1065:: with SMTP id
 y5mr13377632ljm.441.1590463390610; 
 Mon, 25 May 2020 20:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <cki.5639E3C778.X5N9P4R7GB@redhat.com>
 <2102236949.13452256.1590328678642.JavaMail.zimbra@redhat.com>
 <CAEemH2dNB3Ktt5LeBLxMKekv7-gj4d=EkQouYmO1SgbyzjLEaw@mail.gmail.com>
 <1440024610.13546915.1590416134343.JavaMail.zimbra@redhat.com>
In-Reply-To: <1440024610.13546915.1590416134343.JavaMail.zimbra@redhat.com>
From: Li Wang <liwan@redhat.com>
Date: Tue, 26 May 2020 11:22:58 +0800
Message-ID: <CAEemH2dCnkczxB2jWrGprRGQ=F7PB=o53MmUNDrcfhB34z4P9A@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>, LTP List <ltp@lists.linux.it>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] 
	=?utf-8?q?=E2=9D=8C_FAIL=3A_Waiting_for_review=3A_Test_rep?=
	=?utf-8?q?ort_for_kernel_5=2E6=2E14-dbf782f=2Ecki_=28stable-queue?=
	=?utf-8?q?=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, skt-results-master@redhat.com,
 CKI Project <cki-project@redhat.com>,
 William Gomeringer <wgomeringer@redhat.com>
Content-Type: multipart/mixed; boundary="===============1843049471=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1843049471==
Content-Type: multipart/alternative; boundary="0000000000006d100005a6849dd6"

--0000000000006d100005a6849dd6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2020 at 10:15 PM Jan Stancek <jstancek@redhat.com> wrote:

>
> ...


> > > >     s390x:
> > > >      =E2=9D=8C LTP
> > >
> > > @Li, any thoughts on hugetlb TBROKs here? I thought you said
> > > 'request_hugepages'
> > > was not supposed to be hard test requirement.
> > >
> >
> > The hugemmap05.c doesn't goes the new 'request_hugepages' way in the hu=
ge
> > page reserving. it tries to reserve 128 hpages and overcommits 192 hpag=
es
> > in hard coding, and probably touch the memory available uplimit on s390=
x.
> > static long size =3D 128, length =3D 384;
> > ...
> > addr =3D SAFE_MMAP(ADDR, (length / 2 * hugepagesize), PROTECTION, FLAGS=
,
> fd,
> > 0);
> >
> > We could convert this to use the new request_hugepages API and do the
> > requested number of huge page checking at setup() to make sure the syst=
em
> > only running in a reasonable situation.
>
> Sorry, I didn't make it clear I was talking about hugemmap06. The patch i=
s
> OK,
> since it makes both use request_hugepages API. But should we also do
> something
> with this TBROK?
>

It seems unkind and useless to exit with TBROK when failed to reserve with
80% max_hpages again. I'm thinking if it could be directly replaced by
TCONF to skip the whole test?

--- a/lib/tst_hugepage.c
+++ b/lib/tst_hugepage.c
@@ -43,7 +43,7 @@ unsigned long tst_request_hugepages(unsigned long hpages)
        SAFE_FILE_PRINTF(PATH_NR_HPAGES, "%lu", tst_hugepages);
        SAFE_FILE_SCANF(PATH_NR_HPAGES, "%lu", &val);
        if (val !=3D tst_hugepages)
-               tst_brk(TBROK, "nr_hugepages =3D %lu, but expect %lu", val,
tst_hugepages);
+               tst_brk(TCONF, "Not enough hugepages for testing.");

        tst_res(TINFO, "%lu hugepage(s) reserved", tst_hugepages);
 out:


>
>     tst_hugepage.c:46: BROK: nr_hugepages =3D 171, but expect 255
>
>

--=20
Regards,
Li Wang

--0000000000006d100005a6849dd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, May 25, 2020 at 10:15 PM Jan Stancek &lt;<a=
 href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span>=C2=A0</b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0s390x:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =E2=9D=8C LTP<br>
&gt; &gt;<br>
&gt; &gt; @Li, any thoughts on hugetlb TBROKs here? I thought you said<br>
&gt; &gt; &#39;request_hugepages&#39;<br>
&gt; &gt; was not supposed to be hard test requirement.<br>
&gt; &gt;<br>
&gt; <br>
&gt; The hugemmap05.c doesn&#39;t goes the new &#39;request_hugepages&#39; =
way in the huge<br>
&gt; page reserving. it tries to reserve 128 hpages and overcommits 192 hpa=
ges<br>
&gt; in hard coding, and probably touch the memory available uplimit on s39=
0x.<br>
&gt; static long size =3D 128, length =3D 384;<br>
&gt; ...<br>
&gt; addr =3D SAFE_MMAP(ADDR, (length / 2 * hugepagesize), PROTECTION, FLAG=
S, fd,<br>
&gt; 0);<br>
&gt; <br>
&gt; We could convert this to use the new request_hugepages API and do the<=
br>
&gt; requested number of huge page checking at setup() to make sure the sys=
tem<br>
&gt; only running in a reasonable situation.<br>
<br>
Sorry, I didn&#39;t make it clear I was talking about hugemmap06. The patch=
 is OK,<br>
since it makes both use request_hugepages API. But should we also do someth=
ing<br>
with this TBROK?<br></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">It seems unkind and useless to exit with T=
BROK when failed to reserve with 80% max_hpages again. I&#39;m thinking if =
it could be directly replaced=C2=A0by TCONF to skip the whole test?</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div>--- a/lib/ts=
t_hugepage.c<br>+++ b/lib/tst_hugepage.c<br>@@ -43,7 +43,7 @@ unsigned long=
 tst_request_hugepages(unsigned long hpages)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 SAFE_FILE_PRINTF(PATH_NR_HPAGES, &quot;%lu&quot;, tst_hugepages);<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_FILE_SCANF(PATH_NR_HPAGES, &quot;%lu&quot;, &=
amp;val);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (val !=3D tst_hugepages)<br>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TBROK, &quot;nr_hu=
gepages =3D %lu, but expect %lu&quot;, val, tst_hugepages);<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TCONF, &quot;Not enough huge=
pages for testing.&quot;);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res=
(TINFO, &quot;%lu hugepage(s) reserved&quot;, tst_hugepages);<br>=C2=A0out:=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
=C2=A0 =C2=A0 tst_hugepage.c:46: BROK: nr_hugepages =3D 171, but expect 255=
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Regards,<=
br>Li Wang<br></div></div></div></div></div>

--0000000000006d100005a6849dd6--


--===============1843049471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1843049471==--

