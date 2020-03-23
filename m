Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A6B18F5F7
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 14:43:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0FC053C4E46
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 14:43:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id DE0783C4E3C
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 14:43:09 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id E2D7F601015
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 14:43:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584970987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=crhHaYkYzSuGNr7mIixHBZ8/rQQ8CmzpCnRXLUCtsDY=;
 b=AG36S5y2g5rAD+fEb3+kGvS0fCkYONRRwKsogDIOuwE5m7MG5cZEdg9CXno7f/woozgRNO
 jvz0BhCNVOEPm067lBzL4ozoD+eY8uCsahGjLkdofnDaiDDcTpKtt4Z0aOfIzubJnT4Vxh
 Tgq3upgEDcvhU7wzuhSvG4ZiyAGyYMw=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-1Y_tKYrlOPadDc1RAUu4pg-1; Mon, 23 Mar 2020 09:43:03 -0400
X-MC-Unique: 1Y_tKYrlOPadDc1RAUu4pg-1
Received: by mail-oi1-f199.google.com with SMTP id e203so10353773oif.5
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 06:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M9inN42IVxXoivfz1nsU4fGIVnB0Zv3oywjGvnLLxTA=;
 b=h3u5OQ3VOqE4o6OU6CFFmoVEUZIglAflKxEBEQ6lOjbdo8Vcm/SqKJT2TmzAwhru1s
 TgP5lUHnUA2WkZp9xXxc+p6rjuQ4AZErQQLURDWrVP+3AENfs+hoWi9gYTJrRJwrhL57
 3hFNJ7DNZzwHyc35JUTOlsYwLtLBbfZRkQlffr2QyRO+yJNP855/hd4rXn55xuHc/6FI
 ig4F53ocRj76/EBCwfxLPbj43YcVxk7UeZccvyQTitUu07GwzY+MzNdbtMas3kFW/tKy
 9MeOs45D1SmjeM4GjiSgYpwY0Voi272snZXBHzq6pZbknVIrj5GeaFcthKBCOAPLoTAn
 GRAA==
X-Gm-Message-State: ANhLgQ29yzCk8cmFgeuO4vpZRLTSxOcyuiVhhwk5AeSbqvpv4QqHrABI
 /sK+/3RAKUKW0zOGaeKRLie40cB84XThrkadNIDptTD9jjP8GS0JyllE10/DtgHtyxBAhaAsimN
 m20/D9zwLJbbemh1DjiOVGmJuwvc=
X-Received: by 2002:a9d:7e82:: with SMTP id m2mr15849013otp.264.1584970982021; 
 Mon, 23 Mar 2020 06:43:02 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsP/4DpXvwtAt5CeLsLh+Gh+GwLxaiStXbivZQaWBae6M9s/VPROAy+Rrd/LBWQCgmqCc1wCT1by2ZZT4ihi6c=
X-Received: by 2002:a9d:7e82:: with SMTP id m2mr15848995otp.264.1584970981724; 
 Mon, 23 Mar 2020 06:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200320134937.16616-1-pvorel@suse.cz>
 <20200320134937.16616-2-pvorel@suse.cz>
 <CAEemH2f7TB9sMt-+YE2zF5KztT4O64VN9L4AZWdS3nU1uJX5_w@mail.gmail.com>
 <303d1019-f836-b2ae-ce51-d2c46dd7fb1e@cn.fujitsu.com>
 <20200323113738.GA4807@dell5510>
In-Reply-To: <20200323113738.GA4807@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Mon, 23 Mar 2020 21:42:47 +0800
Message-ID: <CAEemH2fhRYefq_9LmSmDvujS1OQa7rCeF7V=mJQrLhz0bwpo0A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Use SAFE_RUNCMD()
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
Content-Type: multipart/mixed; boundary="===============0074169516=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0074169516==
Content-Type: multipart/alternative; boundary="000000000000586a9005a185d034"

--000000000000586a9005a185d034
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr, Xu,

On Mon, Mar 23, 2020 at 7:37 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li, Xu,
>
> > >       testcases/kernel/syscalls/add_key/add_key05.c   | 15
> ++-------------
> > >       testcases/kernel/syscalls/quotactl/quotactl01.c | 14
> ++------------
> > >       testcases/kernel/syscalls/quotactl/quotactl06.c | 12 +---------=
--
>
> > > Apart from the three, do you consider converting to SAFE_RUNCMD for t=
he
> > > rest testcases?
> > > (it seems not too much work remaining since only a few test case uses
> > > tst_run_cmd)
> > At the beginning, I have the same idea. But after seeing code, I think =
we
> > should not because these cases have many sub tests(only few test depond=
s
> on
> > the result of the cmd execution.
>
> > > kernel/syscalls/setpriority/setpriority01.c
> > One year ago has a commit db82b596(setpriority01: Skip only PRIO_USER
> when
> > unable to add test user). It only affects PRIO_USER sub test.
> + 1. I didn't want to break the case when useradd is not available
> (android or
> some custom embedded linux) or there is no password file (root mounted as
> ro -
> custom embedded linux).
>

That's right. Thanks for the clarification.

>
> BTW I also avoid handling adding user as I want to implement better
> handling
> user and group in LTP (adding a flag), see:
> https://github.com/linux-test-project/ltp/issues/468


Good plan.


>
>
> Feel free to commend this plan.
> This patchset is kind of preparation for it.
>
> > > kernel/syscalls/copy_file_range/copy_file_range02.c
> > only affect test6 and test7
> >  6) Try to copy contents to a file chattred with +i
> >  *    flag -> EPERM
> >  * 7) Try to copy contents to a swapfile ->ETXTBSY
> Yes, it'd be bad to break all tests due it.
>
> Here is also problem with swapoff (or maybe chattr, mkswap, swapon; I don=
't
> remember), which returns exit code 255 on error, so it's not possible to
> distinguish this from the case whether command is not available (any idea=
,
> how
> to fix it?).
>

Maybe we could achieve a tst_cmd_available(char *cmd) in the C version?
which uses popen() to open a process like: "whereis/which command" and do
string parse in the result to see the path(/usr/bin/cmd, /usr/sbin/cmd) of
the bin if it has been found.

A draft version to show the idea:

int tst_cmd_available(char *cmd)
{
    int ret =3D 0;
    char path[PATH_MAX];
    char result[PATH_MAX];
    char command[PATH_MAX];

    snprintf(path, PATH_MAX, "/usr/bin/%s", cmd);
    snprintf(command, PATH_MAX, "whereis %s", cmd);
    FILE *fp =3D popen(command, "r");
    fgets(result, sizeof(result), fp);

    if (strstr(result, path) !=3D NULL)
        ret =3D 1;
    pclose(fp);

    return ret;
}
--=20
Regards,
Li Wang

--000000000000586a9005a185d034
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr, Xu,</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 23, 2020 at 7:37 PM Petr V=
orel &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li, Xu,<br>
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0testcases/kernel/syscalls/add_key/add_k=
ey05.c=C2=A0 =C2=A0| 15 ++-------------<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0testcases/kernel/syscalls/quotactl/quot=
actl01.c | 14 ++------------<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0testcases/kernel/syscalls/quotactl/quot=
actl06.c | 12 +-----------<br>
<br>
&gt; &gt; Apart from the three, do you consider converting to SAFE_RUNCMD f=
or the<br>
&gt; &gt; rest testcases?<br>
&gt; &gt; (it seems not too much work remaining since only a few test case =
uses<br>
&gt; &gt; tst_run_cmd)<br>
&gt; At the beginning, I have the same idea. But after seeing code, I think=
 we<br>
&gt; should not because these cases have many sub tests(only few test depon=
ds on<br>
&gt; the result of the cmd execution.<br>
<br>
&gt; &gt; kernel/syscalls/setpriority/setpriority01.c<br>
&gt; One year ago has a commit db82b596(setpriority01: Skip only PRIO_USER =
when<br>
&gt; unable to add test user). It only affects PRIO_USER sub test.<br>
+ 1. I didn&#39;t want to break the case when useradd is not available (and=
roid or<br>
some custom embedded linux) or there is no password file (root mounted as r=
o -<br>
custom embedded linux).<br></blockquote><div><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">That&#39;s right. Thanks for the clarifi=
cation.</div><div class=3D"gmail_default" style=3D"font-size:small"></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
BTW I also avoid handling adding user as I want to implement better handlin=
g<br>
user and group in LTP (adding a flag), see:<br>
<a href=3D"https://github.com/linux-test-project/ltp/issues/468" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/linux-test-project/ltp/issues=
/468</a></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">Good plan.</div></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><br>
<br>
Feel free to commend this plan.<br>
This patchset is kind of preparation for it.<br>
<br>
&gt; &gt; kernel/syscalls/copy_file_range/copy_file_range02.c<br>
&gt; only affect test6 and test7<br>
&gt;=C2=A0 6) Try to copy contents to a file chattred with +i<br>
&gt;=C2=A0 *=C2=A0 =C2=A0 flag -&gt; EPERM<br>
&gt;=C2=A0 * 7) Try to copy contents to a swapfile -&gt;ETXTBSY<br>
Yes, it&#39;d be bad to break all tests due it.<br>
<br>
Here is also problem with swapoff (or maybe chattr, mkswap, swapon; I don&#=
39;t<br>
remember), which returns exit code 255 on error, so it&#39;s not possible t=
o<br>
distinguish this from the case whether command is not available (any idea, =
how<br>
to fix it?).<br></blockquote><div><br></div><div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Maybe we could achieve a tst_cmd_available(cha=
r *cmd) in the C version?</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">which uses popen() to open a process like: &quot;whereis/which c=
ommand&quot; and do string parse in the result to see the path(/usr/bin/cmd=
, /usr/sbin/cmd) of the bin if it has been found.</div></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">A draft version to show the idea:</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div>int tst_cm=
d_available(char *cmd)<br>{<br>=09<span class=3D"gmail_default" style=3D"fo=
nt-size:small">=C2=A0 =C2=A0 </span>int ret =3D 0;<br>=09<span class=3D"gma=
il_default" style=3D"font-size:small">=C2=A0 =C2=A0 </span>char path[PATH_M=
AX];<br>=09<span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =
=C2=A0 </span>char result[PATH_MAX];<br>=09<span class=3D"gmail_default" st=
yle=3D"font-size:small">=C2=A0 =C2=A0 </span>char command[PATH_MAX];<br><br=
>=09<span class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 <=
/span>snprintf(path, PATH_MAX, &quot;/usr/bin/%s&quot;, cmd);<br>=09<span c=
lass=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 </span>snpri=
ntf(command, PATH_MAX, &quot;whereis %s&quot;, cmd);<br>=09<span class=3D"g=
mail_default" style=3D"font-size:small">=C2=A0 =C2=A0 </span>FILE *fp =3D p=
open(command, &quot;r&quot;);<br>=09<span class=3D"gmail_default" style=3D"=
font-size:small">=C2=A0 =C2=A0 </span>fgets(result, sizeof(result), fp);</d=
iv><div><br>=09<span class=3D"gmail_default" style=3D"font-size:small">=C2=
=A0 =C2=A0 </span>if (strstr(result, path) !=3D NULL)<br>=09=09<span class=
=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </=
span>ret =3D 1;<br>=09<span class=3D"gmail_default" style=3D"font-size:smal=
l">=C2=A0 =C2=A0 </span>pclose(fp);<br><br>=09<span class=3D"gmail_default"=
 style=3D"font-size:small">=C2=A0 =C2=A0 </span>return ret;<br>}<br><div cl=
ass=3D"gmail_default" style=3D"font-size:small"></div></div></div>-- <br><d=
iv dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br>=
</div><div>Li Wang<br></div></div></div></div>

--000000000000586a9005a185d034--


--===============0074169516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0074169516==--

