Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E857018815
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 12:00:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C3D0C3EABEC
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 12:00:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E44483EA028
 for <ltp@lists.linux.it>; Thu,  9 May 2019 12:00:32 +0200 (CEST)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 712546024EA
 for <ltp@lists.linux.it>; Thu,  9 May 2019 12:00:29 +0200 (CEST)
Received: by mail-vs1-f66.google.com with SMTP id o10so1009447vsp.12
 for <ltp@lists.linux.it>; Thu, 09 May 2019 03:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8fw9PcSNlsBtsMjXNuptbK6JHWwpzLG/bXFnVJPgDb4=;
 b=iypx+UDYPjAmqF2+OC74AwifJ6eYFMDTmCRh4DDQd8aOn+lSqsSFZhZUS2JU2hP+oc
 aGygYc6fdVxBoHNd4b8rtBXntOlBEJpaVrkmwvcUdcfpYuiSSdScSUIS7I/TDt76Gz1T
 FI+Fn/9bZZyeWHDVokY2+JrJ/5uMsYrEvzUOZr7rkG1HLomyPyurogswfSgDubkFEio/
 an//brZJKvZyIpk95VJKN5xYjKpb/+RzV/oaYrjlNIZvJX2QzoPTUxg+J66qpjASbe3p
 Kz0FXbGnSpXgAqbao8f5cEUB6XNfcasc3BgtA7AmzfAoYfhjti6gpmxSYTE3sAKyO8MQ
 vnFw==
X-Gm-Message-State: APjAAAUGrlF8fO9rJ3YIQ+REOFXaZ/PdUqZAN8MeayB3847oJdxmthuM
 uP/SwSH2unycRSXYm9kqXMmrSB2ntp4FyFQ06iP9hA==
X-Google-Smtp-Source: APXvYqzHPXIA2S91FE6HdP8njOAZpZ9iSd2qFxXqLEXqoV/n8MzIPXl2QGwhP+BZTdbyWGD/3aUKcvCQkoWzi8AlVDo=
X-Received: by 2002:a67:7241:: with SMTP id n62mr1677184vsc.217.1557396028284; 
 Thu, 09 May 2019 03:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190508084447.18191-1-liwang@redhat.com>
 <20190509071605.GB6096@dhcp-9-109-247-167.in.ibm.com>
 <CAEemH2e=9eRgj_1H50dY_=fEsL3vsZbxexxUceJhW24ebsQ1Kg@mail.gmail.com>
 <20190509091911.GA8751@dhcp-9-109-247-167.in.ibm.com>
In-Reply-To: <20190509091911.GA8751@dhcp-9-109-247-167.in.ibm.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 9 May 2019 18:00:17 +0800
Message-ID: <CAEemH2e6WURWFkMneL6vdEwPpbwxj0Lt=HjpfSYdyzxnhGdODQ@mail.gmail.com>
To: Balamuruhan S <bala24@linux.vnet.ibm.com>, Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 1/2] numa: fix numa test error with
 non-continuous nodes
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1955551599=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1955551599==
Content-Type: multipart/alternative; boundary="0000000000000a82c30588718573"

--0000000000000a82c30588718573
Content-Type: text/plain; charset="UTF-8"

Hi Bala,

On Thu, May 9, 2019 at 5:19 PM Balamuruhan S <bala24@linux.vnet.ibm.com>
wrote:

> [...snip...]
> > > > --- a/testcases/kernel/numa/numa01.sh
> > > > +++ b/testcases/kernel/numa/numa01.sh
> > > > @@ -52,9 +52,18 @@ TST_NEEDS_CMDS="awk bc numactl numastat"
> > > >  extract_numastat_p()
> > > >  {
> > > >       local pid=$1
> > > > -     local node=$(($2 + 2))
> > > > -
> > > > -     echo $(numastat -p $pid |awk '/^Total/ {print $'$node'}')
> > > > +     local node=$2
> > > > +
> > > > +     echo $(numastat -p $pid |               \
> > > > +             awk -v node=$node '/Node/ {     \
> > > > +             gsub("Node", "");               \
> > > > +             for (i=0; i<NF; i++)            \
> > > > +                     if ($i == node)         \
> > > > +                             col=i+1;        \
> > > > +                     next                    \
> > > > +             }                               \
> > > > +             /^Total/ {print $col}'          \
> > > > +     )
> > > >  }
> > >
> > > If we can use extract_numastat_p0 with node_index then the existing
> code
> > > works, for example if can index while iterating $node_list and use this
> > > with extract_numastat_p0 then it should work.
> > >
> >
> > Hi Bala,
> >
> > Sorry, I don't fully understand what's you mean here :(. Could you
> explain
> > something more for this method?
>
> instead of changing `extract_numastat_p0()` can do something like this ?


> diff --git a/testcases/kernel/numa/numa01.sh
> b/testcases/kernel/numa/numa01.sh
> index 33393ac8d..47c18edd6 100755
> --- a/testcases/kernel/numa/numa01.sh
> +++ b/testcases/kernel/numa/numa01.sh
> @@ -94,6 +94,7 @@ setup()
>  test1()
>  {
>         Mem_curr=0
> +       node_index=0
>
>         for node in $nodes_list; do
>                 numactl --cpunodebind=$node --membind=$node support_numa
> alloc_1MB &
> @@ -101,7 +102,8 @@ test1()
>
>                 TST_RETRY_FUNC "check_for_support_numa $pid" 0
>
> -               Mem_curr=$(echo "$(extract_numastat_p $pid $node) * $MB"
> |bc)
> +               Mem_curr=$(echo "$(extract_numastat_p $pid $node_index) *
> $MB" |bc)
> +               let node_index++
>

I guess it can be work, but the disadvantage of that is we have to involve
a new variable(node_index) in each of the tests (from test1 to test10).
Hence I don't think it is much better than my patch. For which way to go,
I'd leave this to Cyril to make a choice. Or, maybe he has different
thoughts on this:).

Anyway, thanks for your suggestion.

-- 
Regards,
Li Wang

--0000000000000a82c30588718573
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Hi Bala,</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 9, 2019 at 5:19 PM=
 Balamuruhan S &lt;<a href=3D"mailto:bala24@linux.vnet.ibm.com">bala24@linu=
x.vnet.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><span class=3D"gmail_default" style=3D"font-size:small">[...s=
nip...]</span><br>
&gt; &gt; &gt; --- a/testcases/kernel/numa/numa01.sh<br>
&gt; &gt; &gt; +++ b/testcases/kernel/numa/numa01.sh<br>
&gt; &gt; &gt; @@ -52,9 +52,18 @@ TST_NEEDS_CMDS=3D&quot;awk bc numactl num=
astat&quot;<br>
&gt; &gt; &gt;=C2=A0 extract_numastat_p()<br>
&gt; &gt; &gt;=C2=A0 {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0local pid=3D$1<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0local node=3D$(($2 + 2))<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0echo $(numastat -p $pid |awk &#39;/^Tot=
al/ {print $&#39;$node&#39;}&#39;)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0local node=3D$2<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0echo $(numastat -p $pid |=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0awk -v node=
=3D$node &#39;/Node/ {=C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsub(&quot;=
Node&quot;, &quot;&quot;);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i=3D0;=
 i&lt;NF; i++)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if ($i =3D=3D node)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0col=3Di+1;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0next=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/^Total/ {p=
rint $col}&#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; If we can use extract_numastat_p0 with node_index then the existi=
ng code<br>
&gt; &gt; works, for example if can index while iterating $node_list and us=
e this<br>
&gt; &gt; with extract_numastat_p0 then it should work.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Hi Bala,<br>
&gt; <br>
&gt; Sorry, I don&#39;t fully understand what&#39;s you mean here :(. Could=
 you explain<br>
&gt; something more for this method?<br>
<br>
instead of changing `extract_numastat_p0()` can do something like this ?</b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/testcases/kernel/numa/numa01.sh b/testcases/kernel/numa/numa01=
.sh<br>
index 33393ac8d..47c18edd6 100755<br>
--- a/testcases/kernel/numa/numa01.sh<br>
+++ b/testcases/kernel/numa/numa01.sh<br>
@@ -94,6 +94,7 @@ setup()<br>
=C2=A0test1()<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Mem_curr=3D0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0node_index=3D0<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for node in $nodes_list; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 numactl --cpunodebi=
nd=3D$node --membind=3D$node support_numa alloc_1MB &amp;<br>
@@ -101,7 +102,8 @@ test1()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TST_RETRY_FUNC &quo=
t;check_for_support_numa $pid&quot; 0<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mem_curr=3D$(echo &=
quot;$(extract_numastat_p $pid $node) * $MB&quot; |bc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mem_curr=3D$(echo &=
quot;$(extract_numastat_p $pid $node_index) * $MB&quot; |bc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0let node_index++<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">I guess it can be work, but the disadvantage of that is we ha=
ve to involve a new variable(node_index) in each of the tests (from test1 t=
o test10). Hence I don&#39;t think it is much better than my patch. For whi=
ch way to go, I&#39;d leave this=C2=A0to Cyril to make a choice. Or, maybe =
he has different thoughts on this:).</div></div><div>=C2=A0</div><div><div =
class=3D"gmail_default" style=3D"font-size:small">Anyway, thanks for your s=
uggestion.</div></div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div di=
r=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div></=
div>

--0000000000000a82c30588718573--

--===============1955551599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1955551599==--
