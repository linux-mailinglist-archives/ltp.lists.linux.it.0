Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 872A7E29A1
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 06:47:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0AAC53C2371
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 06:47:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1E0733C2152
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 06:47:18 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 638D320114A
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 06:47:17 +0200 (CEST)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 028DB4DB1F
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 04:47:15 +0000 (UTC)
Received: by mail-ot1-f69.google.com with SMTP id t10so1757949otk.6
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 21:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9AXm6c+R6lzQ9JrC3AjK6EO73SJ5DaRjWjHRSROnixQ=;
 b=PX1HpgFrMe71C/pKj4c6JQWOL7D8YMfjEam1/21WvfYIDf4rXD80LFvQitSrq02tVX
 jhxqytKs5awVnEIcqoBInIgtHY6IQiGICrnn6j6+P084C7Cq3XD5urq7D+VG5vDk5CDT
 u5EVnhh3rqnCPGV63gXSq/+L98ANWbLtLTbMWka9+++qN5HO8wqSSEH91o6EGdQzyNaF
 vk5JL73ZvP8ez2iJfeKUuy8lPIZj2hhW81txVuIouEzaKT7b30cyfCgXFK5Pabh1ZmY1
 l2t/u172zMKWdVBGDsGPetmfIJgCkv0asMTxJSLV+o3WZ2wAfVASlRQii5tAuiEDsyAM
 KkWA==
X-Gm-Message-State: APjAAAUudp+y8aX5SDDhgOpBAayRB24NErO2sM1p4ktfPlWY0g0uZ9vV
 C/ax8MdfriZ1hU87gH2To9Dz5+4SK0ZrCakGJzRMn2tzni0tJA8BM5WXWaPHWVFoNBt4NqmBqvD
 zoutztz9x2dZyERBG3QsLDBoQshA=
X-Received: by 2002:aca:d508:: with SMTP id m8mr2837099oig.144.1571892434508; 
 Wed, 23 Oct 2019 21:47:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZmSlnDzTbLY/FKZ5nUtuIka6aWP2kBn60pAyr+heokSf5x5HGRcnolGdTBTHhLU1qqGcyXbBvhnEVzMBi5a0=
X-Received: by 2002:aca:d508:: with SMTP id m8mr2837085oig.144.1571892434211; 
 Wed, 23 Oct 2019 21:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <c8843f2f4a325e820d030d9c7c36d7624f1baa82.1571393044.git.jstancek@redhat.com>
 <20191023121901.GA25868@dell5510>
 <463301336.8732968.1571837306503.JavaMail.zimbra@redhat.com>
 <20191023182845.GA2863@x230>
In-Reply-To: <20191023182845.GA2863@x230>
From: Li Wang <liwang@redhat.com>
Date: Thu, 24 Oct 2019 12:47:03 +0800
Message-ID: <CAEemH2dGc-y4yfduw4N=ecwRydXqmEGmG8-eKBxmAxCxL2iEHQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lsmod01.sh: retry test couple times to lower
 false positives
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
Content-Type: multipart/mixed; boundary="===============0984482547=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0984482547==
Content-Type: multipart/alternative; boundary="0000000000002ab0f20595a0ba5e"

--0000000000002ab0f20595a0ba5e
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 24, 2019 at 2:28 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Jan,
>
> > > > - tst_res TPASS "'lsmod' passed."
> > > > +lsmod_test()
> > > > +{
> > > > + for i in $(seq 1 5); do
> > > > +         if lsmod_matches_proc_modules; then
> > > > +                 tst_res TPASS "'lsmod' passed."
> > > > +                 return
> > > > +         fi
> > > > +         tst_res TINFO "Trying again"
> > > > +         sleep 1
> > > > + done
> > > This is similar pattern to TST_RETRY_FUNC()/TST_RETRY_FN_EXP_BACKOFF()
> > > (for both shell and C). I wonder if we also have use for TPASS/TFAIL
> > > instead of just TBROK and specifying number of tries instead of time
> to be
> > > setup.
>
> > I think TFAIL fits more here, it's outcome of what we are testing.
> > TBROK in my mind is failure unrelated to subject of test.
> I express myself wrong. Sure, I meant to have TPASS/TFAIL,
> just to use some helper function instead of writing the wrapper in the
> test.
>
> > But functionally TST_RETRY_FUNC should work too.
>
> > > C and shell usage is a bit different, so maybe
> > > TST_RETRY_FUNC()/TST_RETRY_FN_EXP_BACKOFF() doesn't make much sense
> for shell
>
> > I see it used in mkswap01.sh and numa01.sh.
> Sorry, I searched just TST_RETRY_FN_EXP_BACKOFF.
> Correct, TST_RETRY_FUNC is used there.
>
> > I wonder if we need to TBROK in TST_RETRY_FUNC(). We could just return
> > what the FUNC returns and let the test decide.
> > TST_RETRY_FUNC_BRK() could be a wrapper that TBROKs on timeout.
> That could work (apart from the fact it diverges the functionality from C).
> + there could be the third one, which TPASS/TFAIL (instead of
> nothing/TBROK).
>
> But this should be based on TST_RETRY_FN_EXP_BACKOFF (TST_RETRY_FUNC is
> reusing
> TST_RETRY_FN_EXP_BACKOFF) + add also TST_RETRY_FUNC wrappers.
>
> Do we need similar functionality in C?
>

Not sure, but we could collect the requirement for the EXP_BACKOFF series
macro. I'm also thinking about to extend the functionality for more
situations.

e.g http://lists.linux.it/pipermail/ltp/2019-October/013896.html

-- 
Regards,
Li Wang

--0000000000002ab0f20595a0ba5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Oct 24, 2019 at 2:28 AM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Jan,<br>
<br>
&gt; &gt; &gt; - tst_res TPASS &quot;&#39;lsmod&#39; passed.&quot;<br>
&gt; &gt; &gt; +lsmod_test()<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; + for i in $(seq 1 5); do<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if lsmod_matches_proc_mod=
ules; then<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0tst_res TPASS &quot;&#39;lsmod&#39; passed.&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res TINFO &quot;Tryin=
g again&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sleep 1<br>
&gt; &gt; &gt; + done<br>
&gt; &gt; This is similar pattern to TST_RETRY_FUNC()/TST_RETRY_FN_EXP_BACK=
OFF()<br>
&gt; &gt; (for both shell and C). I wonder if we also have use for TPASS/TF=
AIL<br>
&gt; &gt; instead of just TBROK and specifying number of tries instead of t=
ime to be<br>
&gt; &gt; setup.<br>
<br>
&gt; I think TFAIL fits more here, it&#39;s outcome of what we are testing.=
<br>
&gt; TBROK in my mind is failure unrelated to subject of test.<br>
I express myself wrong. Sure, I meant to have TPASS/TFAIL,<br>
just to use some helper function instead of writing the wrapper in the test=
.<br>
<br>
&gt; But functionally TST_RETRY_FUNC should work too. <br>
<br>
&gt; &gt; C and shell usage is a bit different, so maybe<br>
&gt; &gt; TST_RETRY_FUNC()/TST_RETRY_FN_EXP_BACKOFF() doesn&#39;t make much=
 sense for shell<br>
<br>
&gt; I see it used in mkswap01.sh and numa01.sh.<br>
Sorry, I searched just TST_RETRY_FN_EXP_BACKOFF.<br>
Correct, TST_RETRY_FUNC is used there.<br>
<br>
&gt; I wonder if we need to TBROK in TST_RETRY_FUNC(). We could just return=
<br>
&gt; what the FUNC returns and let the test decide.<br>
&gt; TST_RETRY_FUNC_BRK() could be a wrapper that TBROKs on timeout.<br>
That could work (apart from the fact it diverges the functionality from C).=
<br>
+ there could be the third one, which TPASS/TFAIL (instead of nothing/TBROK=
).<br>
<br>
But this should be based on TST_RETRY_FN_EXP_BACKOFF (TST_RETRY_FUNC is reu=
sing<br>
TST_RETRY_FN_EXP_BACKOFF) + add also TST_RETRY_FUNC wrappers.<br>
<br>
Do we need similar functionality in C?<br></blockquote><div><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Not sure, but we could co=
llect the requirement for the EXP_BACKOFF series macro. I&#39;m also thinki=
ng about to extend the functionality=C2=A0for more situations.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">e.g=C2=A0<a href=3D"http://lists.linu=
x.it/pipermail/ltp/2019-October/013896.html">http://lists.linux.it/pipermai=
l/ltp/2019-October/013896.html</a></div></div><div><br></div>-- <br><div di=
r=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></d=
iv></div></div>

--0000000000002ab0f20595a0ba5e--

--===============0984482547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0984482547==--
