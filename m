Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC5E112304
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2019 07:40:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8BD243C2506
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2019 07:40:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B3B303C2454
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 07:40:28 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id E001C60C703
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 07:40:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575441626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HUOboSqa2rY0HGhMncxJp0EBJuU5KaLzkj3lGkvA89c=;
 b=imvQuSL9T/0QbzMY4M5Wzvr2e3vfTcEzQgnOpxHdFB44akI2VKPsTDXmMA+zWsx51niU+Q
 DbuJMqUz/AAwSX5Zx7ZSmWIYsI23FdOG9lbNgc/Cpvl2+jEuZyCtL3TtKz2Aw5/Hd4oVLe
 EHkuZtLmtQSIOSb2b37CXER+hq4dEJk=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-aAexs1K6MaGcIyPwqQ2uCw-1; Wed, 04 Dec 2019 01:40:23 -0500
Received: by mail-oi1-f197.google.com with SMTP id v130so3148123oib.5
 for <ltp@lists.linux.it>; Tue, 03 Dec 2019 22:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lX5rJEFcIzyAMuDwbLmFNJfbsLQeULEFtQn6xKc4MdU=;
 b=MktDIVqp/FwEBzkD8tSeHrxfhKeD+4D7Q7gf3Y0dI0Rjolr7Z4G8Lud7gzhu1xAEVc
 18z+k53nwa3Ha2OJKHT3lzwy9WZQkWiCEwYcjeWlZQG9zc8fo/XM/mTCHhDP2t4Vsl0Y
 NXiWVTgyek54KxQJ0wz+pn4MFbVPhVm5wNn2Nf8PRstb4pRf0zARSdH3ofEibhc4bEdz
 EVU8cw+frpA5R9vqJlKFTVQHijrJHGCkSuZZRr3qwAJ8p+T+Yisrs2fFoSINXRkx2lfk
 yZHnPOBKhTtX06e4+OSfFNauGZO/i5rDgNjSEtWXZCm58OhYNj1kRWXMYfNo5Ci4VMn8
 K7jg==
X-Gm-Message-State: APjAAAVeXuUxaip1pTtzaELequMNb41QBzHV2v4P9tqw9CPnrfhIyckk
 9daXZT+9PrjrNPrXL3JQJwlgdZtm5IxnoFWJuqtf9ARl6IjUaUELkbNFbv2/F5bPx27Jq7o9mVm
 TH2xmX6g2iAXsrHWnA3yUXBAUEVM=
X-Received: by 2002:aca:782:: with SMTP id 124mr1265181oih.47.1575441622555;
 Tue, 03 Dec 2019 22:40:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqzVDuVv6HPH64SbtC6+ksw0oKKOzp04XW/PjwrQ5m8H4rVwuyUXv6pHyzfwkwClmHmaKByTQQTeaffUf5KdhwQ=
X-Received: by 2002:aca:782:: with SMTP id 124mr1265171oih.47.1575441622169;
 Tue, 03 Dec 2019 22:40:22 -0800 (PST)
MIME-Version: 1.0
References: <20191128084506.7587-1-liwang@redhat.com>
 <20191203104917.GA2844@rei>
In-Reply-To: <20191203104917.GA2844@rei>
From: Li Wang <liwang@redhat.com>
Date: Wed, 4 Dec 2019 14:40:10 +0800
Message-ID: <CAEemH2d0KJ_oi7j5sjcT=uUo28crB_hCs-gJzvWhczvKOG-mdA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: aAexs1K6MaGcIyPwqQ2uCw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: add tst_request_hugepages
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
Content-Type: multipart/mixed; boundary="===============0983080405=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0983080405==
Content-Type: multipart/alternative; boundary="000000000000411d350598db16a3"

--000000000000411d350598db16a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2019 at 6:49 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> ...
>
> Can we add this to the tst_test structure so that test case use this as:
>
> static struct tst_test test =3D {
>         ...
>         .needs_hugepages =3D 1,
>         ...
> }
>
>
Good point.


> That way it will be included in the test metadata I'm working on.
>
> ...
> > +
> > +     if (hpages > max_hpages) {
> > +             tst_res(TINFO, "Request %ld hugepages failed, memory too
> fragmented? "
> > +                             "The max hugepage available count %ld",
> > +                             hpages, max_hpages);
> > +             return 0;
>
> I guess that rest of the library functions returns non-zero on failure.
>

Sure, will reset the value for return.


>
> > +     }
> > +
> > +     SAFE_FILE_PRINTF("/proc/sys/vm/nr_hugepages", "%ld", hpages);
> > +     SAFE_FILE_SCANF("/proc/sys/vm/nr_hugepages", "%d", &val);
> > +     if (val !=3D hpages)
> > +             tst_brk(TBROK, "nr_hugepages =3D %d, but expect %ld", val=
,
> hpages);
> > +
> > +     return 1;
>
> I guess that things will be more complicated than this. If there is
> already a pool of hugepages allocated on the machine and some are used
> this will utimatelly fail.
>

I don't think so, if they're already many huge pages being used, the free
memory of the system will firstly tell us the max_hpages is not satisfy for
testing, it means we have no chance to arrive here.


>
> I rember that we changed some tests to increase the nr_hugepages if
> needed instead of blindly writing values there.
>

Yes, but that's only fit for the situation which does not need the precise
number of pages, we could take 80% of the max_hpages and do our testing in
our system.

But in this function, my purpose is to request the least number of pages
for the test. e.g if the .needs_hugepages is set to an expected number, we
should verify strictly if the system can provide that.


>
> Also this fails to cleanup after itself, we have to restore the system
> after the test, which is one more reason why we need .needs_hugepages in
> the tst_test structure because the test library can cleanup after the
> test with that.
>

Agree, I will add the save/restore part for this.

--=20
Regards,
Li Wang

--000000000000411d350598db16a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Dec 3, 2019 at 6:49 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_default=
" style=3D"font-size:small">...</span><br>
<br>
Can we add this to the tst_test structure so that test case use this as:<br=
>
<br>
static struct tst_test test =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .needs_hugepages =3D 1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
}<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Good point.</div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
That way it will be included in the test metadata I&#39;m working on.<br>
<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (hpages &gt; max_hpages) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;=
Request %ld hugepages failed, memory too fragmented? &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;The max hugepage available count %=
ld&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hpages, max_hpages);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
<br>
I guess that rest of the library functions returns non-zero on failure.<br>=
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">Sure, will reset the value for return.</div></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_FILE_PRINTF(&quot;/proc/sys/vm/nr_hugepages&=
quot;, &quot;%ld&quot;, hpages);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_FILE_SCANF(&quot;/proc/sys/vm/nr_hugepages&q=
uot;, &quot;%d&quot;, &amp;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (val !=3D hpages)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK, &quot;=
nr_hugepages =3D %d, but expect %ld&quot;, val, hpages);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 1;<br>
<br>
I guess that things will be more complicated than this. If there is<br>
already a pool of hugepages allocated on the machine and some are used<br>
this will utimatelly fail.<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">I don&#39;t think so, if they&=
#39;re already many huge pages being used, the free memory of the system wi=
ll firstly tell us the=C2=A0max_hpages is not satisfy for testing, it means=
 we have no chance to arrive here.</div></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
I rember that we changed some tests to increase the nr_hugepages if<br>
needed instead of blindly writing values there.<br></blockquote><div><br></=
div><div><div class=3D"gmail_default" style=3D"font-size:small">Yes, but th=
at&#39;s only fit for the situation which does not need the precise number =
of pages, we could take 80% of the=C2=A0max_hpages and do our testing in ou=
r system.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">But in th=
is function, my purpose is to request the=C2=A0least number of pages for th=
e test. e.g if the=C2=A0.needs_hugepages is set to an expected number, we s=
hould verify strictly if the system can provide that.</div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Also this fails to cleanup after itself, we have to restore the system<br>
after the test, which is one more reason why we need .needs_hugepages in<br=
>
the tst_test structure because the test library can cleanup after the<br>
test with that.<br></blockquote><div><br></div></div><div class=3D"gmail_de=
fault" style=3D"font-size:small">Agree, I will add the save/restore part fo=
r this.</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatur=
e"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></di=
v></div>

--000000000000411d350598db16a3--


--===============0983080405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0983080405==--

