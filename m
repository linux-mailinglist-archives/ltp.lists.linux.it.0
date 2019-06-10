Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 389543B027
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 10:01:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0EA153EB01E
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 10:01:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D802D3EA5C1
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 10:01:45 +0200 (CEST)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 76E831A01070
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 10:01:44 +0200 (CEST)
Received: by mail-ua1-f67.google.com with SMTP id 94so2696724uam.3
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 01:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mwJURAUStQUZs7bF1WT2nZmgj+LjLq4ALIhpoFjrnRY=;
 b=KD9HeFN84t3Ph73elHxrX8laOH8f6udpBoxVS2++fZqPTgQQZUTQSZp53rWfbbDY3L
 aAIOBqvl9rDIhCrM36CyimLrtsL96byO30mMG0iNAYeBe5TlSiSUdd7na37YD7raqQHZ
 soYkJYuAJnvUYlHf6izdiL/5uVogj9IiUgXO1fSLAqMFicJEj6E5k82iYs/zj6xLLSpt
 qVUcA0volWZ0jonpZfMKVeeusWxBbW0uN+IOC9OvtRFPWRMQh25XVIbV7wlz1MPvjGEz
 HRPVhFYc88oyGn04UayFx3yiRQZheRsViyMDx1E2XHgzOQExyoMDOFMUBZSDfbv78T3z
 hHQA==
X-Gm-Message-State: APjAAAW96NiZJE3lA7o4jbC7uuKA3EEu2384XSlwSak8GoaGv4TD+QBv
 9MpKYT7y5Ivf6+7F8oGRJVCsBJ0jvr4+9sbUuJDYvw==
X-Google-Smtp-Source: APXvYqwLh4I3mejt2oJtFYPtiuP28AWS67vQpSHSubs1fzBAmWaXHnYm05shzqYLSx8xI1J+9PbXoBsALLFSsmi69Po=
X-Received: by 2002:ab0:985:: with SMTP id x5mr30949477uag.89.1560153703387;
 Mon, 10 Jun 2019 01:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <f11c83459b71fbf399794fb8363f2b538b0b6346.1559207183.git.caspar@casparzhang.com>
 <5e8374fa7f4ea9d64cdfc39a2ca449761327c257.1559207183.git.caspar@casparzhang.com>
 <CAEemH2eV6RZKdZV0MMuogAzyvoXCsuvrfp3v_1TNtO1cOoAPGA@mail.gmail.com>
 <20190609154038.GA53103@linux.alibaba.com>
In-Reply-To: <20190609154038.GA53103@linux.alibaba.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 10 Jun 2019 16:01:32 +0800
Message-ID: <CAEemH2dX6ESKrS0DnKYDogaTZQwpf9MbOo0W=TS0VnEeN2EbXg@mail.gmail.com>
To: Caspar Zhang <caspar@linux.alibaba.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH 2/3] lib/test.sh: TCONF needs to be counted
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
Content-Type: multipart/mixed; boundary="===============2065660994=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2065660994==
Content-Type: multipart/alternative; boundary="0000000000004934c3058af3971e"

--0000000000004934c3058af3971e
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 9, 2019 at 11:41 PM Caspar Zhang <caspar@linux.alibaba.com>
wrote:

> On Fri, May 31, 2019 at 11:17:14AM +0800, Li Wang wrote:
> >
> >
> > On Thu, May 30, 2019 at 5:10 PM Caspar Zhang <[1]
> caspar@linux.alibaba.com>
> > wrote:
> >
> >     TCONF should also be one of exit statuses in a single test, else the
> >     output of TST_COUNT in shell tests could be wrong.
> >
> >     Wrong:
> >     <<<test_output>>>
> >     memcg_use_hierarchy_test 1 TINFO: Starting test 1
> >     memcg_use_hierarchy_test 1 TINFO: set
> /dev/memcg/memory.use_hierarchy to 0
> >     failed
> >     memcg_use_hierarchy_test 1 TPASS: process 28658 is killed
> >     memcg_use_hierarchy_test 2 TINFO: Starting test 2
> >     memcg_use_hierarchy_test 2 TINFO: set
> /dev/memcg/memory.use_hierarchy to 0
> >     failed
> >     memcg_use_hierarchy_test 2 TCONF: memory.use_hierarchy already been
> 1,
> >     blame systemd, skip
> >     memcg_use_hierarchy_test 2 TINFO: Starting test 3
> >     memcg_use_hierarchy_test 2 TINFO: set
> /dev/memcg/memory.use_hierarchy to 0
> >     failed
> >     memcg_use_hierarchy_test 2 TPASS: echo 0 >
> subgroup/memory.use_hierarchy
> >     failed as expected
> >     <<<execution_status>>>
> >
> >     Right:
> >     <<<test_output>>>
> >     memcg_use_hierarchy_test 1 TINFO: Starting test 1
> >     memcg_use_hierarchy_test 1 TINFO: set
> /dev/memcg/memory.use_hierarchy to 0
> >     failed
> >     memcg_use_hierarchy_test 1 TPASS: process 26825 is killed
> >     memcg_use_hierarchy_test 2 TINFO: Starting test 2
> >     memcg_use_hierarchy_test 2 TINFO: set
> /dev/memcg/memory.use_hierarchy to 0
> >     failed
> >     memcg_use_hierarchy_test 2 TCONF: memory.use_hierarchy already been
> 1,
> >     blame systemd, skip
> >     memcg_use_hierarchy_test 3 TINFO: Starting test 3
> >     memcg_use_hierarchy_test 3 TINFO: set
> /dev/memcg/memory.use_hierarchy to 0
> >     failed
> >     memcg_use_hierarchy_test 3 TPASS: echo 0 >
> subgroup/memory.use_hierarchy
> >     failed as expected
> >     <<<execution_status>>>
> >
> >
> > This is a good catch, but maybe it's not wise to simply regard the TCONF
> as a
> > single test, because there are many system-config detections in setup()
> > function, that will make LTP gives a mendacious report on the test
> numbers if
> > applying this patch.
> >
> > e.g.
> >
> > if tst_kvcmp -lt "3.10"; then
> >     tst_brk TCONF "test must be run with kernel 3.10 or newer"
> > fi
> > if dir path not exist; then
> >     tst_brk TCONF "system does not have xxxx/"
> > fi
> > and so on...
>
> TCONF usually report only once, I would still take it a valid report on
> numbers. Take your case as example, I guess we are able to see results
> like:
>

Okay, that sounds reasonable too.

-- 
Regards,
Li Wang

--0000000000004934c3058af3971e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Jun 9, 2019 at 11:41 PM Caspar Zhang &lt;<a=
 href=3D"mailto:caspar@linux.alibaba.com" target=3D"_blank">caspar@linux.al=
ibaba.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Fri, May 31, 2019 at 11:17:14AM +0800, Li Wang wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Thu, May 30, 2019 at 5:10 PM Caspar Zhang &lt;[1]<a href=3D"mailto:=
caspar@linux.alibaba.com" target=3D"_blank">caspar@linux.alibaba.com</a>&gt=
;<br>
&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0TCONF should also be one of exit statuses in a sing=
le test, else the<br>
&gt;=C2=A0 =C2=A0 =C2=A0output of TST_COUNT in shell tests could be wrong.<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Wrong:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 1 TINFO: Starting test 1<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 1 TINFO: set /dev/memcg/me=
mory.use_hierarchy to 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 1 TPASS: process 28658 is =
killed<br>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 2 TINFO: Starting test 2<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 2 TINFO: set /dev/memcg/me=
mory.use_hierarchy to 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 2 TCONF: memory.use_hierar=
chy already been 1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0blame systemd, skip<br>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 2 TINFO: Starting test 3<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 2 TINFO: set /dev/memcg/me=
mory.use_hierarchy to 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 2 TPASS: echo 0 &gt; subgr=
oup/memory.use_hierarchy<br>
&gt;=C2=A0 =C2=A0 =C2=A0failed as expected<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Right:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;&lt;&lt;test_output&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 1 TINFO: Starting test 1<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 1 TINFO: set /dev/memcg/me=
mory.use_hierarchy to 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 1 TPASS: process 26825 is =
killed<br>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 2 TINFO: Starting test 2<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 2 TINFO: set /dev/memcg/me=
mory.use_hierarchy to 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 2 TCONF: memory.use_hierar=
chy already been 1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0blame systemd, skip<br>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 3 TINFO: Starting test 3<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 3 TINFO: set /dev/memcg/me=
mory.use_hierarchy to 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0memcg_use_hierarchy_test 3 TPASS: echo 0 &gt; subgr=
oup/memory.use_hierarchy<br>
&gt;=C2=A0 =C2=A0 =C2=A0failed as expected<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;&lt;&lt;execution_status&gt;&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; This is a good catch, but maybe it&#39;s not wise to simply regard the=
 TCONF as a<br>
&gt; single test, because there are many system-config detections in setup(=
)<br>
&gt; function, that will make LTP gives=C2=A0a mendacious report on the tes=
t numbers if<br>
&gt; applying this patch.<br>
&gt;<br>
&gt; e.g.<br>
&gt;<br>
&gt; if tst_kvcmp -lt &quot;3.10&quot;; then<br>
&gt; =C2=A0 =C2=A0 tst_brk TCONF &quot;test must be run with kernel 3.10 or=
 newer&quot;<br>
&gt; fi<br>
&gt; if dir path not exist; then<br>
&gt; =C2=A0 =C2=A0 tst_brk TCONF &quot;system does not have xxxx/&quot;<br>
&gt; fi<br>
&gt; and so on...<br>
<br>
TCONF usually report only once, I would still take it a valid report on<br>
numbers. Take your case as example, I guess we are able to see results<br>
like:<br></blockquote><div><br></div><div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><span style=3D"color:rgb(51,51,51);font-family:arial;=
font-size:13px">Okay, that sounds reasonable too.=C2=A0</span></div></div><=
/div><div><br></div>-- <br><div dir=3D"ltr" class=3D"m_4964527189387703313g=
mail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></d=
iv></div></div></div>

--0000000000004934c3058af3971e--

--===============2065660994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============2065660994==--
