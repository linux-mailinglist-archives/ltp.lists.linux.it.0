Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9C6149419
	for <lists+linux-ltp@lfdr.de>; Sat, 25 Jan 2020 10:23:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B4523C2026
	for <lists+linux-ltp@lfdr.de>; Sat, 25 Jan 2020 10:23:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id AFF2D3C1824
 for <ltp@lists.linux.it>; Sat, 25 Jan 2020 10:23:25 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 76C6E616629
 for <ltp@lists.linux.it>; Sat, 25 Jan 2020 10:23:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579944203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c26SoD2N8KI8nhU3iPIx/0cYbrGt58+39WpHGtg6N/A=;
 b=G/OulFfFjif7fkHZf79vtpjiQeaKUvLIM5+KJLQH8WGVbuZt4lLnrObI5ugRH/l126Frzp
 HjlDG43epzatKb9C+5Rdby2PI58vlu0yDvS7oLSJABOFRR3UBBWTg490sNY5ZciLb0myMc
 WLt5KY2UGTP5UkHFIZQdum99zwmH6dM=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-jDytYp3bM46g_RHqEDR1lg-1; Sat, 25 Jan 2020 04:23:19 -0500
Received: by mail-ot1-f70.google.com with SMTP id v2so2347826otq.2
 for <ltp@lists.linux.it>; Sat, 25 Jan 2020 01:23:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BpgFYOX6ajvO4TIq2Z5BDYlS0CPPwHmHgpyTtbyfX+I=;
 b=DyX/M227uMMwJEV7Z5H9qY5OG2+JV83KwojAmJsC5vEXqxnbaBcunEzK1uIhNAsl0e
 i/N3sL+FwJZNyCd7feR1zoQPk9nPHywbUpXX8acTKeC23aZE5n3x+90TYMi06KCdntK3
 lDolg78KTrmH+qNYH/BlnV0zy+fXnLtIsIsLCXOCGTDNVRevOS5/7IYwWwGkAg+Q+QVf
 Jjy+/DuXGzhWjpYLUzKvriiuDFgjfJ/95qXX7r0o+LMiSSxRnE72Vt6WQ2WSXsL4dmf1
 2ui2SiTarK4SUAZ9pf6qoIYtjwghGfFeYvHBl5xlMmQcH7KJNH0rBNjeyrWCYIXAK1/v
 ou0g==
X-Gm-Message-State: APjAAAXPJD89l+YOS4auyBVLvlmp/sqmd3XP46fep/430zQkf84VtTPQ
 2TibQmqmnhPD8ASxKFS1xYkR4lO6bUxFiBHUP/3p91PJx+Kq9Cv7jIJ6+9p0XrXNfZKUAZEhPXa
 SnUlf+o9sfdwqm+0iR898gDtMd2I=
X-Received: by 2002:aca:bb41:: with SMTP id l62mr1882340oif.96.1579944199307; 
 Sat, 25 Jan 2020 01:23:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqxTumxuKzcPf3emFgAVCSvOlleSNW9fhQqiZsMGdhwDCEafOP9Q8hdS3/wfN82EzKv+PkJ4/nLutpRIVLdlVaU=
X-Received: by 2002:aca:bb41:: with SMTP id l62mr1882333oif.96.1579944199046; 
 Sat, 25 Jan 2020 01:23:19 -0800 (PST)
MIME-Version: 1.0
References: <20191218090202.26932-1-liwang@redhat.com>
 <20200122143133.GA29412@rei>
In-Reply-To: <20200122143133.GA29412@rei>
From: Li Wang <liwang@redhat.com>
Date: Sat, 25 Jan 2020 17:23:07 +0800
Message-ID: <CAEemH2dTvYLRO5hyy-T4G-qB7KikbN=Q7zcy+mMp6dYF=XcUCw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: jDytYp3bM46g_RHqEDR1lg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] lib: add .request_hugepages to reserve
 hugepage
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
Content-Type: multipart/mixed; boundary="===============1093640870=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1093640870==
Content-Type: multipart/alternative; boundary="000000000000bfe6f3059cf36c7f"

--000000000000bfe6f3059cf36c7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2020 at 10:31 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> ...
> > +static void run(void)
> > +{
> > +     ...
> > +
> > +     if (tst_hugepages =3D=3D test.request_hugepages)
> > +             TEST(do_hpage_test);
> > +     else
> > +             ...
> > +     ...
> > +}
>
> I guess that it would be more instructive to check the value in the test
> setup() here, because most of the test would just check if tst_hugepages
> has been set to expected value.
>

Yes, that will fit most situations.


> ...
> > +     if (access(PATH_HUGEPAGES, F_OK)) {
> > +             tst_res(TCONF, "Huge page is not supported.");
>
> I guess that this is something the test has to decide, i.e. I wouldn't
> print anything here.
>

OK.

>
> > +             tst_hugepages =3D 0;
> > +             goto out;
> > +     }
> > +
> > +     tst_hugepages =3D hpages;
> > +
> > +     SAFE_FILE_PRINTF("/proc/sys/vm/drop_caches", "3");
>
> Shouldn't we drop the caches only if MemAvailable is not present in
> /proc/meminfo?
>

Yes, that's right theoretically. But the reason I moved it here is that the
huge page reserving easily failed on a small RAM(1~2GB) system because of
too much caches.


>
> > +     if (FILE_LINES_SCANF("/proc/meminfo",
> > +                             "MemAvailable: %ld", &mem_avail)) {
> > +             /*
> > +              * Using "MemFree:" on kernel that doesn't have
> > +              * "MemAvailable:" in Meminfo
> > +              */
> > +             tst_res(TINFO, "MemAvailable: not found in /proc/meminfo"=
);
> > +
> > +             mem_avail =3D SAFE_READ_MEMINFO("MemFree:");
> > +     }
> > +
> > +     max_hpages =3D mem_avail / SAFE_READ_MEMINFO("Hugepagesize:");
> > +
> > +     if (hpages > max_hpages) {
> > +             tst_res(TINFO, "Requested number(%d) of hugepages is too
> large, "
> > +                             "limiting to 80%% of the max hugepage
> count %ld",
> > +                             hpages, max_hpages);
> > +             tst_hugepages =3D max_hpages * 0.8;
>
> Why 80%?
>

I choose(base on personal experience) this number to try again, to satisfy
some test which does not need precise hpages can still run.

Or, maybe let's remove this part, and limit LTP to make use of a precise
number(the at least) of hpage in each test?

>
> Also I guess that we should check here that max_hpages * 0.8 > 1,
> otherwise there is no reason to continue.
>

Agreed.
--=20
Regards,
Li Wang

--000000000000bfe6f3059cf36c7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jan 22, 2020 at 10:31 PM Cyril Hrubis &lt;<=
a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cl=
ass=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; +static void run(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0...<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (tst_hugepages =3D=3D test.request_hugepages)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(do_hpage_test);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
&gt; +=C2=A0 =C2=A0 =C2=A0...<br>
&gt; +}<br>
<br>
I guess that it would be more instructive to check the value in the test<br=
>
setup() here, because most of the test would just check if tst_hugepages<br=
>
has been set to expected value.<br></blockquote><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Yes, that will fit most sit=
uations.</div></div><div class=3D"gmail_default"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small"></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (access(PATH_HUGEPAGES, F_OK)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TCONF, &quot;=
Huge page is not supported.&quot;);<br>
<br>
I guess that this is something the test has to decide, i.e. I wouldn&#39;t<=
br>
print anything here.<br></blockquote><div><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">OK.</div><div class=3D"gmail_default" style=
=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_hugepages =3D 0;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_hugepages =3D hpages;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_FILE_PRINTF(&quot;/proc/sys/vm/drop_caches&q=
uot;, &quot;3&quot;);<br>
<br>
Shouldn&#39;t we drop the caches only if MemAvailable is not present in<br>
/proc/meminfo?<br></blockquote><div><br></div><div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Yes, that&#39;s right theoretically. But the=
 reason I moved it here is that the huge page reserving easily failed on a =
small RAM(1~2GB) system because of too much caches.=C2=A0</div></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (FILE_LINES_SCANF(&quot;/proc/meminfo&quot;,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;MemAvailable: %ld&quot;, &amp;mem_=
avail)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Using &quot;MemFre=
e:&quot; on kernel that doesn&#39;t have<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * &quot;MemAvailable=
:&quot; in Meminfo<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;=
MemAvailable: not found in /proc/meminfo&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mem_avail =3D SAFE_RE=
AD_MEMINFO(&quot;MemFree:&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0max_hpages =3D mem_avail / SAFE_READ_MEMINFO(&quo=
t;Hugepagesize:&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (hpages &gt; max_hpages) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;=
Requested number(%d) of hugepages is too large, &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;limiting to 80%% of the max hugepa=
ge count %ld&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hpages, max_hpages);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_hugepages =3D max=
_hpages * 0.8;<br>
<br>
Why 80%?<br></blockquote><div><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">I choose(base on personal experience) this number to t=
ry again, to satisfy some test which does not need precise hpages can still=
 run.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">Or, maybe let=
&#39;s remove this part, and limit LTP to make use of a precise number(the =
at least) of hpage in each test?</div><div class=3D"gmail_default" style=3D=
"font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Also I guess that we should check here that max_hpages * 0.8 &gt; 1,<br>
otherwise there is no reason to continue.<br></blockquote><div><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Agreed.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"></div></div>-- <br><div dir=
=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></di=
v></div></div>

--000000000000bfe6f3059cf36c7f--


--===============1093640870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1093640870==--

