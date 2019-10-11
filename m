Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C12D4122
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 15:29:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9FB4C3C22B3
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 15:29:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 7AAB83C1447
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 15:29:01 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9C33A600676
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 15:29:00 +0200 (CEST)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E41FE335E8
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 13:28:58 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id 9so4788552otc.21
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 06:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=juhj4moUBuPGFLRJvo/U90dLzAJA3xg5t3E+Q03Gd/Y=;
 b=XUQ2y69thlWJQkE/XHULlQrzKJ2hoMDWDvzCVETyCfRoVvOSkxaV0TxX6DZTSzb2+S
 +zKbQAX5pPslQ86M91mRQzsCTVdvm7hs47FMxZ0g61A4RtxA81ny7jA89HbYosZassMr
 +sK334TauyBlpm4eFy3NYDQOxCeByptuftPX4q1FHECy/AnliNsiWRoZu/tcmTbHKtrL
 kncuBAuOKW9tOhYvZpOtkb1PcRByF5UOpHRSqFt3P+mwnJty+m2pywhsP1m1zpbC8Pq4
 LOmlITcsOTXmFZZzZr5+X9ixToIWH0mFTM81SE3+nvs0NWtAsqfXd1H5vP0GIw1nfxge
 5V/w==
X-Gm-Message-State: APjAAAX0GCkPg+cM4utInvQr0C5Cjnzkj9EHbBou0ReK5OjxPYcaBt7J
 COpZFRM1gJHVLEvMK+gABu+YcJsNlvVw1KPU5xigQGasA47saXVCc+tyS4IJndhvdtLo91wzS3v
 cmuvDwZ6jDfVo4dFANqm0Y/AQapU=
X-Received: by 2002:a9d:6d89:: with SMTP id x9mr7934759otp.17.1570800538447;
 Fri, 11 Oct 2019 06:28:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxy6eXitJqqbmINNUIQLjGWXtIoO9TgYGtQAmqj8Yybamr3M0iQ72fbCSgHsAJy9aym7VY8IfZAsSg526Zgwc8=
X-Received: by 2002:a9d:6d89:: with SMTP id x9mr7934729otp.17.1570800538155;
 Fri, 11 Oct 2019 06:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191011090737.17997-1-lkml@jv-coder.de>
 <20191011100604.GA11441@dell5510>
 <1570799029.4238.15.camel@suse.de>
In-Reply-To: <1570799029.4238.15.camel@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Fri, 11 Oct 2019 21:28:46 +0800
Message-ID: <CAEemH2fSuRR-7HFeLBMw_6zo2bhWW88ckq468S9XhgzAG_mPFw@mail.gmail.com>
To: cfamullaconrad@suse.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Rename tst_test_* to tst_require_*
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
Content-Type: multipart/mixed; boundary="===============1530126653=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1530126653==
Content-Type: multipart/alternative; boundary="000000000000171c1e0594a28045"

--000000000000171c1e0594a28045
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 11, 2019 at 9:03 PM Clemens Famulla-Conrad <
cfamullaconrad@suse.de> wrote:

> On Fri, 2019-10-11 at 12:06 +0200, Petr Vorel wrote:
> > Hi,
> >
> > Cc: Li and Clemens
> >
> > > these patches rename tst_test_* to tst_require_*, to better
> > > describe
> > > their use. There is also tst_require_root, that has the same
> > > behavior: It also calls tst_brk in case of a failing requirement.
> > > You can also get this patch from the following repo:
> > > https://github.com/MofX/ltp/commits/rename_tst_test-tst_require
> >
> > sorry for not thinking first, I wonder if we want to sync
> > tst_test_* (function name) vs $TST_NEEDS_* (test API variable name),
> > e.g.: tst_require_drivers $TST_NEEDS_DRIVERS
>
> I fully agree with Petr that we must be consistent in naming between
> variable- and function-name.
>

+1


>
> >
> > i.e. either of these:
> > s/tst_test_/tst_needs_/
> > s/TST_NEEDS_/TST_REQUIRE_/
> >
> > I consider *require* as more descriptive than *needs*,
> > but changing to *require* would require more work :).
>
> If we use needs or require ? Hard question - when I search for synonyms
> from one or the other, I don't see a big different. Without looking on
> the impact, require sounds also more descriptive.
>

Yes, I have the same feeling here.

FYI:
  needs: because it's important
  require: because it's a necessity

https://www.englishcurrent.com/grammar/difference-need-require-verbs/

-- 
Regards,
Li Wang

--000000000000171c1e0594a28045
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Oct 11, 2019 at 9:03 PM Clemens Famulla-Con=
rad &lt;<a href=3D"mailto:cfamullaconrad@suse.de">cfamullaconrad@suse.de</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Fri, 2019-10-11 at 12:06 +0200, Petr Vorel wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Cc: Li and Clemens<br>
&gt; <br>
&gt; &gt; these patches rename tst_test_* to tst_require_*, to better<br>
&gt; &gt; describe<br>
&gt; &gt; their use. There is also tst_require_root, that has the same<br>
&gt; &gt; behavior: It also calls tst_brk in case of a failing requirement.=
<br>
&gt; &gt; You can also get this patch from the following repo:<br>
&gt; &gt; <a href=3D"https://github.com/MofX/ltp/commits/rename_tst_test-ts=
t_require" rel=3D"noreferrer" target=3D"_blank">https://github.com/MofX/ltp=
/commits/rename_tst_test-tst_require</a><br>
&gt; <br>
&gt; sorry for not thinking first, I wonder if we want to sync<br>
&gt; tst_test_* (function name) vs $TST_NEEDS_* (test API variable name),<b=
r>
&gt; e.g.: tst_require_drivers $TST_NEEDS_DRIVERS<br>
<br>
I fully agree with Petr that we must be consistent in naming between<br>
variable- and function-name.<br></blockquote><div>=C2=A0</div><div><span cl=
ass=3D"gmail_default" style=3D"font-size:small">+1</span></div><div><span c=
lass=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; i.e. either of these:<br>
&gt; s/tst_test_/tst_needs_/<br>
&gt; s/TST_NEEDS_/TST_REQUIRE_/<br>
&gt; <br>
&gt; I consider *require* as more descriptive than *needs*,<br>
&gt; but changing to *require* would require more work :).<br>
<br>
If we use needs or require ? Hard question - when I search for synonyms<br>
from one or the other, I don&#39;t see a big different. Without looking on<=
br>
the impact, require sounds also more descriptive.<br></blockquote><div><br>=
</div><div><div class=3D"gmail_default" style=3D"font-size:small">Yes, I ha=
ve the same feeling here.</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>FYI:</div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 ne=
eds: because it&#39;s important</div><div class=3D"gmail_default" style=3D"=
font-size:small">=C2=A0 require: because it&#39;s a necessity</div><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small"><a href=3D"https:/=
/www.englishcurrent.com/grammar/difference-need-require-verbs/">https://www=
.englishcurrent.com/grammar/difference-need-require-verbs/</a></div></div><=
div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D=
"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000171c1e0594a28045--

--===============1530126653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1530126653==--
