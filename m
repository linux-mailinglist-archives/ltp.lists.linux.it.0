Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 358CDFAA23
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 07:27:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F1C7B3C2350
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 07:27:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 240DA3C2262
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 07:27:33 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 550351401FD5
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 07:27:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573626451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x1MPyRu1LgHNlcyrkm/pqro4BfAKww6kn9CCsRGsK48=;
 b=N/IGa/OEh+ixQXwg3SCbwHRlC0HnuJuylBxUphOsgSTLjaaNvnpp6CqXDVCWz6HGWv2bzt
 pQ6nWCG4Dwa+7DebtMBG2e6/nDALoqsEQWC76Jl6JQlykmxEIscgRiHhxI45hIDTObf4da
 ony/pXjfNqUAeoNSuclQnFfizs3rsnY=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-CF9-eDXsPFO7Fv9hGhhVPQ-1; Wed, 13 Nov 2019 01:27:28 -0500
Received: by mail-ot1-f69.google.com with SMTP id 15so508298oti.9
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 22:27:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yg1uE9HLW4qlcm8XjJR3IsSmtefs/d3346+Du1JQaqw=;
 b=iKNqGKK0a9Uf4ItBeDgWRWkPCVZjUT/b3TnK/nCFcFKY+KfSzSUvaW2aD5rCULLby1
 26bCSED7yfEui7EmsRGJja+EwLDxMz8brQRp6RIbcjReIZCeJlR53+TxNrlTbEtC1bUb
 g31mvzsgQQAJr50JpUJ8+uW1aJjGz7pjXki5vMV8vcDk+UdituQO/g4JygmVneRbBVpY
 304IlcIvFyqDkYQizyiCaYde8/Zen/z4zrLSrXmHFmlqYuSagpKOHQmNgdh8BarpGcBV
 vyiTBw27JGdGwLIgMXhq56F65q81gc5OZUHUjS/IMTZ88GtuqMnUJq9wmhyOwSMOSFbF
 e6og==
X-Gm-Message-State: APjAAAXfUzsckAgiEs0a8q2TcbDtSr9L6+G1Qc170+nOe4kWbVQOK3+M
 blID0GwBknLpsBrUlcRdwz89h8JcwM1bQovwSYcmfzfLfs20zGiyOluaO2/RbSAYe6Jx2K5sRnJ
 vYRUYo75WnX50BrY98GI6QJ83H/Y=
X-Received: by 2002:aca:3c86:: with SMTP id j128mr1358459oia.153.1573626447417; 
 Tue, 12 Nov 2019 22:27:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqwVi6qQ2C/pUBvZEq0rbd+XZRcUHO9bfaAhbJCqH+MECrqyaY+o28eiQBJO+H69URw28R96xvskYIM0LdrEGGU=
X-Received: by 2002:aca:3c86:: with SMTP id j128mr1358439oia.153.1573626447060; 
 Tue, 12 Nov 2019 22:27:27 -0800 (PST)
MIME-Version: 1.0
References: <20191107153458.16917-1-rpalethorpe@suse.com>
 <20191107153458.16917-2-rpalethorpe@suse.com>
 <CACT4Y+aYVH=e+ZJhF2b-b92dkJZwjnPP4keup509twcQqK+wMg@mail.gmail.com>
 <CAEemH2eVR4U8dHR6anmirX_X5Y3hXKgL4cHxekeVXH_wSHnnpA@mail.gmail.com>
 <87ftitdwjq.fsf@rpws.prws.suse.cz>
 <CAEemH2eAnkr-n+DxtioUY1M3nbLN8sORWO2k2LBgacPTgGMKhA@mail.gmail.com>
In-Reply-To: <CAEemH2eAnkr-n+DxtioUY1M3nbLN8sORWO2k2LBgacPTgGMKhA@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 13 Nov 2019 14:27:16 +0800
Message-ID: <CAEemH2e_8_DZrhA6wSxy68vjv+F+q9fyeHq3RK=3WXC=j+teYg@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
X-MC-Unique: CF9-eDXsPFO7Fv9hGhhVPQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Wrapper for Syzkaller reproducers
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
Cc: Dmitry Vyukov <dvyukov@google.com>, syzkaller <syzkaller@googlegroups.com>,
 LTP List <ltp@lists.linux.it>, Richard Palethorpe <rpalethorpe@suse.com>,
 automated-testing@yoctoproject.org
Content-Type: multipart/mixed; boundary="===============0546072410=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0546072410==
Content-Type: multipart/alternative; boundary="0000000000006337cc05973475fe"

--0000000000006337cc05973475fe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Tue, Nov 12, 2019 at 10:10 PM Li Wang <liwang@redhat.com> wrote:

>
>
> On Tue, Nov 12, 2019 at 10:00 PM Richard Palethorpe <rpalethorpe@suse.de>
> wrote:
>
>> Hello,
>>
>> Li Wang <liwang@redhat.com> writes:
>>
>> >
>> >
>> > Just to try build it in LTP and hit errors:
>> >
>> > # cd ltp-new/
>> > # make autotools
>> > # ./configure --with-syzkaller-repros
>> > # make -j32
>> > ...
>> > error: pathspec '/root/ltp-new/testcases/linux-arts' did not match any
>> > file(s) known to git
>> > make[3]: ***
>> [/root/ltp-new/testcases/kernel/syzkaller-repros/Makefile:26:
>> > /root/ltp-new/testcases/linux-arts/syzkaller-repros/linux] Error 1
>> > make[3]: Leaving directory
>> '/root/ltp-new/testcases/kernel/syzkaller-repros'
>> > make[2]: *** [../../include/mk/generic_trunk_target.inc:93: all] Error=
 2
>> > make[2]: Leaving directory '/root/ltp-new/testcases/kernel'
>> > make[1]: *** [../include/mk/generic_trunk_target.inc:93: all] Error 2
>> > make[1]: Leaving directory '/root/ltp-new/testcases'
>> > make: *** [Makefile:108: testcases-all] Error 2
>> >
>> >
>>
>> What happens if you try to pull the git submodule manually?
>>
> # pwd
> /root/ltp-new
>
> # git submodule update --init testcases/linux-arts
> error: pathspec 'testcases/linux-arts' did not match any file(s) known to
> git
>
>
>>
>> i.e. do git submodule update --init testcases/linux-arts
>>
>> It looks like it failed on the line where it gets the submodule, so I am
>> wondering if you have an old git version?
>
>
> Not sure if that related to git-version, I'm trying to look into it.
>

I have tried many times with different systems but still not working.

My question is did you add the submodule via 'git-submodule add' commands?
or just modify the .gitmodules file by hand?

i.e: `git submodule add
https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-arts.git
testcases/linux-arts`

I don't understand why I can't see the subproject commit-id in your patch.
I have to perform git-submodule-add locally again then it could compile for
me.

i.e:
diff --git a/testcases/linux-arts b/testcases/linux-arts
new file mode 160000
index 0000000..07759b8
--- /dev/null
+++ b/testcases/linux-arts
@@ -0,0 +1 @@
+Subproject commit 07759b820a9cbf01333d861d8eb2613b20d1ede4

Or did I missing anything?

--=20
Regards,
Li Wang

--0000000000006337cc05973475fe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Richard,</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 12, 2019 at 10:10 PM Li Wan=
g &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, Nov 12, 2019 at 10:00 PM Richard Palethorpe &lt;<a href=3D"mailt=
o:rpalethorpe@suse.de" target=3D"_blank">rpalethorpe@suse.de</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@r=
edhat.com</a>&gt; writes:<br>
<br>
&gt;<br>
&gt;<br>
&gt; Just to try build it in LTP and hit errors:<br>
&gt;<br>
&gt; # cd ltp-new/<br>
&gt; # make autotools<br>
&gt; # ./configure --with-syzkaller-repros<br>
&gt; # make -j32<br>
&gt; ...<br>
&gt; error: pathspec &#39;/root/ltp-new/testcases/linux-arts&#39; did not m=
atch any<br>
&gt; file(s) known to git<br>
&gt; make[3]: *** [/root/ltp-new/testcases/kernel/syzkaller-repros/Makefile=
:26:<br>
&gt; /root/ltp-new/testcases/linux-arts/syzkaller-repros/linux] Error 1<br>
&gt; make[3]: Leaving directory &#39;/root/ltp-new/testcases/kernel/syzkall=
er-repros&#39;<br>
&gt; make[2]: *** [../../include/mk/generic_trunk_target.inc:93: all] Error=
 2<br>
&gt; make[2]: Leaving directory &#39;/root/ltp-new/testcases/kernel&#39;<br=
>
&gt; make[1]: *** [../include/mk/generic_trunk_target.inc:93: all] Error 2<=
br>
&gt; make[1]: Leaving directory &#39;/root/ltp-new/testcases&#39;<br>
&gt; make: *** [Makefile:108: testcases-all] Error 2<br>
&gt;<br>
&gt;<br>
<br>
What happens if you try to pull the git submodule manually?<br></blockquote=
><div><div style=3D"font-size:small"></div><div style=3D"font-size:small">#=
 pwd</div>/root/ltp-new<br><br></div><div><div style=3D"font-size:small"># =
git submodule update --init testcases/linux-arts</div><div style=3D"font-si=
ze:small">error: pathspec &#39;testcases/linux-arts&#39; did not match any =
file(s) known to git</div></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
i.e. do git submodule update --init testcases/linux-arts<br>
<br>
It looks like it failed on the line where it gets the submodule, so I am<br=
>
wondering if you have an old git version?</blockquote><div><br></div><div><=
div style=3D"font-size:small">Not sure if that related to git-version, I&#3=
9;m trying to look into it.</div></div></div></div></blockquote><div><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">I have tried man=
y times with different systems but still not working.</div></div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">My question is did you add the submodule=
 via &#39;git-submodule add&#39; commands? or just modify the .gitmodules f=
ile by hand?</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small"><div class=
=3D"gmail_default">i.e: `git submodule add <a href=3D"https://git.kernel.or=
g/pub/scm/linux/kernel/git/shuah/linux-arts.git" target=3D"_blank">https://=
git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-arts.git</a> testcases/=
linux-arts`</div><div></div></div><div><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">I don&#39;t understand why I can&#39;t see the=
 subproject commit-id in your patch. I have to perform git-submodule-add lo=
cally again then it could compile for me. </div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">i.e:</div>diff --git a/testcases/linux-arts b/testcases/l=
inux-arts<br>new file mode 160000<br>index 0000000..07759b8<br>--- /dev/nul=
l<br>+++ b/testcases/linux-arts<br>@@ -0,0 +1 @@<br>+Subproject commit 0775=
9b820a9cbf01333d861d8eb2613b20d1ede4<div><br></div><div><div class=3D"gmail=
_default" style=3D"font-size:small">Or did I missing anything?</div></div><=
div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></d=
iv><div>Li Wang<br></div></div></div></div>

--0000000000006337cc05973475fe--


--===============0546072410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0546072410==--

