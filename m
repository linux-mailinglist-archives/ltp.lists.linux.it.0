Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F94217CE2F
	for <lists+linux-ltp@lfdr.de>; Sat,  7 Mar 2020 13:43:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E14113C62BC
	for <lists+linux-ltp@lfdr.de>; Sat,  7 Mar 2020 13:43:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9BE253C62B8
 for <ltp@lists.linux.it>; Sat,  7 Mar 2020 13:43:06 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 0BAE5600B2C
 for <ltp@lists.linux.it>; Sat,  7 Mar 2020 13:43:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583584983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DBfp/AfuXhlb+/kHUbCuuUObtOsl1h82OPfYbi7Jsjc=;
 b=RzNMLWeh+s4/lvWh6BDUCalT9bdvtgH/xJga3yNCNpCG+IZsiT7LIw5SsMeI9tLxhLYesV
 CPP8+nKGa4mZziCQopmZE+pKvnzlPVdAPHIUCbteN7ZVUzfr6Z+r6qBj/hJ53IGug3ynul
 n2Dzf7UiZuODjfeUf28fXJh+gkpqn30=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-trqHa9jiPl2THdohrbY5ZQ-1; Sat, 07 Mar 2020 07:43:00 -0500
X-MC-Unique: trqHa9jiPl2THdohrbY5ZQ-1
Received: by mail-oi1-f199.google.com with SMTP id u199so734629oie.7
 for <ltp@lists.linux.it>; Sat, 07 Mar 2020 04:43:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k3L7KMOZCit3P2QhS55qiW+dw6OznIQcIqkDiezXw2E=;
 b=sf+XsGVodQZuWCfcM0zy00G3dc7annQ/db4S+ifd14P+mfrj4eP6/MLi+hRkiI2fq1
 ZuQVAanKO0m9kpwbjhi8UGfAwKdZbxGPmqReza6MgrgPeq8RqjR88Y7xnU4LLA7Xb6P8
 k+455yEGWMk6M+x0XPFFxfnXLO38iiOjFXi9QCAQx2cdZY5WwKZUX78xX4o3nvqXNoQ8
 ClQ+pCeu6VizpR7OCxucJGzBlpO0/8W6HIugwQNkOWWtEMl1kqx7MhJ0EPqIUl2mv1An
 H1sy+H9LR4JN3X7J+N1Qqn/mPPEIoKjzJt8I5i3+BEmGDUSZiAtvsQi8k1OzIQztw4YD
 hfgw==
X-Gm-Message-State: ANhLgQ1qT5rIfU6p4rj7oPW4NmoA8LP+38SkhRLYAZD4RUrR5UnNCtYG
 pKRbQWjOQ8pcOoKZjM2rGgqZI+wJemQpVHL6c067xlxrnQdtRnUjVc2dCZzXW5wMNFobEyYy3Uw
 EEmC0urSLLC4bPErg4Mj+8xHwGoM=
X-Received: by 2002:aca:f591:: with SMTP id t139mr835529oih.153.1583584979470; 
 Sat, 07 Mar 2020 04:42:59 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsM48m1YFLJAkk+aWDoYaNf6iYV4mlNXtESWFO9HvD8K3YXlcAg1Qf6lKM9lpkEX3/jtXAUwSSGDwt/ogs3Uz0=
X-Received: by 2002:aca:f591:: with SMTP id t139mr835524oih.153.1583584979280; 
 Sat, 07 Mar 2020 04:42:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <2071e47d7d8cb3e7f8bc6558e86999eddd9c3762.1582779464.git.viresh.kumar@linaro.org>
 <20200306124546.GA3375@rei.lan>
In-Reply-To: <20200306124546.GA3375@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Sat, 7 Mar 2020 20:42:47 +0800
Message-ID: <CAEemH2drJyp5kU21jS7Ej+-q6hTysb5oDNM+3KiWsmPoLAbMQA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 01/10] tst_device: Add tst_is_mounted() helper
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1151160472=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1151160472==
Content-Type: multipart/alternative; boundary="000000000000297df505a0431c50"

--000000000000297df505a0431c50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2020 at 8:45 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> ...
> >
> > +int tst_is_mounted(const char *path)
> > +{
> > +     char cmd[PATH_MAX];
> > +     int ret;
> > +
> > +     snprintf(cmd, sizeof(cmd), "mountpoint -q %s", path);
> > +     ret =3D tst_system(cmd);
>
> I'm not sure that depending on mountpoint command is right choice, there
> are all kinds of embedded systems out there that may be missing it.


Good point, we'd better avoid involving other packages as the dependence of
LTP.


> Also this does not even handle the case that the command is missing.
>
> Looking at the v4 version, all we need is to correctly parse each line
> from from /proc/mounts. I would just use strsep() with space as a
> delimited and took first token that starts with a slash i.e. '/', then
> we can just strcmp() it against the path. Or do I miss something?
>

I'm afraid strcmp() can not satisfy the requirement for us. As you know LTP
creates the MNTPOINT in temp dir that means it could not accurately match
the string path which extracts from /proc/mounts with a slash.

e.g
#define MNTPOINT "fallocate"
...
/dev/loop4 on /tmp/FPp7kh/fallocate type xfs
(rw,relatime,seclabel,attr2,inode64,logbufs=3D8,logbsize=3D32k,noquota)
...
strcmp("/tmp/FPp7kh/fallocate", MNTPOINT) will never ruturn 0 to us.

What I can think of is to use strrchr() to cut the string after last '/',
but that can only work for test mount fs in LTP ways. Other situations
might not satisfy.

--=20
Regards,
Li Wang

--000000000000297df505a0431c50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Mar 6, 2020 at 8:45 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span clas=
s=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt;=C2=A0 <br>
&gt; +int tst_is_mounted(const char *path)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char cmd[PATH_MAX];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0snprintf(cmd, sizeof(cmd), &quot;mountpoint -q %s=
&quot;, path);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D tst_system(cmd);<br>
<br>
I&#39;m not sure that depending on mountpoint command is right choice, ther=
e<br>
are all kinds of embedded systems out there that may be missing it.</blockq=
uote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Good point, we&#39;d better avoid involving other packages as the dependenc=
e of LTP.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Also this does not even handle the case that the command is missing.<br>
<br>
Looking at the v4 version, all we need is to correctly parse each line<br>
from from /proc/mounts. I would just use strsep() with space as a<br>
delimited and took first token that starts with a slash i.e. &#39;/&#39;, t=
hen<br>
we can just strcmp() it against the path. Or do I miss something?<br></bloc=
kquote><div>=C2=A0</div><div><div class=3D"gmail_default" style=3D"font-siz=
e:small">I&#39;m afraid strcmp() can not satisfy the requirement for us. As=
 you know LTP creates the MNTPOINT in temp dir that means it could not accu=
rately match the string path=C2=A0which extracts from /proc/mounts with a s=
lash.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">e.g</div><div class=
=3D"gmail_default" style=3D"font-size:small">#define MNTPOINT &quot;falloca=
te&quot;</div><div class=3D"gmail_default" style=3D"font-size:small">...</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">/dev/loop4 on /tm=
p/FPp7kh/fallocate type xfs (rw,relatime,seclabel,attr2,inode64,logbufs=3D8=
,logbsize=3D32k,noquota)</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">...</div><div class=3D"gmail_default" style=3D"font-size:small">s=
trcmp(&quot;/tmp/FPp7kh/fallocate&quot;, MNTPOINT) will never ruturn=C2=A00=
 to us.=C2=A0</div></div><div><div class=3D"gmail_default" style=3D"font-si=
ze:small"></div></div><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small">What I can think of is to use strrchr() to cut the st=
ring after last &#39;/&#39;, but that can only work for test mount fs in LT=
P ways. Other situations might not satisfy.</div></div><div><br></div></div=
>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wa=
ng<br></div></div></div></div>

--000000000000297df505a0431c50--


--===============1151160472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1151160472==--

